class FastAlien extends Alien{
  FastAlien ( ){ 
    r1 = random(-3, 0); //randomize the direction the alien walks
    r2 = random(0, 3);//randomize the direction the alien walks
    alienSpeed= random(2, 4); //randomize the speed the alien walks
  }
  void display() {
    fill(200, 255, 100); //Alien Yellowsish green
    ellipse(xpos, ypos, 40, 40); //Alien body
    fill(255);
    ellipse(xpos-10, ypos-20, 10, 10); //Alien eye
    ellipse(xpos+10, ypos-20, 10, 10); //Alien eye
    ellipse(xpos, ypos-20, 10, 10); //Alien eye
    fill(0);
    ellipse(xpos-10, ypos-20, 5, 5); //Alien Eyeball
    ellipse(xpos+10, ypos-20, 5, 5); //Alien Eyeball
    ellipse(xpos, ypos-20, 5, 5); //Alien Eyeball
    line(xpos-27, ypos-25, xpos-17, ypos-10); //Alien Left Arm
    line(xpos+27, ypos-25, xpos+17, ypos-10); //Alien Right Arm
     ellipse(xpos, ypos, r2*2, r2*2); //Alien mouth
  }
}