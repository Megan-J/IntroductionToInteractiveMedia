/*

 August 9, 2020
 Final Project DES INV 23: Processing portion
 
 The screen is similar to an experience in a museum. The title screen describes very little about the piece
 with basic instructions for the user. Two parts react to the ambient music and one reacts to the volume 
 in the room. Users can interact with the computer or the robot and change the screen to create their own
 artwork!
 
 Credits: I used the Coding Train's coding challenge of a starfield to create the effect of the moving circles. I also
 used the information found from the sound libraries in Processing. 
 
 */

//----------------Importing Libraries----------------//
import processing.serial.*;
import processing.sound.*;

//--------------Declaring Library Variables--------------//

AudioIn input;  //input from the microphone
Amplitude loudness;  //loudness of the inputs
Waveform waveform;  //waveform analyzer
SoundFile backgroundMusic;  //imports sound file
FFT fft;  //fft analyzer
Serial port;  //port from which the serial is receiving information

//----------------Information from Arduino----------------//
float distance = 0;  //Ultrasonic sensor
float photocellLight = 0;  //Photo cell or photoresistor
float potentiometer = 0;  //Potentiometer

//----------Variables for the Processing Window-----------//
float speed = 0;  //speed at which the circles are moving

int gamestate = 0;  //gamestates to control what the viewer sees

//variables for background gradient
int yAxis = 1;
color c1, c2;

color topColor = 0;
color bottomColor = 0;

//Circles array for circles moving on the screen
Circles[] circles = new Circles[500];

//sets up the welcome text class
welcomeText w;

//----------Variables for Waveform and FFT-----------//

//samples of audio waveform looks at at a time
int samples = 100;  

//bands displayed for FFT
int bands = 64;

//smoothing amount for FFT
float smoothingFactor = 0.2;

//creates an array with the bands
float[] sum = new float[bands];

//how wide the bars are
float barWidth = 0;

//scale for FFT bars
int scale = 5;

//------------------Set Up------------------//

void setup() {

  //canvas size
  size(1000, 750);

  //calls the welcome text
  w = new welcomeText();

  //establishes which port to get information from
  port = new Serial(this, Serial.list()[7], 9600);
  //do not continue to read until new line
  port.bufferUntil('\n');

  //import the audio file
  backgroundMusic = new SoundFile(this, "Ketsa_-_10_-_Memories_Renewed.mp3");
  //reduce volume
  backgroundMusic.amp(0.3);
  //loop the song
  backgroundMusic.loop();

  //create the waveform analyzer and connect to the soundfile
  waveform = new Waveform(this, samples);
  waveform.input(backgroundMusic);

  //create audio analyzer and begin to collect audio
  input = new AudioIn(this, 0);
  input.start();

  //create amplitude analyzer and analyze the input
  loudness = new Amplitude(this);
  loudness.input(input);

  //set bar width for FFT
  barWidth = width/float(bands);

  //creates FFT analyzer and links to sound file
  fft = new FFT(this, bands);
  fft.input(backgroundMusic);

  //create the amount of circles in array
  for (int i = 0; i < circles.length; i++) {
    circles[i] = new Circles();
  }
}

//------------Receive Information from Serial port------------//

void serialEvent(Serial port) {

  //get the string from the serial port
  String inString = port.readStringUntil('\n');

  //if the inString isn't null the
  if (inString != null) {

    //trim white space
    inString = trim(inString);

    //split the information by the commas
    float[] infoFromArduino = float(split(inString, ","));

    //if the length is greater than 3, we have all the information
    if (infoFromArduino.length >= 3) {

      //first piece goes to the distance
      distance = infoFromArduino[0];

      //second piece goes to photocellLight
      photocellLight = infoFromArduino[1];

      //third piece goes to potentiometer
      potentiometer = map(infoFromArduino[2], 0, 1012, 0, 255);
    }
  }
}

//-------------------Draw Function-------------------//

void draw() {

  //run the light synthesis function to change the background
  lightSynthesis();

  //if gamestate = 0, then run title screen
  if (gamestate == 0) {

    //fill for the text
    fill(255, 255);
    //background a solid color
    background(92, 107, 204);
    //run the display function in the WelcomeText class
    w.display();


    //if gamestate = 1, then run the art portion
  } else if (gamestate == 1) {

    //runs background gradient function
    backgroundGradient();

    //runs audio changes function
    audioChanges();

    //runs direction function
    direction();

    //runs soundShapes function
    soundShapes();

    //runs sound frequency function
    soundFrequency();

    //Creates the circles and moves them outwards through the
    //circles class and update and display functions
    pushMatrix();
    translate(width/2, height/2);
    for (int i = 0; i < circles.length; i++) {
      circles[i].update();
      circles[i].display();
    }
    popMatrix();


    //if gamestate is 2 then stop the draw function
  } else if (gamestate == 2) {
    noLoop();
  }
}

//-------------------Background Gradient-------------------//

void backgroundGradient() {
  
  //calls the set gradient function and draws from 
  //the top of the screen to the bottom
  setGradient(0, 0, width, height, topColor, 
    bottomColor, yAxis);
}


//-------------------Set Gradient-------------------//

void setGradient(int x, int y, float w, float h, color c1, 
color c2, int axis ) {

  noFill();

  //Draws lines one at a time while gradually changing the next ones color 
  if (axis == yAxis) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }
}

//-------------------Key Presses-------------------//

void keyPressed() {
  
  //if 'w' is pressed then gamestate is 1
  //and starts the art portion
  if (keyCode == 'W') {
    gamestate = 1;
  }

  //if space bar is pressed then 
  //games state is 2 and pauses the entire window
  if (keyCode == ' ') {
    gamestate = 2;
  }
}

//-------------------Mouse Clicks-------------------//

void mouseClicked() {
  
  //set gamestate to 0 to restart
  gamestate = 0;
  
  //redraw the title screen
  redraw();
  
  //loop the entire program
  loop();
}


//-------------------Audio Input-------------------//

void audioChanges() {
  
  //sets the analysis to a float variable
  float volume = loudness.analyze();
  
  //maps the volume to the movement of the circles
  int rate = int(map(volume, 0, 0.5, 1, 150));
  
  //speed is set to rate
  speed = rate;
}


//-------------------Light Synthesis-------------------//

void lightSynthesis() {

  //if the photo cell gets certain numbers that will in turn
  //the gradient colors of the background
  
  if (photocellLight < 550 && photocellLight >= 0) {
    topColor = color(20, 50, 89);
    bottomColor =  color(74, 121, 181);
  }

  if (photocellLight < 780 && photocellLight > 550) {
    topColor = color(69, 43, 135);
    bottomColor =  color(255, 163, 64);
  }

  if (photocellLight < 1500 && photocellLight > 780) {
    topColor = color(112, 157, 181);
    bottomColor = color(112, 224, 181);
  }
}


//-------------------Direction of Circles-------------------//

void direction() {

  //if robot is moving backwards then the circles
  //move backwards
  
  if (distance < 10) {

    speed = speed*-1;
    
  //if robot is moving forward then the circles
  //move forwards
  } else if (distance >= 10) {

    speed = speed*1;
  }
}


//-------------------Shape Created from Sound File-------------------//

void soundShapes() {

  stroke(255);
  strokeWeight(2);
  noFill();

  // Perform the analysis
  float spectrum[] = waveform.analyze();
  //println(spectrum);

  //draws the shape
  pushMatrix();
  translate(width/2, height/2);
  beginShape();
  for (int i = 0; i < radians(744); i++) {
    
    //determines how the shape moves
    float r =  map(waveform.data[i], -1, 1, 10, height-10);
    
    //determines its radial pattern
    float x = r * cos(i);
    float y = r * sin(i);
    vertex(x, y);
  }
  endShape(CLOSE);
  popMatrix();
}

//-------------------FFT graph-------------------//
void soundFrequency() {

  //performs analysis
  fft.analyze();

  fill(255, 0, 150);
  noStroke();

  //draws the bands across the screen
  for (int i = 0; i < bands; i++) {

    sum[i] += (fft.spectrum[i] - sum[i]) * 0.2;
    rect(i*barWidth, height, barWidth, -sum[i]*height*scale, 5);
  }
}
