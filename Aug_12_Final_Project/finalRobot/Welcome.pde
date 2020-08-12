class welcome {

  //--------------Class variable--------------//

  //loads font and PImage
  PFont font;
  PImage pageBreak;


  //--------------Class Setup--------------//

  welcome() {
    
    //class text formatting
    font = createFont("Nunito", 50);
    textFont(font);
    textAlign(CENTER);
    
    //loading the image into the canvas
    pageBreak = loadImage("PageBreak.png");
    //resizing to fit within canvas
    pageBreak.resize(200, 122);
    //aligned to the center of the image
    imageMode(CENTER);
  }

  //--------------Class Display Function--------------//

  void display() {
    
    //matrix altered by the circle function so 
    //to be safe add the push and pop Matrices here
    
    pushMatrix();
    
    translate(0, 0);

    textSize(70);
    text("Welcome", width/2, 175);

    textSize(45);

    text("Interact with the robot and watch the art come alive!", width/2, 350);

    text("You can speak or play music to continue changing the art piece", width/2, 420);

    image(pageBreak, width/2, 500);

    text("Press the W key to start", width/2, 600);
    text("Press the space bar when finished", width/2, 670);
    text("Click the screen to restart", width/2, 740);

    popMatrix();
  }
}
