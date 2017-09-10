void setup() {
  size(600,400);
  textAlign(CENTER, CENTER);
  background(0,0,100);
  fill(255,230,75);
  text("Processing.js", width/2, height/2);
  noLoop();
}

void draw() {
background(0,0,100);
}

void mouseMoved() {
  stroke(255,0,127);
  fill(255,0,127);
  ellipse(mouseX,mouseY,40,40);
  //point(mouseX, mouseY);
  //redraw();
}
void mouseDragged() {
  stroke(255,0,0);
  fill(255,0,0);
  ellipse(mouseX,mouseY,40,40);
  //redraw();
}

void mousePressed() {
  //line(0,mouseY,width,mouseY);
  //line(mouseX,0,mouseX,height);
  //println(mouseX, mouseY);
  stroke(255,0,127);
  fill(255,0,127);
  ellipse(mouseX,mouseY,60,60);
  redraw();

  
  //alert("alert");
}
void mouseReleased() {

  stroke(255,0,0);
  fill(255,0,0);
  ellipse(mouseX,mouseY,60,60);

}