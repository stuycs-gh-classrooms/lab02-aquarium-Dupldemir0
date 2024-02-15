class Crab extends Animal{
  
  Crab(){
    super(mouseX, mouseY, tankW, tankH);
    crabby = true;
    bottom = height - fishl/2;
  }
  
  void display(){
    fill(255, 0, 0);
    ellipse(fishx, fishy, fishw, fishl);
  }
  
  void bounce(){
    if(dead == false){
    if((fishy + fishl/2) > height && fishvy == 1){
      fishvy *= -1;
      health--;
    }
    if(fishy - fishl/2 < height - floorH && fishvy == -1){
      fishvy *= -1;
      health--;
    }
    if((fishx + fishw/2) > width || fishx - fishw/2 < tankX){
      fishvx *= -1;
      health--;
    }
    for(int i = 0; i < animals.size(); i++) {
      Animal ani = animals.get(i);
      if(dist(this.fishx, this.fishy, ani.fishx, ani.fishy) < 20 && this.fishx != ani.fishx && this.fishy != ani.fishy && ani.crabby == true){
        fishvy *= -1;
        fishvx *= -1;
        health--;
      }
    }
  }
  }
  
}
