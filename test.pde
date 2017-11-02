var buttons = [];

void setup() {
  size(window.innerWidth, window.innerHeight);
}

void draw() {
  // noStroke();
  fill(255, 255, 255, 10);
  rect(1, 1, width, height);
  drawPixels();
}

void drawPixels() {
  let gridSize = 50;
  let ballSize = 50;
  let offset = millis()/10;
  noStroke();

  for (int x = -gridSize; x < width + gridSize; x += gridSize) {
    for (int y = -gridSize; y < height + gridSize; y += gridSize) {
      let mousePos = new Point(mouseX, mouseY);
      let ballPos = new Point(x + offset % gridSize, y);
      let dif = mousePos.clone().sub(ballPos);
      let distance = dif.magnitude();
      let size = ballSize*100/(distance+100);
      dif.setLength(size);

      fill(255 - size*4);
      ellipse(ballPos.x - dif.x, ballPos.y - dif.y, size, size);
    }
  }
}