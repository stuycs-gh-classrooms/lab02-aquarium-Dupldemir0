class Animal{
  int fishx;
  int fishy;
  int fishw;
  int fishl;
  float fishvx;
  float fishvy;
  int health = 60;
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
    rect(fishx, fishy, fishw, fishl);
  }
  
  void move(){
    fishx += fishvx;
    fishy += fishvy; 
  }
  
  void eat(){
    for(int i = 0; i < food.size(); i++) {
      FishFood fo = food.get(i);
      if(dist(this.fishx, this.fishy, fo.x, fo.y) < fishl && !dead){
        fo.eaten = true;
        health += 60;
      }
      if(fo.eaten){
        food.remove(i);
      }
    }
  }
  
  void bounce(){
    if(dead == false){
    if((fishx + fishw/2) > width || fishx - fishw/2 < tankX){
      fishvx *= -1;
      health--;
    }
    if((fishy + fishl/2) > height || fishy - fishl/2 < tankY){
      fishvy *= -1;
      health--;
    }
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
      fishvx = 0;
      if(fishy <= bottom && fishvy != 0){
        fishvy = 1;
      }
      else{
        fishvy = 0;
      }
    }
  }
}
