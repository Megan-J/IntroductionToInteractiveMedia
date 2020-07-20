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
    
  }
   
}
