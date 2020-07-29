class Zombie {

  //--------------------Class variables------------//

  //zombie x-coordinate, y-coordinate, width, and height
  float zombX = 1020;
  float zombY = 560;
  float zombWidth = 100;
  float zombHeight = 128;

  boolean die = false;

  PImage zombieImg;

  //--------------------Class SetUp------------//

  Zombie() { 
    zombieImg = loadImage("zombie.png");  //loads picture into variable
  }

  //--------------------Class Display Function------------//

  void display() {
    image(zombieImg, zombX, zombY, zombWidth, zombHeight);
    walk();  //signals walk function
  }


  //--------------------Class Display Function------------//

  //function to move the zombie across the screen

  void walk() {

    //-----------------------Modifications for 7/29 Assignment-----------------------//
    
    //recieves information from playerMode()

    if (easy == true) {
      
      //makes the zombies move slowly
      zombX = zombX - random(1.0, 2.3);
      
    } else if (hard == true) {
      
      //makes the zombies move faster
      zombX = zombX - random(5, 7);
      
    } else if (extreme == true) {
      
      //makes the zombies move really fast
      zombX = zombX - random(10, 13);
    }
  }
}
