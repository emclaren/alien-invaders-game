class Star {
  float x, y, z;
  float diameter;
  float twinkleSize;

  Star(float starX, float starY, float starSize) {
    x = starX;
    y = starY;
    diameter = starSize;
    twinkleSize=random(-1, 1);
  } 

//Rotate the stars
  void move() {
    rotate(radians(z/PI));
    z++;
  }
  
//Make the stars twinkle by getting bigger/smaller randomly, reset to 0 if thet get too large
  void display() {
    diameter = diameter + twinkleSize;
    ellipse(x, y, diameter, diameter);
    if (diameter > 5 || diameter< -5 ) {
      diameter=0;
    }
  }
}