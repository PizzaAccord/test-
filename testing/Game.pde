import processing.sound.*;
final int TotalLevel = 5;
float[] levelR = {20,50,80,110,130};
ArrayList<Ball> balls;
Physic physic;
boolean gameWin,gameLose;

void setup(){
  noStroke();
  size(400,400);
  background(255);
  gameWin = false;
  gameLose = false;
  balls = new ArrayList<Ball>();
  physic = new Physic();
  
  //import sound file
  fileBall= new SoundFile (this, "Ball.mp3");
}

void draw(){
  for (Ball b:balls){
    physic.applyGravityToBall(b);
    b.update();
    physic.handleBoundaryCollision(b);
  }
  physic.handleBallCollisions(balls);
  
  background(255);
  for (Ball b:balls){
    b.display();
  }
  checkWin();
  if(gameWin){
    text("You Win,press R to restart",200,100);
  }
  checkLose();
  if(gameLose){
    text("You Lose,press R to restart",200,100);
  }
}

//generate ball
void mousePressed(){
  if (!gameWin&&!gameLose){
    //Ball generated at y 140
    balls.add(new Ball(mouseX,140,0));
  }
}


void checkWin(){
  int count = 0;
  for (Ball b:balls){
    if (b.level== TotalLevel-1){
      count ++;
    }
  }
  if(count >=3){
    gameWin = true;
  }
}

void checkLose(){
   for (Ball b: balls) {
     if (b.pos.y-b.r <= 40){
       gameLose = true;
       break;
     }
   }
}

//Click R to restart the game
void keyPressed(){
  if (key == 'r'){
    balls.clear();
    gameWin = false;
    gameLose = false;
  }
}
