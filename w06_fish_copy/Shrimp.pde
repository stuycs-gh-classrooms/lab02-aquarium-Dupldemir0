class Shrimp extends Animal { 
  
  Shrimp(){
    super(mouseX, mouseY, floorH, floorH);
    fishy = height - floorH - (floorH/20);
    bottom = height - floorH;
  }

    void display() {
    fill(255, 185, 195); 
    circle(fishx, fishy, floorH/10);
  }
  
  void move(){
    fishvy = 0;
    super.move();
  }
}
