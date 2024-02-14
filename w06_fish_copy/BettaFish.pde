class BettaFish extends Animal {
  boolean isDarting = false;
  int cooldown;
  int dartCount;
  
  BettaFish() {
    super(mouseX, mouseY, tankW, tankH);
    fishw = tankW/10;
    fishl = tankW/10;
  }
  
  void display(){
    startDart();
    if(isDarting){
      fill(255, 0, 0); 
      square(fishx, fishy, fishw);
    } 
    else{
      fill(25, 150, 255);
      square(fishx, fishy, fishw);
    }
    if(frameCount % 60 == 0){
      cooldown--;
    }
  }
  
  void startDart(){
    if(isDarting == false && random(2) < 0.1 && cooldown <= 0) {
      isDarting = true;
    }
    if(isDarting){
      fishvx = random(1, 4) * int(pow(-1, int(random(2))));
      fishvy = random(1, 4) * int(pow(-1, int(random(2))));
      isDarting = false;
      cooldown = int(random(5, 10));
      fill(255, 0, 0); 
      square(fishx, fishy, fishw);
    }
  }
  
  void bounce(){
    if((fishx + fishw) > width && fishvx > 0){
      fishvx *= -1;
    }
    if(fishx < tankX && fishvx < 0){
      fishvx *= -1;
    }
    if((fishy + fishl) > height - floorH && fishvy > 0){
      fishvy *= -1;
    }
    if(fishy < tankY && fishvy < 0){
      fishvy *= -1;
    }
  }
  
}
