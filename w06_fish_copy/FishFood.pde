class FishFood{
  int x;
  int y;
  int size;
  boolean eaten = false;
  
  FishFood(){
     x = mouseX;
     y = mouseY;
     size = 5;
  }
   
   void display(){
     if(!eaten){
       fill(165, 42, 42);
       circle(x, y, size);
       if(y + size/2 < height){
         y++;
       }
     }
   }
}
