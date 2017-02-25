//Elgin McLaren
//OOP Example
//Alien Invaders game

int score=0; //Set initial score to 0
int numStars = 100; //Set number of stars in the sky
int numframe;
int winScore=10;
color w =255;
color b = 0;


Star[] stars = new Star[numStars]; //Array for number of stars, didn't use an Array List, as the numbers are constant
Sun sun; //Sun Class, extends Stars
ArrayList<Mountain> mountains; //Array list for the mountains on the side of the screen
ArrayList<MountainLeft> mountainsLeft; //Array list for the mountains on the side of the screen
ArrayList<Alien> aliens; //Array list for the quantity of Aliens
ArrayList<FastAlien> fastAliens; //Array list for the quantity of Aliens
ArrayList<Bullet> bullets;//Array list for the number of bullets

Ship spaceShip; //Spaceship class


void setup() {
  size(800, 800);
  spaceShip = new Ship(); //Create the Spaceship
  galaxySetup(); //Create the stars

  //New Empty Arrays for various game elements
  mountains = new ArrayList<Mountain>(); 
  mountainsLeft = new ArrayList<MountainLeft>();
  aliens = new ArrayList<Alien>();
  fastAliens = new ArrayList<FastAlien>();
  bullets = new ArrayList<Bullet>();

  //start game off with one Alien
  aliens.add(new Alien());
}

void draw() {
  frameRate(20);
  background(b);
  introText(); //Introduction text for first 200 frames
  galaxyBkg(); //Stars, Sun & Ground Code for the background
  mountainBkg(); //Moutain background code
  spaceshipCtrl();  //Spaceship code
  bulletCtrl(); //Bullet Code
  aliensCtrl(); //Alien Code
  score();
}

//Make bullets shoot when the mouse buttons is pressed
void mousePressed() {
  bullets.add(new Bullet());
}

//Make intro text appear for first 200 frames
void introText() {
  fill(w);
  textAlign(CENTER);
  if (frameCount<100) {
    text("Look out! We're being invaded...", width/2, height/5);
  } else if (frameCount<=150) {
    text("...click your mouse to fire...", width/2, height/5);
  } else if (frameCount<=200) {
    text("...don't let them get too close.", width/2, height/5);
  }
}

//Create the stars in the sky
void galaxySetup() {
  for (int i = 0; i < numStars; i++) {
    float starX = random(0, width);
    float starY = random(0, height/2);
    float starSize= random(1, 3);
    stars[i] = new Star(starX, starY, starSize);
  }
}

//Make the stars move, create the sun and the planet floor
void galaxyBkg() {
  pushMatrix();//Use pushMatrix so that the whole game doesn't rotate
  for (Star star : stars) {
    star.move();
    star.display();
  }
  popMatrix();
  sun = new Sun(width/2, height/2, 400);
  sun.display();
  fill(w);
  rect(0, height/2, width, height/2); //make the white path for the Aliens to descend on
  fill(b);
  triangle(450, 400, width, height, width, 400);//make the white path for the Aliens to descend on
  triangle(350, 400, 0, height, 0, 400);//make the white path for the Aliens to descend on
}

//Show spaceShip
void spaceshipCtrl() {
  spaceShip.display();
}

void bulletCtrl() {
  //create bullets when you click
  for (int i = bullets.size()-1; i >= 0; i--) { 
    Bullet bullet = bullets.get(i);
    bullet.move();
    bullet.display();
    if (bullet.finished()) {
      bullets.remove(i);
    }

    //Move Alien to the top when you hit it with a bullet
    for (int a = aliens.size()-1; a >= 0; a--) { 
      Alien alien = aliens.get(a);
      if ( bullet.bullety >=  alien.ypos-15  && bullet.bullety <= alien.ypos+15 
        && bullet.bulletx >= alien.xpos-10  && bullet.bulletx <= alien.xpos+10) {
        alien.ypos=height/2;
        alien.xpos=width/2;
        score++;
      }
    }
    //Move Fast Aliens to the top when you hit it with a bullet
    for (int a = fastAliens.size()-1; a >= 0; a--) { 
      FastAlien fastAlien = fastAliens.get(a);
      if ( bullet.bullety >=  fastAlien.ypos-15  && bullet.bullety <= fastAlien.ypos+15 
        && bullet.bulletx >= fastAlien.xpos-10  && bullet.bulletx <= fastAlien.xpos+10) {
        fastAlien.ypos=height/2;
        fastAlien.xpos=width/2;
        score=score+2;
      }
    }
  }
}

void mountainBkg() {
  numframe=frameCount+40;

  //Create Mountains for the righthand side
  for (int i = mountains.size()-1; i >= 0; i--) { 
    Mountain mountain = mountains.get(i);
    mountain.move();
    mountain.display();
  }  
  if (frameCount%80==0) {
    mountains.add(new Mountain( ));
  }
  //Create Mountains for the lefthand side
  for (int i = mountainsLeft.size()-1; i >= 0; i--) { 
    MountainLeft mountainLeft = mountainsLeft.get(i);
    mountainLeft.move();
    mountainLeft.display();
  }  
  if (numframe%80==0) {
    mountainsLeft.add(new MountainLeft( ));
  }
}

void aliensCtrl() {
  //Create a new alien every 30 frames
  for (int i = aliens.size()-1; i >= 0; i--) { 
    Alien alien = aliens.get(i);
    alien.run();
    alien.display();
  }
  if (score<=9 && frameCount%30==0) {
    aliens.add(new Alien());
  }
  //Create a new fast alien every 120 frames
  for (int i = fastAliens.size()-1; i >= 0; i--) { 
    FastAlien fastAlien = fastAliens.get(i);
    fastAlien.run();
    fastAlien.display();
  }
  if (score<=9 && frameCount%120==0) {
    fastAliens.add(new FastAlien());
  }
}

void score() {
  //Keep track of score, you win when you get 10 points.
  fill(w);
  textSize(26);
  text(score, 750, 50); //Write the score in the Upper right hand corner; 
  if (score>= winScore) {
    fill(b, 200);
    rect(40, height/4, width-80, height/2);
    textSize(40);
    textAlign(CENTER);
    fill(w);
    text("You defeated the alien invaders", width/2, height/2);
  }
}