class Animal{
  int fishx;
  int fishy;
  int fishw;
  int fishl;
  int fishvx;
  int fishvy;
  
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
    if((fishx + fishw/2) > width || fishx - fishw/2 < tankX){
      fishvx *= -1;
    }
    if((fishy + fishl/2) > height || fishy - fishl/2 < tankY){
      fishvy *= -1;
    }
  }
}
