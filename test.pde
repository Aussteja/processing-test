var buttons = [];

void setup() {
  size(window.innerWidth, window.innerHeight);
}

void draw() {
  noStroke();
  background(200);
  drawButtons();
}

void mousePressed() {
  let mousePos = new Point(mouseX, mouseY);
  if (!anyButtonPressed(mousePos))
    createButton(mousePos);
}

bool anyButtonPressed(mousePos) {
  for (int i = 0; i < buttons.length; ++i) {
    if (buttonPressed(buttons[i], mousePos)) {
      buttons.splice(i, 1);
      return true; 
    }
  }
  return false;
}

bool buttonPressed(button, mousePos) {
  return mousePos.clone().sub(button.position).magnitude() < button.radius;
}

void createButton(mousePos) {
  let button = {}
  button.position = mousePos.clone();
  button.radius = 30;
  buttons.push(button);
}

void drawButtons() {
  for (int i = 0; i < buttons.length; ++i) {
    fill(255, 150, 150);
    let b = buttons[i];
    ellipse(b.position.x, b.position.y, b.radius, b.radius);
  }
}