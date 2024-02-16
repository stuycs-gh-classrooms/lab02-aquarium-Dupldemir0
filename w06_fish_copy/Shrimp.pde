class Shrimp extends Animal { 
  int size;
  
  Shrimp(){
    super(mouseX, mouseY, floorH, floorH);
    fishy = height - floorH - (floorH/20);
    bottom = height - floorH;
    size = floorH/10;
  }

    void display() {
    fill(255, 185, 195); 
    if(dead){
      fill(0);
    }
    circle(fishx, fishy, size);
  }

  void move(){
    fishvy = 0;
    super.move(); 
  }
  
  void eat(){
    for (int i = 0; i < food.size(); i++) {
      FishFood fo = food.get(i);
      if(dist(this.fishx, this.fishy, fo.x, fo.y) < size && !dead){
        fo.eaten = true;
        health += 60;
        size++;
        fishy = height - floorH - (size/2);
      }
      if(fo.eaten){
        food.remove(i);
      }
    }
  }
  
  void bounce(){
    if(dead == false){
      if((fishx + size/2) > width || fishx - size/2 < tankX){
        fishvx *= -1;
        health--;
      }
    }
  }
}
