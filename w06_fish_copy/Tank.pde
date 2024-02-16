class Tank{
  boolean canSpawnCrab = true;
  
  Tank(int x, int y, int w, int h, int fh){
    tankX = x;
    tankY = y;
    tankW = w;
    tankH = h;
    floorH = fh;
    animals = new ArrayList<Animal>();
    food = new ArrayList<FishFood>();
  }
  
  void display(){
    noStroke();
    fill(#00FFFF);
    rect(tankX, tankY, tankW, tankH);
    fill(#C2B280);
    rect(tankX, height - floorH, tankW, height);
    for (int i = 0; i < animals.size(); i++) {
      Animal ani = animals.get(i);
      ani.display();
    }
    for (int i = 0; i < food.size(); i++) {
      FishFood fo = food.get(i);
      fo.display();
    }
  }
  
  void addAnimal(){
    if(mouseY > height - floorH && typeFish == 1){
      for(int i = 0; i < animals.size(); i++) {
        Animal ani = animals.get(i);
        if(dist(mouseX, mouseY, ani.fishx, ani.fishy) < 20){
          canSpawnCrab = false;
        }
      }
      if(canSpawnCrab){
         animals.add(new Crab());
      }
      canSpawnCrab = true;
    }
    if(mouseY < height - floorH && mouseY > tankY && typeFish == 2){
      animals.add(new Goldfish());
    }
    if(typeFish == 3){
      animals.add(new Shrimp());
    }
    if(mouseY < height - floorH && mouseY > tankY && typeFish == 4){
      animals.add(new BettaFish());
    }
  }
  
  void moveAnimals(){
    for (int i = 0; i < animals.size(); i++) {
      Animal ani = animals.get(i);
      ani.move();
      ani.bounce();
      ani.death();
      ani.eat();
    }
  }
}
