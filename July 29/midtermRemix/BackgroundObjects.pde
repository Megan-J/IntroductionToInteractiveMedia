class BackgroundObjects{

//--------------------Class variables------------//
  
  float xLedge;
  float yLedge;
  
//--------------------Class SetUp------------//

  BackgroundObjects(){
    xLedge = width/2;
    yLedge = height/2;
  }
  
  
//--------------------Class Display Function------------//

  void display(){
 
   //draws planet
   pushMatrix();
   translate(100, 100);
   fill(70, 35, 124);
   ellipse(100, 150, 300, 300);
   stroke(255);
   ellipse(150, 200, 64, 64);
   ellipse(100, 100, 70, 70);
   ellipse(25, 70, 55, 55);
   noStroke();
   popMatrix();
    
  //draws floating rock ledges
  stroke(153, 155, 162);
  fill(153, 155, 162);
  rect(xLedge-400, yLedge+150, 150, 50, 7);
  rect(xLedge-200, yLedge+50, 150, 50, 7);
  rect(xLedge, yLedge-100, 150, 50, 7);
  rect(xLedge+300, yLedge-160, 150, 50, 7);
  rect(xLedge, yLedge+160, 150, 50, 7);
  rect(xLedge+200, yLedge+50, 150, 50, 7);
  
  }
}
