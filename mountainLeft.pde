class MountainLeft extends Mountain { 
  MountainLeft() { 
    leftx = 350;
    lefty = 400;
    midx = 340;
    midy = 325;
    rightx = 330;
    righty = 424;
  }

  //Display the MountainLeft
  void display() {
    fill(255);
    triangle(leftx, lefty, midx, midy, rightx, righty);
  }

  //Move the MountainLeftLefts on the diagonal.
  void move() {
    leftx= leftx-.5;
    lefty= lefty+.571;
    midx = midx-1;
    midy =midy-1;
    rightx =rightx-1;
    righty =righty+1.142;
  }
}