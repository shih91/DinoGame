class Dino{
  float posY = 0;
  float velY = 0;
  float gravity = 0.5;
  float speed = 5;
  
  int size = 20;
  int obstacleTimer = 0;
  int randomAddition = 0;
  int minTimeBetweenObstacles = 70;
  
  float startY = height - 100 - size;
  
  ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
  boolean dead = true;
  
  Dino(){
    addObstacles();
    randomAddition = floor(random(50));
  }
  
  void show(){
    fill(0);
    rectMode(CENTER);
    rect(50, startY - posY , size , size*2 );
    for(int i = 0; i < obstacles.size(); i++){
      obstacles.get(i).show();
    }
  }
  
  void move(){
    obstacleTimer += 1;
    speed += 0.001;
    if(obstacleTimer > minTimeBetweenObstacles + randomAddition){
      addObstacles();
    }
    posY += velY;
    if(posY > 0){
      velY -= gravity;
    }
    else{
      velY = 0;
      posY = 0;
    }
    for(int i = 0; i < obstacles.size(); i++){
      obstacles.get(i).move(speed);
      if ( 50 < ( obstacles.get(i).posX + obstacles.get(i).w ) &&
           ( 50 + size ) > obstacles.get(i).posX &&
           ( startY - posY ) < (obstacles.get(i).getY() + obstacles.get(i).h ) &&
           ( startY - posY + size*2 ) > ( obstacles.get(i).getY() ) ) {
        dead = true;
      }
      if(obstacles.get(i).posX < 0){
        obstacles.remove(i);
        i--;
      }
    }
  }
  
  void addObstacles(){
    Obstacle temp = new Obstacle(floor(random(5)));
    obstacles.add(temp);
    randomAddition = floor(random(50));
    obstacleTimer = 0;
  }
}
