class Circles {

  //--------------Class variables--------------//

  //circle x-coordinate, y-coordinate, direction, and previous direction

  float xCircle;
  float yCircle;
  float direction;
  float pDirection;

  //--------------Class Setup--------------//

  Circles() {
    
    //x-coordinate random across the screen
    xCircle = random(-width, width);
    
    //y-coordinate random across the screen
    yCircle = random(-height, height);
    
    //direction random across the screen
    direction = random(width);
    
    //previous direction = direction
    pDirection = direction;
  }


  //--------------Class Update Function--------------//

  void update() {

    direction = direction - speed;
    
    //if direction is less than 1
    if (direction < 1) {
      
      //reset the direction, x-coordinate, y-coordinate, and pDirection
      direction = width;
      xCircle = random(-width, width);
      yCircle = random(-height, height);
      pDirection = direction;
    }
  }


  //--------------Class Display Function--------------//

  void display() {
    
    //potentiometer determines the color and 
    //transparency of the circles
    
    strokeWeight(1);
    stroke(255);

    float sx = map(xCircle/direction, 0, 1, 0, width);
    float sy = map(yCircle/direction, 0, 1, 0, height);
    
    //if robot is moving forward, the circles go from small to big
    if (speed == speed*1) {
      float r = map(direction, 0, width, 70, 0);
      ellipse(sx, sy, r, r);
      
      //if robot is moving backwards, the circles go from big to small
    } else if (speed == speed*-1) {
      float r = map(direction, 0, width, 0, 70);
      ellipse(sx, sy, r, r);
    }
  }
 
}
