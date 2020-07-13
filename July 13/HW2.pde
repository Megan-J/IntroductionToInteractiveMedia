/* Megan Ju 
DES INV 23
July 13, 2020
Professor Shiloh*/

//these are all my global variables
int repeats = 0; 
float rectX = 0;
float rectY = 0;
int sparkle = 0;

//establishing background color, canvas size, frame rate, and smooth lines
void setup() {
  background(9, 24, 41);
  size(500,500);
  frameRate(4); 
  smooth(8); 
/*I tried to use the smooth function for the
butterfly wings but it didn't seem to work*/
}

/*Instead of writing all my code inside void draw,
I used Austin Chang's method of organizing 
code within separate functions.*/
void draw() { 
  stars();
  rectangleOrganicPattern();
  butterflyTriangles(50, 400);
}



/* was going to add this code in but it 
interfered with the RectangleOrganicPattern function
void mousePressed() {
  if (backgroundColor == 0) {
    backgroundColor = 255;
  } else {
    backgroundColor = 0;
  }
}
 */ 



//Creates shinning stars in the background
void stars(){
  noStroke();
  for (int xEllipse = 250; xEllipse < 500; xEllipse = xEllipse + 20) { //changes ellipse's x-coordinate
    for (int yEllipse = 0; yEllipse < 160; yEllipse = yEllipse + 25) { //changes ellipse's y-coordinate
        // used println(sparkle); to makes sure code was working
      if (sparkle % 2 == 0) { //trying to tell if the variable is odd or even
          fill (255, 251, 201); //if even then fill with yellow
          sparkle++;
        }else { //if odd then fill with black
          fill(0);
          sparkle++;
        }
      ellipse(xEllipse, yEllipse, 5, 5); //finally print the ellipse on the screen
    }
  }
}



/* This function creates the close-knit squares in the background */
void rectangleOrganicPattern() {
  
  /*int repeats = 0; Interesting note: if I declare the variable here 
  the function continues and repeats itself. I tried to 
  re-write the code so that the process would stop after 
  a couple times but it kept repeating itself because the 
  draw function continues*/
  
  while (repeats<100000) {
    //println(repeats); just to see how the function was working with numbers
    stroke(random(255)); //changes the stroke to different grayscale values
    rect (rectX, rectY, 50, 50); 
    /*idea to let the program compute location of the rectangles 
    by using the random function
    from Casey Reas's lecture on Chance Operations*/
    rectX = rectX + sin(random(255));
    rectY = rectY + sin(random(255));
    repeats = repeats + 1;
    } 

}



//Creates the butterflies in the foreground
void butterflyTriangles(int x, int y) {
  
/* The color inspiration for the butterflies are from Erik C's Self-Portrait.
    I liked how he used multiple shades of the same color to represent 
    different facets of his hair*/

  //first butterfly
  stroke(70,44,122);
  strokeWeight(2);
  fill (244, 207, 255);
  pushMatrix();
  translate(x, y); //translate before rotating so that the 
                    //rotation only affects the shape not the grid
  triangle(0, 0, -50, 100, 50, 100);
  rotate(radians(-90));
  fill(225, 185, 237);
  triangle(0, 0, -50, 100, 50, 100);
  rotate(radians(150));
  fill(203, 156, 217);
  triangle(0, 0, -50, 100, 50, 100);
  rotate(radians(100));
  fill(177, 130, 191);
  triangle(0, 0, -50, 100, 50, 100);
  popMatrix();

//first butterfly's antennae
  pushMatrix();
  stroke(255);
  translate(x, y);
  scale(1.5); //scale actually smoothed out one of the antennae
  line(0,0, 50, -50);
  line(0,0, 20, -65);
  popMatrix();

//second butterfly
  stroke(44,81,122);
  pushMatrix();
  translate(233, 276);
  rotate(radians(75));
  fill(168, 225, 247);
  triangle(0, 0, -50, 100, 50, 100);
  rotate(radians(-90));
  fill(132, 198, 224);
  triangle(0, 0, -50, 100, 50, 100);
  rotate(radians(-80));
  fill(119, 178, 201);
  triangle(0, 0, -50, 100, 50, 100);
  rotate(radians(-123));
  fill(217, 244, 255);
  triangle(0, 0, -50, 100, 50, 100);
  popMatrix();
  
//second butterfly's antennae
  pushMatrix();
  stroke(255);
  translate(233, 276);
  scale(1.5);
  line(0,0, 40, -50);
  line(0,0, 10, -65);
  popMatrix();

}
