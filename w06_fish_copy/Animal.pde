class Animal{
  int fishx;
  int fishy;
  int fishw;
  int fishl;
  float fishvx;
  float fishvy;
  int health = 5;
  boolean crabby;
  boolean dead = false;
  int bottom;
  
  Animal(int x, int y, int w, int h){
    fishx = x;
    fishy = y;
    fishw = w/15;
    fishl = h/25;
    fishvx = int(pow(-1, int(random(2))));
    fishvy = int(pow(-1, int(random(2))));
  }
  
  void display(){
    fill(255, 0, 255);
    rect(fishx, fishy, fishw, fishl);
  }
  
  void move(){
    fishx += fishvx;
    fishy += fishvy; 
  }
  
  void bounce(){
    if(dead == false){
    if((fishx + fishw/2) > width || fishx - fishw/2 < tankX){
      fishvx *= -1;
    }
    if((fishy + fishl/2) > height || fishy - fishl/2 < tankY){
      fishvy *= -1;
    }
    health--;
  }
  }
  
  void death(){
    if(frameCount % 60 == 0){
      health--;
    }  
    if(health <= 0){
      dead = true;
    }
    if(dead){
      textAlign(CENTER, CENTER);
      textSize(20);
      fill(0);
      text("X_X", fishx, fishy);
    }
    if(dead){
      fishvx = 0;
      if(fishy != bottom && fishvy != 0){
        fishvy = 1;
      }
      else{
        fishvy = 0;
      }
    }
  }
}
