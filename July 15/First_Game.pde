/* Megan Ju/DES INV 23/July 15, 2020/Professor Shiloh

My original game was going to consist of 
a bouncing ball reaching a door using
separate floating islands. However, I could not
figure out how to alter the code after the ball bounced 
on the first island. 

My new plan consists of a timed maze inspired by the movie
Monsters, Inc. The green square is Mike Wazowski trying to get
to the door through the maze. Other character witness your gameplay
such as Sulley and Roz. */



//Two messages to the player indicating if they have
                                      //won or not
String lose = "GAME OVER"; 
String win = "CONGRATS. YOU WON!";

//Declaring the two imported images
PImage Roz;
PImage Sulley;

//all of my global variables
int blue = 255;
int change = -1;
int xMike = 650;
int yMike = 650;
//int ledgeHeight = 200; for the original design


void setup(){
  size(700,700);  //size of the canvas
  frameRate(30);  //frameRate of the changing background color
  Roz = loadImage("Roz.png"); //loading the image into the canvas
  Roz.resize(200, 200);       //resizing to fit within my game
  Sulley = loadImage("Sulley.png");  //loading another image into the canvas
  Sulley.resize(180, 214);            //resizing to fit within the canvas
}



void draw(){
  
  backgroundColor();
  //bounce(); the function that would have gone with the original idea
  backgroundObjects();
  mikeW();
  gameOver();
}



void backgroundColor (){ //this function changes the background color
                        //and also acts as a timer
  
 //this block of code was taken from Professor Shiloh's 
 //lecture notes, however I altered the code to replicate
 //day turning into night
 
 color myColor = color(0, 0, blue); //defining the color that the pixels would be

  loadPixels(); //taking pixel array from canvas
  for (int i = 0; i < width * height; i++) { //defining each row that will be changed
    pixels[i] = myColor; //changing the color of the pixels in the array
  }
  updatePixels(); //returning the new pixel array

  blue -= change;//altering the amount of blue in the background

  if (blue > 255) {
    change = -change; //inverting the variable so that the loop doesn't stop
  }
  
}




void backgroundObjects(){ //this is the function that draws all the background objects
  
  //door
  strokeWeight(2);
  stroke(29, 97, 82);
  fill(176, 255, 238);
  rect(10, 10, 50, 100);
  fill(0,0,0,0);
  pushMatrix();
  translate(15, 15);
  rect(0, 0, 15, 40);
  rect(23, 0, 15, 40);
  rect(0, 45, 15, 40);
  rect(23, 45, 15, 40);
  popMatrix();
  
  //border
  strokeWeight(10);
  stroke(255);
  rect(0,0,700, 700, 0);
  
  //blocked-off areas
  image(Roz, 10, 500);
  image(Sulley, 500, 10);
   
  //maze lines
  //I chose not to use pushMatrix or popMatrix to transform the rectangles
  //so that I could save writing two to three more lines of code for each couple
  //of rectangles and not reach the limit of uses for push/popMatrix
  rect(500, 600, 10, 100);
  rect(300, 600, 10, 100);
  rect(200, 590, 180, 10);
  rect(600, 550, 100, 10);
  rect(500, 400, 100, 10);
  rect(520, 230, 10, 180);
  rect(420, 300, 10, 180);
  rect(0, 400, 430, 10);
  rect(310, 410, 10, 100);
  rect(150, 250, 10, 150);
  rect(250, 0, 10, 300);
  rect(260, 100, 180, 10);
  rect(120, 125, 130, 10);
  rect(0, 200, 100, 10);
  
  
  
  /* Was going to use this loop to map out the floating islands of previous idea
      but because the draw function constantly repeats I couldn't
  while (ledgeHeight < height) {
    rect(random(700), ledgeHeight, 100, 50);
    ledgeHeight = ledgeHeight + 100;
  }*/  
  
  
}
 

void mikeW(){ //drawing the moving square that represents Mike
  strokeWeight(5);
  stroke(163, 237, 123);
  fill(163, 237, 123);
  rect(xMike, yMike, 25, 25, 3); 
}

void keyPressed(){ //function that determines where Mike should move
                    //based on the keys pressed
                    
 //used the Processing Resources page to figure out how to connect certain keys to actions                   
  if (key == CODED) {
    
    if (keyCode == UP) {//up arrow key
      if (yMike <= 0){ //this is so the character never moves out of the canvas
         yMike = yMike + 0;
       } else  {
          yMike = yMike - 50; //the movement within the canvas space
         }
     } 
   
   else if (keyCode == DOWN) {//down arrow key
     if (yMike >= 650){//insurance that character stays within window
       yMike = yMike + 0;
     } else {
         yMike = yMike + 50;//the direction the character moves in
        }
     } 
   
   else if (keyCode == RIGHT) {//right arrow key
     if (xMike >= 650) {//never moves out of the window
       xMike = xMike + 0;
     } else {
        xMike = xMike + 50;//movement to the right
      } 
   }
   
   else if (keyCode == LEFT) {//left arrow key
      if (xMike <= 0) {//ensures that the player will stay within window
        xMike = xMike + 0;
      } else {
         xMike = xMike - 50;//movement to the left when certain key is pressed
      }
    }
  }
}

void gameOver(){//function for player's gameplay
  
  //Game over
  if (blue <= 0) { //if the background becomes black
    if (xMike > 70) { //and if the player is not within the range of the doorway
                        //in the x-direction
      if (yMike > 100) { //and if the player is not within the range of the doorway
                        //in the y-direction
    PFont f = createFont("MuktaMahee-SemiBold", 40);
    textFont(f, 40);
    color endGameColor = color(255, 0, 0); //red color
    fill(endGameColor);
    textAlign(CENTER);
    text(lose, width/2, height/2);//Game Over displayed
    noLoop();//stop the game all together by stopping the drawing function from repeating
    }
  }
} 
  
  //Or they won
  else if (blue >= 0){//if the background hasn't turned black
    if (xMike < 70) {//and if the player is within the range of the doorway
                      //in the x-direction
      if (yMike < 100){//and if the player is within the range of the doorway
                      //in the y-direction
        PFont f = createFont("MuktaMahee-SemiBold", 40);
        textFont(f, 40);
        color endGameColor = color(0, 255, 0);//green color
    
        fill(endGameColor);
        textAlign(CENTER);
        text(win, width/2, height/2);//Congrats. You won! displayed
        noLoop();//stop the game all together by stopping the drawing function from repeating
}}}
}

  /* The original game was supposed to be
      a ball bouncing on other objects. I
      tried to account for the ball to stop 
      bouncing at a certain height but the code 
      didn't work. 
  
    void bounce() { 
    
    yMike+=speed;
  
    speed+=gravity;
  
    if (yMike>=600) { //this was the height of the 
                          first object
      speed = 0.8 * speed; 
      speed = -speed; 
    } else if (yMike>=500){ //here I tried to stop 
                                the ball from bouncing on
                                   the next object
      speed = 0.8 * speed; 
      speed = -speed; 
    }
    
  }*/
