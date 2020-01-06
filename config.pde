//
//GENERAL CONFIGURATION
//
  int food = 50;
  int creatures = 100;
  int predators = 1;
  //SurviveSec variable takes initial number of seconds for each generation,
  //this number increments each generation by a genIncrement factor
  float surviveSec = 2;
  float secIncrement = 0.05;
  
//
//CREATURE CONFIGURATION
//
  float creatLife = 1000;
  
  int minCreatSize = 5;
  int maxCreatSize = 30;
  
  int minCreatSpeed = 5;
  int maxCreatSpeed = 20;
  //Speed expression
  int speedConf(int size, int minCreatSpeed, int maxCreatSpeed){
    int speed = int(random(minCreatSpeed, maxCreatSpeed+1) - size/10);
    return speed;
  }
  
  //Hunger expression
  float hungerConf(int size, int speedX, int speedY){
    float hunger = (size + ((speedX + speedY)/2))/3;
    return hunger;
  }
  
  //Coefficient by which hunger is multiplied before it is subracted/added to life
  int foodK = 10;
  
  //Mutation Configuration (values indicate + or -)
  int mutSize = 10;
  int mutSpeed = 8;
  
//
//FOOD CONFIGURATION
//
  int minNutrition = 10;
  int maxNutrition = 30;
  
  //Chance of generating poisonous food (numerator and denominator)
  int numPoison = 1;
  int denPoison = 20;
  
//
//PREDATOR CONFIGURATION
//
  int minPredSize = 20;
  int maxPredSize = 45;
  
  int minPredSpeed = 2;
  int maxPredSpeed = 10;
  
  int grownPredSize = 60;
  
   //Chance of generating new predators (numerator and denominator)
  int numPred = 1;
  int denPred = 50;
  
  //Maximum eatable creatures before dying
  int maxEaten = 3;
