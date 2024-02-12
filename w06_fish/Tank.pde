class Tank{
  boolean canSpawnCrab = true;
  
  Tank(int x, int y, int w, int h, int fh){
    tankX = x;
    tankY = y;
    tankW = w;
    tankH = h;
    floorH = fh;
    animals = new ArrayList<Animal>();
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
  }
  
  void addAnimal(){
    if(mouseY > height - floorH){
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
    if(mouseY < height - floorH && mouseY > tankY){
      animals.add(new Goldfish());
    }
  }
  
  void moveAnimals(){
    for (int i = 0; i < animals.size(); i++) {
      Animal ani = animals.get(i);
      ani.move();
      ani.bounce();
    }
  }
}
