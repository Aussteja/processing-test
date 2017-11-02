var buttons = [];

void setup() {
  size(window.innerWidth, window.innerHeight);
}

void draw() {
  // noStroke();
  background(200);
  drawPixels();
}

void drawPixels() {
  let size = 16;
  noStroke();

  for (int x = 0; x < width; x += size) {
    for (int y = 0; y < height; y +=size) {
      fill(x - mouseX, y - mouseY, (1+Math.sin(millis()/100))/2*255);
      rect(x, y, size, size);
    }
  }
}