class BettaFish extends Animal {
  boolean isDarting = false;
  int cooldown;
  int dartCount;
  
  BettaFish(){
    super(mouseX, mouseY, tankW, tankH);
    fishw = tankW/10;
    fishl = tankW/10;
    bottom = height - floorH - fishl;
  }
  
  void display(){
    startDart();
    if(cooldown < 4){
      fill(25, 150, 255);
    }
    else{
      fill(255, 0, 0);
    }
    if(dead){
      fill(0);
    }
    square(fishx, fishy, fishw);
    if(frameCount % 60 == 0){
      cooldown--;
    }
  }
  
  void startDart(){
    if(!dead){
    if(isDarting == false && random(2) < 0.08 && cooldown <= 0) {
      isDarting = true;
    }
    if(isDarting){
      fishvx = random(1, 4) * int(pow(-1, int(random(2))));
      fishvy = random(1, 4) * int(pow(-1, int(random(2))));
      isDarting = false;
      cooldown = int(random(5, 10));
    }
  }
  }
  
  void bounce(){
    if(dead == false){
    if((fishx + fishw) > width && fishvx > 0){
      fishvx *= -1;
      health--;
    }
    if(fishx < tankX && fishvx < 0){
      fishvx *= -1;
      health--;
    }
    if((fishy + fishl) > height - floorH && fishvy > 0){
      fishvy *= -1;
      health--;
    }
    if(fishy < tankY && fishvy < 0){
      fishvy *= -1;
      health--;
    }
  }
  }
  
  void eat(){
    for(int i = 0; i < food.size(); i++) {
      FishFood fo = food.get(i);
      if(dist(this.fishx + fishw/2, this.fishy + fishl/2, fo.x, fo.y) < fishl/2 && !dead){
        fo.eaten = true;
        health += 60;
      }
      if(fo.eaten){
        food.remove(i);
      }
    }
  }
}
