//Class for food objects, only variable value is nutrition
public class Food{
  int posX = int(random(width));
  int posY = int(random(height));
  
  int nutrition = int(random(minNutrition, maxNutrition+1));
  int size = nutrition;
  
  //Colour, is set to Red by default, turns to black only if food is poisonous
  int R = 255;

  public Food(){
    int poison = int(random(numPoison, denPoison+1));
    if (poison == 1){
      nutrition = int(random(-minNutrition, -maxNutrition));
      R = 0;
    }
  }
  
  void display(){
    noStroke();
    fill(R, 0, 0);
    
    circle(posX, posY, size);
  }
  
  void eaten(){
    foodGr.remove(this);
  }
}
