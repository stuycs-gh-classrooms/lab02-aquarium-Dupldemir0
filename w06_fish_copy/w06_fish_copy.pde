Tank t;
int tankX = 0;
int tankY = 50;
int floorH = 100;
int tankW;
int tankH;
ArrayList<Animal> animals;
ArrayList<FishFood> food;
int typeFish;


void setup() {
  size(600, 600);
  tankW = width;
  tankH = height - 50;
  t = new Tank(tankX, tankY, tankW, tankH, floorH);
  t.display();
}//setup


void draw() {
  background(150);
  t.moveAnimals();
  t.display();
  fill(0);
  textSize(20);
  textAlign(LEFT, TOP);
  text("Press 1 for Crabs, Press 2 for Goldfish, \nPress 3 for Shrimp, Press 4 for Betta Fish.", 0, 5);
  textAlign(RIGHT, TOP);
  text("Number Selected: " + typeFish, width, 5);
}

void mousePressed(){
  food.add(new FishFood());
}

void keyPressed(){
  if(key == '1'){
    typeFish = 1;
    t.addAnimal();
  }
  if(key == '2'){
    typeFish = 2;
    t.addAnimal();
  }
  if(key == '3'){
    typeFish = 3;
    t.addAnimal();
  }
  if(key == '4'){
    typeFish = 4;
    t.addAnimal();
  }
}
