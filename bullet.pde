class Bullet {
  float bulletx;
  float bullety;
  float speed;
  Bullet() {
    bulletx = mouseX;
    bullety = height-50;
    speed = 15;
  }  
  void move() {
    bullety = bullety - speed;
  }
  //make bullet dissappear when it gets halfway up the screen
  boolean finished() {
    if (bullety<500) {
      return true;
    } else {
      return false;
    }
  }
  void display() {
    fill(b);
    ellipse(bulletx, bullety, 3, 3);
  }
}