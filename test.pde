var points = [];
var rotatingPoints = [];
var lastMillis = 0;

void setup() {
  size(window.innerWidth, window.innerHeight);
}

void draw() {
  noStroke();
  //background(0);
  fill(0, 0, 0, 20);
  rect(1, 1, width, height);

  if (mouseButton == LEFT)
    addPoint();
  else
    changePoints();
  drawPoints();
  updatePoints();
  drawRotatingPoints();

  if (points.length > 1000)
    points.splice(0, 1);
  if (rotatingPoints.length > 1000)
    rotatingPoints.splice(0, 1);

  lastMillis = millis();
}

void addPoint() {
    let p = {}
  rotatingPoints.push(p);
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

  // let dt = (millis() - lastMillis)/1000;
  // let mouseV = new Point(mouseX - pmouseX, mouseY - pmouseY);
  // mouseV.multiplyScalar(1/dt);

  // if (Math.random() + mouseV.magnetude()/500 < 0.9)
  //   return;

  // let p = {}
  // points.push(p);
  // p.position = new Point(mouseX, mouseY);

  // let angle = -Math.random()*Math.PI;
  // let speed = 300*Math.random();
  // let vx = Math.cos(angle)*speed;
  // let vy = Math.sin(angle)*speed;
  // p.velocity = new Point(vx, vy);

  // p.velocity.add(mouseV);

  // p.initialTime = millis();

  // let r = Math.random()*100 + 155;
  // let g = Math.random()*r*0.5;
  // let b = g;
  // // let g = Math.random()*100 + 155;
  // // let b = Math.random()*100 + 155;
  // p.color = color(r, g, b);
}

void changePoints() {
  for (int i = 0; i < rotatingPoints.length; ++i) {
    let p = {}
    let rp = rotatingPoints[i];

    let dt = millis() - rp.initialTime;
    let edt = 1 - Math.exp(-dt*0.002);
    let distance = edt*300;
    let x0 = rp.x + distance*Math.cos(rp.angle + dt*0.0001 + edt);
    let y0 = rp.y + distance*Math.sin(rp.angle + dt*0.0001 + edt);

    dt += 1;
    edt = 1 - Math.exp(-dt*0.002);
    distance = edt*300;
    let x1 = rp.x + distance*Math.cos(rp.angle + dt*0.0001 + edt);
    let y1 = rp.y + distance*Math.sin(rp.angle + dt*0.0001 + edt);

    p.position = new Point(x0, y0);
    p.velocity = new Point(x1-x0, y1-y0).multiplyScalar(1000);
    p.color = rp.color;

    points.push(p);    
  }
  rotatingPoints = [];
}

void drawPoints() {
  for (int i = 0; i < points.length; ++i) {
    let p = points[i];
    let c = p.color;
    let speed = p.velocity.magnitude();
    let k = Math.exp(-speed * 0.001);
    c = lerpColor(color(255), c, k);
    fill(c);
    ellipse(p.position.x, p.position.y, 10, 10);
  }
}

void drawRotatingPoints() {
  for (int i = 0; i < rotatingPoints.length; ++i) {
    let p = rotatingPoints[i];

    let dt = millis() - p.initialTime;
    let edt = 1 - Math.exp(-dt*0.002);
    let distance = edt*300;
    let x = p.x + distance*Math.cos(p.angle + dt*0.0001 + edt);
    let y = p.y + distance*Math.sin(p.angle + dt*0.0001 + edt);
    fill(p.color);
    ellipse(x, y, 10, 10);
  }
}

void updatePoints() {
  let dt = (millis() - lastMillis)/1000;
  let mouseV = new Point(mouseX - pmouseX, mouseY - pmouseY);
  mouseV.multiplyScalar(1/dt);

  for (int i = 0; i < points.length; ++i) {
    let p = points[i];
    p.position.add(p.velocity.clone().multiplyScalar(dt));
    p.velocity.y += dt*p.position.y;

    if (p.position.x < 0 || p.position.x > width) {
      p.velocity.x *= -1;
    } else if (p.position.y < 0 || p.position.y > height) {
        p.velocity.y *= -1;
    }
    p.velocity.add(mouseV.clone().multiplyScalar(dt));
    p.velocity.multiplyScalar(1-dt*0.3);
  }
}