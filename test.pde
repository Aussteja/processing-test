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
  let dt = (millis() - lastMillis)/1000;
  let mouseV = new Point(mouseX - pmouseX, mouseY - pmouseY);
  mouseV.multiplyScalar(1/dt);

  if (Math.random() + mouseV.magnetude()/500 < 0.9)
    return;

  let p = {}
  points.push(p);
  p.position = new Point(mouseX, mouseY);

  let angle = -Math.random()*Math.PI;
  let speed = 300*Math.random();
  let vx = Math.cos(angle)*speed;
  let vy = Math.sin(angle)*speed;
  p.velocity = new Point(vx, vy);

  p.velocity.add(mouseV);

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
    let c = p.color;
    let speed = p.velocity.magnetude();
    let k = Math.exp(-speed * 0.001);
    c = lerpColor(color(255), c, k);
    fill(c);
    ellipse(p.position.x, p.position.y, 10, 10);
  }
}

void updatepoints() {
  let dt = (millis() - lastMillis)/1000;
  let mouseV = new Point(mouseX - pmouseX, mouseY - pmouseY);
  mouseV.multiplyScalar(1/dt);

  for (int i = 0; i < points.length; ++i) {
    let p = points[i];
    p.position.add(p.velocity.clone().multiplyScalar(dt));
    p.velocity.y += dt*300;

    if (p.position.x < 0 || p.position.x > width) {
      p.velocity.x *= -1;
    } else if (p.position.y < 0 || p.position.y > height) {
        p.velocity.y *= -1;
    }
    p.velocity.add(mouseV.clone().multiplyScalar(dt));
    p.velocity.multiplyScalar(1-dt*0.3);
  }
}