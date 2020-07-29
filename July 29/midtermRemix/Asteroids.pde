class Asteroids {

  //--------------------Class variables------------//

  PImage asteroid;

  //asteroid x-coordinate, y-coordinate, width, and height
  float astX = random(100, 600);
  float astY = -100;
  float astWidth = 105;
  float astHeight = 98;

  boolean die = false;


  //--------------------Class SetUp------------//

  Asteroids() {
    asteroid = loadImage("asteroid.png"); //loads picture into variable
  }

  //--------------------Class Display Function------------//

  void display() {
    image(asteroid, astX, astY, astWidth, astHeight);  //loads the picture
    fall();  //signals the fall function
  }

  //--------------------Class Fall Function------------//

  //function to move the asteroid from the top of the screen to the bottom

  void fall() {

    if (astY < -98) {
      astX  = random(100, 600);
    }

    //-----------------------Modifications for 7/29 Assignment-----------------------//

    //recieves information from playerMode()
    
    if (easy == true) {
      
      //makes the asteroids move slowly
      astY = astY + random(0.5, 1.0);
      
    } else if (hard == true) {
      
      //makes the asteroids move faster
      astY = astY + random(2, 4);
      
    } else if (extreme == true) {
      
      //makes the asteroids move really fast
      astY = astY + random(10, 18);
    }
  }
}
