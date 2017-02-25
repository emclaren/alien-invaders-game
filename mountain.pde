class Mountain { 
  float leftx;
  float lefty;
  float midx;
  float midy;
  float rightx;
  float righty;

  Mountain() { 
    leftx = 450;
    lefty = 400;
    midx = 460;
    midy = 325;
    rightx = 470;
    righty = 424;
  }

  //Display the mountains
  void display() {
    fill(255);
    triangle(leftx, lefty, midx, midy, rightx, righty);
  }

  //Move the mountains on the diagonal.
  void move() {
    leftx= leftx+.5;
    lefty= lefty+.571;
    midx = midx+1;
    midy =midy-1;
    rightx =rightx+1;
    righty =righty+1.142;
  }
}