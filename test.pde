var points = [];

void setup() {
  size(window.innerWidth, window.innerHeight);
}

void draw() {
  noStroke();
  background(0);

  if (mouseButton == LEFT)
    addpoint();
    drawpoints();

  if (points.length > 1000)
    points.splice(0, 1);
}

void addpoint() {
  let p = {}
  points.push(p);
  p.x = mouseX;
  p.y = mouseY;
  p.angle = Math.random()*Math.PI*2;
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

    let dt = millis() - p.initialTime;
    let edt = 1 - Math.exp(-dt*0.002);
    let distance = edt*300;
    let x = p.x + distance*Math.cos(p.angle + dt*0.0001 + edt);
    let y = p.y + distance*Math.sin(p.angle + dt*0.0001 + edt);
    fill(p.color);
    ellipse(x, y, 10, 10);
  }
}

