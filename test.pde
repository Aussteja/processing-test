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
      if (Math.random() > 0.5)
        buttons.splice(i, 1);
      else
        buttons[i].radius *= 2;
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
    let b = buttons[i];
    fill(255 - 2000/b.radius, 150, 150);
    ellipse(b.position.x, b.position.y, b.radius*2, b.radius*2);
  }
}