class Ship { 
  float ypos;
  Ship( ) { 
    ypos = height;
  }
  void display() {
    stroke(0);
    fill(200);
    translate(1, 1);
    triangle(mouseX-50, ypos, mouseX, ypos-50, mouseX+50, ypos);
  }
}