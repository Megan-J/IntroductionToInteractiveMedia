//establishing canvas and basic background of the sky
size(500, 500);
background(204, 255, 255);

//basic clouds
noStroke();
//used noStroke() to remove lines around the ellipses to make the groups of ellipses into clouds

fill(255);

//first cloud
ellipse(300, 60, 64, 64);
ellipse(340, 45, 64, 64);
ellipse(340, 62, 64, 64);
ellipse(380, 30, 64, 64);
ellipse(380, 60, 64, 64);
ellipse(410, 60, 64, 64);

//second cloud
ellipse(420, 170, 64, 64);
ellipse(460, 150, 64, 64);
ellipse(460, 170, 64, 64);
ellipse(480, 120, 64, 64);
ellipse(480, 170, 64, 64);

//first tree
//keeping noStroke() for same effect for triangles
//but to make each triangle line up with the others I used stroke(0) and then deleted the line once finished with each tree
fill(0, 102, 0);
triangle(72.5, 70, 35, 175, 113, 175);
triangle(72.5, 100, 20, 245, 130, 245);
triangle(72.5, 130, -13.5, 350, 170, 350);
triangle(72.5, 160, -40, 450, 210, 450);

//second tree
//used stroke(0); to measure triangles on screen
fill(0, 153, 51);
triangle(115, 30, 83, 135, 147, 135);
triangle(115, 80, 70, 195, 158, 195);
triangle(115, 130, 57, 265, 175, 265);
triangle(115, 160, 20, 360, 214, 360);
triangle(115, 200, -30, 473, 269, 473);
triangle(115, 250, -40, 500, 300, 500);

//third tree
//used stroke(0); to measure triangles on screen again
fill(0, 204, 102);
triangle(190, 50, 120, 175, 280, 175);
triangle(190, 100, 90, 280, 325, 280);
triangle(190, 150, 60, 390, 375, 390);
triangle(190, 200, 20, 495, 435, 495);
triangle(190, 250, -7, 510, 450, 510);

//begining to draw myself

//hair
fill(77, 40, 0);
ellipse(290, 200, 250, 250);
rect(175, 215, 229, 240);

//arms
stroke(0);
line(230, 390, 180, 270);
line(350, 390, 400, 270);

//shirt
fill(225);
rect(230, 290, 120, 160);

//pants
fill(0, 102, 204);
rect(230, 450, 120, 200);

//face
fill(255, 191, 128);
ellipse(290, 200, 200, 200);

//eyes
fill(255);
ellipse(240, 190, 50, 72);
ellipse(340, 190, 50, 72);
fill(0);
ellipse(240, 190, 35, 60);
ellipse(340, 190, 35, 60);

//noStroke for the shine in the eyes 
noStroke();
fill(255);
ellipse(240, 170, 16, 16);
ellipse(340, 170, 16, 16);


//mouth
stroke(0);
fill(255, 204, 204);
arc(290, 230, 80, 80, 0, PI, CHORD);
