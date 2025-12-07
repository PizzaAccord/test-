class Ball{
  int level;
  PVector pos;
  float r;
  PVector speed;
  color c;
  
  //Initialize ball
  Ball (float x,float y,int level){
    pos = new PVector(x,y);
    speed = new PVector(0,0);
    this.level = level;
    if (this.level>4){
      //restriction level
      this.level = 4;
    }
    //set balls colour
    if (level == 0)      c = color(135, 206, 250); //bule，1
    else if (level == 1) c = color(144, 238, 144);//green，2
    else if (level == 2) c = color(255, 215,   0); //yellow，3
    else if (level == 3) c = color(255, 140,   0);//orange,4
    else c = color(220,  20,  60);//red，5
    r = levelR[this.level];
  }
  //Update the position of each frame
  void update(){
    pos.add(speed);
  }
  
  //draw ball
  void display(){
    fill(c);
    circle(pos.x,pos.y,r);
  }
}
