//Class for the creatures, speed is random but biased by size.
//Hunger (the rate at which life decreases) depends on speed.
public class Creature {
  int size = int(random(minCreatSize, maxCreatSize+1));

  int posX = int(random(width));
  int posY = int(random(height));

  int speedX = speedConf(size, minCreatSpeed, maxCreatSpeed);
  int speedY = speedConf(size, minCreatSpeed, maxCreatSpeed);

  float life = creatLife;
  float hunger = hungerConf(size, speedX, speedY);

  public Creature() {
  }

  public Creature(int childSize, int childSpeedX, int childSpeedY) {
    size = childSize + int(random(mutSize, -(mutSize)+1));
    speedX = childSpeedX + int(random(mutSpeed, -(mutSpeed)+1));
    speedY = childSpeedY + int(random(mutSpeed, -(mutSpeed)+1));
  }

  void display() {
    noStroke();
    fill(255, 165, 0);

    posX += speedX;
    posY += speedY;

    if (posX > width || posX < 0) {
      speedX *= -1;
    }

    if (posY > height || posY < 0) {
      speedY *= -1;
    }

    circle(posX, posY, size);
  }

  void calcHunger() {
    life -= hunger;

    if (life <= 0) {
      creatGr.remove(this);
    }
  }

  void eat(Food food) {
    int distance = int(dist(posX, posY, food.posX, food.posY));
    int radius = food.nutrition/2 + size/2;

    if (distance <= radius) {
      life += food.nutrition*foodK;
      food.eaten();
    }
  }

  void reproduce() {
    Creature child1 = new Creature(this.size, this.speedX, this.speedY);
    Creature child2 = new Creature(this.size, this.speedX, this.speedY);

    childGr.add(child1);
    childGr.add(child2);
  }
}
