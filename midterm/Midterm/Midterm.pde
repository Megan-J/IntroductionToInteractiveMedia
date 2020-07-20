/* 
 This game is to gain the most points by touching the most objects flying across space.
 Zombies, UFOs, and Asteroids oh my! Move around the screen using the 'a' (to go left), 
 'd' (to go right), and space bar (to fly) keys. Be aware that this foreign planet continues 
 to have gravity so make sure to use that space bar to get off the ground. Never let any of the
 creates or asteroids get past you and make it to the left side or bottom of the screen. Try to 
 touch the most objects to get the highest score!
 
 All art is done by me. However, all the sound clips are from soundbible.com. The noise when the player
 and object colide is called "Bleep Sound" by Mike Koenig, the noise when the player jumps is called
 "Jump Sound" by snottyboy, the game over noise is called "Electrical Sweep Sound" by Sweeper, and the noise
 when the player takes a step in the left or right direction is called "Mario Jumping Sound" by Mike Koenig.
 The font is called 222 03 from 1001fonts.com
 
 */

//--------------------Variables------------//

//variables for the background gradient function
int Y_AXIS = 1;
color c1, c2;

//initializing the classes into variables so that
//it is easier to call the functions in the different
//classes
Asteroids a;
BackgroundObjects b;
Score s;
UFO u;
Zombie z;
Player p;

//importing the movie and initializing the class to a variable
import processing.video.*;
Movie mov;

//global booleans for the game
boolean gameOver = false;
boolean jump = false;
boolean aKey = false;
boolean dKey = false;

//importing the sound and initializing variables for the different
//sound files
import processing.sound.*;
SoundFile playerJump;
SoundFile gameOverSong;
SoundFile step;
SoundFile point;


//-------------------SetUp----------------------------//

void setup() {

  //canvas size
  size(1000, 700);

  //setting the mov variable to the movie and initializing the loop
  //function for the movie
  mov = new Movie(this, "endCard.mp4");
  mov.loop();

  //setting the soundfile variables to their corresponding soundfiles
  playerJump = new SoundFile(this, "jump.mp3");
  gameOverSong = new SoundFile(this, "game over.mp3");
  step = new SoundFile(this, "step.wav");
  point = new SoundFile(this, "point.wav");

  //font for the game over text
  PFont f = createFont("a2203", 32);
  textFont(f, 32);

  //setting the variables equal to calling the classes
  b = new BackgroundObjects();
  p = new Player();
  s = new Score();
  u = new UFO();
  z = new Zombie();
  a = new Asteroids();
}


//----------------Draw----------------//

void draw() {

  //calling the background function to display gradient color
  background();

  //determines what happens to the enemies(zombies, UFOs, and asteroids)
  enemylocation();

  //displays background objects (floating rocks and background planet)
  b.display();

  //displays score in the top left corner and updates the score when
  //player earns point
  s.display();

  //begins gravity function and imposes gravity on player
  p.gravity();

  //draws the player and allows the player to change sprite
  p.player();

  //draws the UFOs and allows them to fly
  u.display();

  //draws the zombies and lets them walk
  z.display();

  //draws asteroids and makes them fall
  a.display();

  //determines if player touches the enemies and triggers 
  //what happens next
  touch();

  //displays video and instructs the player to click the screen to
  //start over
  gameOver();
}


//-------------------------------Background-------------------------//

void background() {

  //creates a vertical gradient between my two colors
  setGradient(0, 0, width, height, color(255, 230, 185), 
    color(196, 146, 198), Y_AXIS);

  //used the pixels array to determine where to draw the line for the 
  //ground
  color black = color(0, 0, 0);
  loadPixels();
  for (int i = width*650; i < (width + width*650); i ++) {
    pixels[i] = black;
  }
  updatePixels();

  //created a rectangle to fill the rest of the space
  fill(0);
  rect(-10, 650, 1010, 50);
}


//-----------------------Gradient Function-----------------------//

//used the Processing resources page to figure out how to make the background
//a gradient

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  //Draws lines one at a time while gradually changing the next ones color 
  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }
}

//-----------------------Keyboard Presses-----------------------//

void keyPressed() { 

  //if the user presses the space bar then the boolean jump
  //is true and the player will jump and a noise will play with it
  //at half of its volume

  if (keyCode == ' ') {
    jump = true;
    playerJump.amp(0.5);
    playerJump.play();
  }

  //if the user presses the 'd' key then the boolean dKey
  //is true and the player will jump and a noise will play with it
  //at half of its volume
  if (keyCode == 'D') {
    dKey = true;
    step.amp(0.5);
    step.play();
  }

  //if the user presses the 'a' key then the boolean dKey
  //is true and the player will jump and a noise will play with it
  //at half of its volume
  if (keyCode == 'A') {
    aKey = true;
    step.amp(0.5);
    step.play();
  }
}

//keyReleased is to make the player stop jump/walking
//when the user is no longer pressing the key

void keyReleased() {
  if (keyCode == ' ') {
    jump = false;  //stops the player from being able to jump
  }
  if (keyCode == 'D') {
    dKey = false;  //stops the player from being able to walk in the
    //right direction
  }
  if (keyCode == 'A') {
    aKey = false;  //stops the player from being able to walk in the
    //left direction
  }
}



//-----------------------Collisions-----------------------//

void touch() {
  
  //determines if the player is within the vicinity of the zombie
  if (p.playerX + p.playerWidth - 70 > z.zombX && p.playerX  - 25 < z.zombX 
    && p.playerY + p.playerHeight - 50 > z.zombY) {
      
    s.score ++;    //increases the score by one
    z.die = true;  //the die boolean in the zombie class is true
    point.amp(0.5);  //the noise will play with half of its volume
    point.play();
    
  }
  
  //determines if the player is within the vicinity of the UFO
  if (p.playerX + p.playerWidth - 70 > u.UFOx && p.playerX + 25 < u.UFOx + u.UFOwidth
    && p.playerY - 70 < u.UFOheight + u.UFOy && p.playerY + p.playerHeight - 100 > u.UFOy) {
    
    s.score ++;  //increases the score by one
    u.die = true;  //die boolean in UFO class is true
    point.amp(0.5); //the noise will play wth half of its volume
    point.play();
    
  }
  
  //determines if the player is within the vicinity of the asteroids
  if (p.playerX + p.playerWidth - 70 > a.astX && p.playerX + 25 < a.astWidth + a.astX 
    && p.playerY - 100 < a.astHeight + a.astY && p.playerY + p.playerHeight - 120 > a.astY) {
   
    s.score ++;  //increases the score by one
    a.die = true;  //die boolean in asteroids class is true
    point.amp(0.5);  //the noise will play wth half of its volume
    point.play();
    
  }
}


//-----------------------Determines the location of all the enemies-----------------------//

void enemylocation() {
  
  //if the boolean die for zombies isn't true then the zombie will continue to walk
  if (!z.die) {
    z.display();
  } 
  
  //if the boolean die for zombies is true, then the zombies is transported
  //off screen, the boolean is then set back to its original value, and the zombie
  //walks across the screen again
  else {
    z.zombX = random(1000, 2000);
    z.die = false;
    z.display();
  }

  //if the boolean die for UFOs isn't true then the UFO will continue to fly
  if (!u.die) {
    u.display();
  } 
  
  //if the boolean die for UFO is true, then the UFO is transported
  //off screen, the boolean is then set back to its original value, and the UFO
  //flys across the screen again
  else {
    u.UFOx = random(1000, 1400);
    u.die = false;
    u.display();
  }

  //if the boolean die for Asteroids isn't true then the asteroid will continue to fall
  if (!a.die) {
    a.display();
  } 
  
  //if the boolean die for Asteroids is true, then the asteroid is transported
  //off screen, the boolean is then set back to its original value, and the asteroid
  //falls down the screen again
  else {
    a.astY = -200;
    a.die = false;
    a.display();
  }

  //if any of the creatures or objects move across the screen to the side the player is 
  //supposed to protect, then the game ends
  if (u.UFOx < -100 || z.zombX < -100 || a.astY > 695) {
    gameOver = true;
  }
}


//-----------------------Game Over-----------------------//

void gameOver() {

  //only acts when the gameOver boolean is true
  if (gameOver == true) {
    gameOverSong.amp(0.4); //play song at 1/4 it's original volume
    gameOverSong.play();  //play song

    //pauses the other noises so they do not
    //play during the end screen
    playerJump.pause();
    step.pause();

    //plays movie
    mov.read();
    mov.speed(100);
    image(mov, 0, 0, 1000, 700);
    
    //shows message and further instructions on the screen
    textSize(64);
    fill(255);
    text("You lost. Try again?", width/2, height/2+ 10);
    textSize(30);
    text("click to play again", width/2, height/2 + 60);
  }
}

//-----------------------Restart the Game-----------------------//

void mouseClicked() {
  
  //only acts when gameOver boolean is true and the mouse is clicked
  if (gameOver == true) {
    
    gameOverSong.pause(); //stops the gameOver song from playing
    
    //resets all booleans and variables to match the start of the
    //game's booleans and variables
    gameOver = false;
    s.score = 0;
    p.playerX = 50;
    p.playerY = 580;
    u. UFOx = 1400;
    u. UFOy = 50;
    u.die = false;
    z.zombX = 1200;
    z.zombY = 560;
    z.die = false;
    a.astX = random(600);
    a.astY = -1000;
    a.die = false;
    
    //redraws the begining screen to truly reset the game
    redraw();
  }
}
