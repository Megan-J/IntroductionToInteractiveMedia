class UFO{
  
//--------------------Class variables------------//
  PImage UFO;
  
  //UFO x-coordinate, y-coordinate, width, and height
  float UFOx = 1400;
  float UFOy = 50;
  float UFOwidth = 150;
  float UFOheight = 120;
  
  boolean die = false;
  
  
//--------------------Class SetUp------------//
  
  UFO(){
    UFO = loadImage("UFO.png"); //loads picture into variable
    
  }
  
    
//--------------------Class Display Function------------//
  
  void display(){
    image(UFO, UFOx, UFOy, UFOwidth, UFOheight);
    fly();  //signals fly function
  }
  
//--------------------Class Fly Function------------//
  
  //function to move the UFO across the screen
  void fly(){
   
    UFOx = UFOx - random(1, 3); //picks a random value to change the speed by
    
    if (UFOx > 1000){
      UFOy = random(50, 400); //spawns UFO in a random y position
    }
  }
  
}
