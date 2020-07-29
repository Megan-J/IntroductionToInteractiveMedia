class Player {

  //--------------------Class variables------------//

  //player x-coordinate, y-coordinate, width, and height
  float playerX = 50;
  float playerY = 580;
  float playerWidth = 105;
  float playerHeight = 120;

  //gravity, velocity, and speed of the player
  float playerGravity = 0.5;
  float playerVelocity = 0;
  float playerSpeed = 5;

  //image array of the different faces of the player
  int changeSprite;
  PImage[] playerImage = new PImage[4];


  //--------------------Class SetUp------------//

  Player() {

    //sets different images to different objects in the array
    playerImage[0] = loadImage("astronaut1.png");
    playerImage[1] = loadImage("astronaut2.png");
    playerImage[2] = loadImage("astronaut3.png");
  }

  //--------------------Class Player Function------------//

  void player() {

    playerMovement();
    
    //displays character image based on the changeSprite value
    image(playerImage[changeSprite], playerX, playerY, playerWidth, playerHeight); 
    
    nextPlayerFace();
  }
  

  //--------------------Class PlayerMovement Function------------//
  
  void playerMovement() {
    
    //moves the player to the left if the player is not out of the canvas
    if (aKey & playerX != 0) {
      playerX = playerX - playerSpeed;
    }
    
    //moves the player to the right if the player is not out of the canvas
    if (dKey & playerX != width - playerWidth) {
      playerX = playerX + playerSpeed;
    }
    
    //calls jump function if the player is not out of the canvas
    if (jump & playerY != 0) {
      jump();
    }
  }


  //--------------------Class Next Players Face Function------------//
  void nextPlayerFace() {

    //changes the player's look based off of the boolean that changes to be true
    //if a certain key is pressed
    
    if (jump == true) {
      changeSprite = 2;
    }
   
    if (dKey == true) {
      changeSprite = 0;
    }
    
    if (aKey == true) {
      changeSprite = 1;
    }
  }


  //--------------------Class Jump Function------------//
  
  void jump() {
    playerVelocity = -5;
    playerY = playerY + playerVelocity;
  }


  //--------------------Class Gravity Function------------//
  
  void gravity() {
    playerY = playerY + playerVelocity;
    playerVelocity = playerVelocity + playerGravity;
    playerY = constrain(playerY, 0, 580); //Saw that Chearim used the constrain function
                                          //to keep the character within certain
                                          //boundaries of the canvas
  }
}
