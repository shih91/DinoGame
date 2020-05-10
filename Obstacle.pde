class Obstacle{
  float posX;
  int w;
  int h;
  int type;
  
  Obstacle(int t){
    type = t;
    switch(type){
      case 0: //Small Cactus
      w = 15;
      h = 30;
      break;
      case 1: //Big Cactus
      w = 25;
      h = 50;
      break;
      case 2: //Small Cactuses
      w = 45;
      h = 30;
      break;
    }
    posX = width;
  }
  
  void show(){
    fill(0);
    rectMode(CENTER);
    rect(posX , height - 100 - h/2 , w , h);
  }
  
  int getY(){
    return height - 100 - h/2;
  }
  
  float getX(){
    return posX;
  }
  
  void move(float speed){
    posX -= speed;
  }
}
