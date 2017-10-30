var points = [];
var lastMillis = 0;

void setup() {
  size(window.innerWidth, window.innerHeight);
}

void draw() {
  noStroke();
  background(0);

  if (mouseButton == LEFT)
    addpoint();
    drawpoints();
    updatepoints();

  if (points.length > 1000)
    points.splice(0, 1);

  lastMillis = millis();
}

void addpoint() {
  let p = {}
  points.push(p);
  p.position = new Point(mouseX, mouseY);

  let angle = -Math.random()*Math.PI;
  let speed = 300;
  let vx = Math.cos(angle)*speed;
  let vy = Math.sin(angle)*speed;
  p.velocity = new Point(vx, vy);

  p.initialTime = millis();

  let r = Math.random()*100 + 155;
  let g = Math.random()*r*0.5;
  let b = g;
  // let g = Math.random()*100 + 155;
  // let b = Math.random()*100 + 155;
  p.color = color(r, g, b);
}

void drawpoints() {
  for (int i = 0; i < points.length; ++i) {
    let p = points[i];
    fill(p.color);
    ellipse(p.position.x, p.position.y, 10, 10);
  }
}

void updatepoints() {
  let dt = (millis() - lastMillis)/1000;
  for (int i = 0; i < points.length; ++i) {
    let p = points[i];
    p.position.add(p.velocity.clone().multiplyScalar(dt));
    p.velocity.y += dt*300;
  }
}