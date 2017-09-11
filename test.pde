int xPos=300;
int xDir=1;
int yPos=200;
int yDir=1;

void setup() {
  size(600,400);
  textAlign(CENTER, CENTER);
  background(0,0,100);
  fill(255,230,75);
  text("Processing.js", width/2, height/2);
  //noLoop();
}

void draw() {
  background(0,0,100);
  stroke(255,0,127);
  fill(255,0,127);
  ellipse(mouseX,mouseY, 30, 30);
  ellipse(xPos,200,60,60);
    xPos=xPos+xDir;
  if (xPos>width-30 || xPos<30)
  {
    xDir=-xDir;
  }
  stroke(255,0,0);
  fill(255,0,0);
  ellipse(300,yPos,60,60);
    yPos=yPos+yDir;
  if (yPos>height-30 || yPos<30)
  {
    yDir=-yDir;
  }
     int m = millis();
  stroke(0,255,0);
  fill(0,255,0);
    ellipse(m%width,m%height,60,60);

    int s = second()*10;
  stroke(0,100,0);
  fill(0,100,0);
    ellipse(s,300,m%60,60);


}

//void mouseMoved() {
  //stroke(255,0,127);
  //fill(255,0,127);
  //ellipse(mouseX,mouseY,40,40);
  //point(mouseX, mouseY);
  //redraw();
//}
