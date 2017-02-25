class Alien { 
  float xpos;
  float ypos;
  float r1;
  float r2;
  float alienSpeed;

  Alien( ) { 
    xpos = 400; //Start in the middle
    ypos = 400; //Start in the middle
    r1 = random(-4, 0); //randomize the direction the alien walks
    r2 = random(0, 4); //randomize the direction the alien walks
    alienSpeed= random(1, 2);//randomize the alien speed
  }

  void display() {
    fill(130, 255, 130);//Alien green
    ellipse(xpos, ypos, 10, 30); //Alien body
    ellipse(xpos, ypos-15, 10, 10); //Alien head
    line(xpos-10, ypos-10, xpos-5, ypos-5); //Alien left arm
    line(xpos+10, ypos-10, xpos+5, ypos-5); //Alien right arm
  }

  void run() {
    ypos = ypos + alienSpeed;
    if (score<=9) {
      xpos =  xpos+ random(r1, r2); //Walk like this when the game is playing
    }
    if (score>= winScore) {
      alienSpeed=-2; //Aliens fly away if you score 10 points.
    }
    //If Alien gets to the bottom of the screen, you lose
    if (score<winScore && ypos> height) {
      fill(20, 0, 0, 50);
      rect(40, height/4, width-80, height/2);
      fill(w);
      textSize(80);
      text("Game Over", width/2, height/2);
      score=0;
    }
  }
}