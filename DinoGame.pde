Dino dino;
void setup(){
  size(800,400);
  dino = new Dino();
  dino.addObstacles();
  
  
}

void draw(){
  background(255);
  line(0, height - 100, width , height - 100);
  if(!dino.dead){
    dino.move();
  }
  dino.show();
}

void keyPressed(){
  switch(key){
    case ' ':
      if(dino.dead){
        dino.dead = false;
      }
      if(dino.posY == 0.0){
        dino.velY = 10;
      }
  }
}
