public class Predator{
  int size = int(random(minPredSize, maxPredSize+1));
  
  int posX = int(random(width));
  int posY = int(random(height));
  
  int speedX = int(random(minPredSpeed, maxPredSpeed+1));
  int speedY = int(random(minPredSpeed, maxPredSpeed+1));
  
  int eaten = 0;
  
  boolean kill(Creature prey){
    int distance = int(dist(posX, posY, prey.posX, prey.posY));
    int radius = prey.size/2 + size/2;
    
    if(distance <= radius && size >= prey.size) {
      if(size < grownPredSize){
        size += prey.size/2;
        eaten++;
      }
      else{
        int prob = int(random(numPred, denPred+1));
        if(prob == 1){
          Predator john = new Predator();
          predGr.add(john);
        }
      }
      if(eaten == maxEaten){
          this.dead();
          return true;
      };
      prey.life = 0;
      prey.calcHunger();
      killedCount++;
    }
    return false;
  }
  
  void display(){
    noStroke();
    fill(0, 100, 0);
    
    posX += speedX;
    posY += speedY;
    
    if(posX > width || posX < 0){
      speedX *= -1;
    }
    
    if(posY > height || posY < 0){
      speedY *= -1;
    }
    
    circle(posX, posY, size);
  }
  
  void dead(){
    predGr.remove(this);
  }
}
