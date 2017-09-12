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

    //circle that moves along x axis
    xPos=xPos+xDir;
    if (xPos>width-30 || xPos<30)
    {
     xDir=-xDir;
    }
    stroke(255,0,0);
    fill(255,0,0);
    ellipse(300,yPos,60,60);

    //circle that moves along y axis
    yPos=yPos+yDir;
    if (yPos>height-30 || yPos<30)
    {
      yDir=-yDir;
    }

    //circle that moves diagonaly
     int m = millis();
    stroke(0,255,0);
    fill(0,255,0);
    ellipse(m%width,m%height,60,60);

    // circle that moves every 2 sec along x axis
    int s = second();
    int s1 = s-1;

    if (s%2==0) {
      stroke(0,100,0);
      fill(0,100,0);
      ellipse(s*10,300,m%60,60);}
    else  {
      stroke(0,100,0);
      fill(0,100,0);
      ellipse(s1*10,300,m%60,60);
    }

  // Fill affects text color
  fill(255,255,255);
  // Show how many seconds there are. It is not since startup, but the seconds from computer's clock: https://processing.org/reference/second_.html
  text("second() " + second().toString(), width/2, 10);
  // Show how many milliseconds are from the startup: https://processing.org/reference/millis_.html
  text("millis() " + millis().toString(), width/2, 20);
  // Seconds from startup :)
  text("Math.floor(millis() / 1000) " + (Math.floor(millis() / 1000)).toString(), width/2, 30);
}

//void mouseMoved() {
  //stroke(255,0,127);
  //fill(255,0,127);
  //ellipse(mouseX,mouseY,40,40);
  //point(mouseX, mouseY);
  //redraw();
//}
