var points = [];

void setup() {
  size(600,400);
}

void draw() {
  noStroke();
  background(200);

  if (mouseButton == LEFT)
    addpoint();
    drawpoints();
}

void addpoint() {
  let p = {}
  points.push(p);
  p.x = mouseX;
  p.y = mouseY;
  p.angle = Math.random()*Math.PI*2;
  p.initialTime = millis();
}

void drawpoints() {
  for (int i = 0; i < points.length; ++i) {
    let p = points[i];

    let dt = millis() - p.initialTime;
    let distance = (1 - Math.exp(-dt*0.002))*200;
    let x = p.x + distance*Math.cos(p.angle);
    let y = p.y + distance*Math.sin(p.angle);
    fill(255);
    ellipse(x, y, 10, 10);
  }
}

