class welcomeText {

  //--------------Class variable--------------//
  
  PFont font;
  
  
  //--------------Class Setup--------------//
  
  welcomeText() {
    font = createFont("Nunito", 50);
    textFont(font);
  }

//--------------Class Display Function--------------//

  void display() {
    pushMatrix();
    translate(0, 0);

    textSize(50);
    text("Welcome", 395, 200);

    textSize(32);
    text("Interact with the robot and watch the art come alive!", 120, 300);
    text("You can speak or play music to continue changing the art piece", 50, 350);
    text("Press the W key to start", 327, 450);
    text("Press the space bar when finished", 276, 500);
    text("Click the screen to restart", 327, 600);

    popMatrix();
  }
}
