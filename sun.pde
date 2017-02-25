class Sun extends Star {
  Sun(float starX, float starY, float starSize) {
    super(starX, starY, starSize);
  }
  void display() {
    fill(255, 255, 255, 200+random(-10, 10));
    ellipse(x, y, diameter, diameter);
  }
}