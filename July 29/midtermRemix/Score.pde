class Score{
  
//--------------------Class variable------------//
  int score = 0;
  
//--------------------Class SetUp------------//
  
  //setting up the font for the score message
  Score(){
    PFont f = createFont("a2203", 32);
    textFont(f, 32);
  }
  
//--------------------Class Display Function------------//
  
  void display(){
    
    color myFavoriteColor = color(52, 82, 150);
    fill(myFavoriteColor);
    textAlign(CENTER);
    text("Score: " + str(score), 100, 50); //prints the score in the top left
                                           //corner
    
    //-----------------------Modifications for 7/29 Assignment-----------------------//
    
    //displays the gamemode difficulty on the top right of the screen 
    //based on the boolean information the class recieves from playerMode()
    
    if (easy == true) {
      text("Difficulty: Easy", 830, 50);
    } else if (hard == true) {
      text("Difficulty: Hard", 830, 50);
    } else if (extreme == true) {
      text("Difficulty: Extreme", 810, 50);
    }
    
  }
   
}
