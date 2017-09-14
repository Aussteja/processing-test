int xPos=300;
int xDir=1;
int yPos=200;
int yDir=1;

int step = 0;
int period = 4000;

boolean switchState = false;
int switchCounter = 0;

int buttonX;
int buttonY;
int buttonWidth = 120;
int buttonHeight = 30;

void setup() {
  size(600,400);
  textAlign(CENTER, CENTER);
  background(0,0,100);
  fill(255,230,75);
  text("Processing.js", width/2, height/2);

  buttonX = width / 2 - buttonWidth / 2;
  buttonY = height / 2 - buttonHeight / 2;
  //noLoop();
}

void draw() {
  noStroke();
  background(0,0,100);
  mouseX < width / 2 ? fill(255,0,127) : fill(0,255,127);
  ellipse(mouseX,mouseY, 30, 30);
  ellipse(xPos,200,60,60);

  //circle that moves along x axis
  xPos=xPos+xDir;
  if (xPos>width-30 || xPos<30)
  {
   xDir=-xDir;
  }
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
  fill(0,255,0);
  ellipse(m%width,m%height,60,60);

  if (step * period < millis()){
    step = step + 1;
  }
  int t = step;

  fill(0,100,0);
  ellipse(t*50,300,m%60,60);

  if (isMouseOverButton(mouseX, mouseY)) {
    fill(50, 100, 50);
  }
  rect(buttonX, buttonY, buttonWidth, buttonHeight);
  fill(255, 100, 187);
  ellipse(mouseX, mouseY, 5, 5);

  // Fill affects text color
  fill(255,255,255);
  // Show how many seconds there are. It is not since startup, but the seconds from computer's clock: https://processing.org/reference/second_.html
  text("second() " + second().toString(), width/2, 10);
  // Show how many milliseconds are from the startup: https://processing.org/reference/millis_.html
  text("millis() " + millis().toString(), width/2, 20);
  // Seconds from startup :)
  text("Math.floor(millis() / 1000) " + (Math.floor(millis() / 1000)).toString() + " [" + (millis() / 1000 % 1).toFixed(2) + "]", width/2, 30);
  // Pairs ofm seconds from startup :)
  text("Math.floor(millis() / 2000) " + (Math.floor(millis() / 2000)).toString() + " [" + (millis() / 2000 % 1).toFixed(2) + "]", width/2, 40);
  // Print current step
  text("Step: " + step, width/2, 50);
  // Button state
  text("SWITCH " + (switchState ? "ON" : "OFF"), width / 2 , 60);
  text("SWITCH Count: " + switchCounter, width/2, 70);
  // Mouse position
  text("Mouse [" + mouseX + ";" + mouseY + "]", width/2, 80);
}

// rect(buttonX, buttonY, buttonWidth, buttonHeight);
boolean isMouseOverButton(mX, mY){
  return mX > buttonX && mX < buttonX + buttonWidth && mY > buttonY && mY < buttonY + buttonHeight;
}

void mousePressed() {
  if (isMouseOverButton(mouseX, mouseY)) {
    switchState = !switchState;
    switchCounter = switchCounter + 1;
  }
}

//void mouseMoved() {
  //stroke(255,0,127);
  //fill(255,0,127);
  //ellipse(mouseX,mouseY,40,40);
  //point(mouseX, mouseY);
  //redraw();
//}
