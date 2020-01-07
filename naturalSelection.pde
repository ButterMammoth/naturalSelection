//
//Natural Selection Experiment
//Copyright (c) Rolando Charles 2020
//

import java.text.DecimalFormat;

//Unchangeable variables
int surviveCount = 0;
int genCount = 1;
int killedCount = 0;

//Creature and food lists initialization
ArrayList<Creature> creatGr = new ArrayList<Creature>();
ArrayList<Creature> childGr = new ArrayList<Creature>();
ArrayList<Food> foodGr = new ArrayList<Food>();
ArrayList<Predator> predGr = new ArrayList<Predator>();

void setup(){
  //size(1000, 800);
  fullScreen();
  background(255);
  
  //Creature list generation
  for(int i = 0; i < creatures; i++){
    Creature jimmy = new Creature();
    creatGr.add(jimmy);
  }
  
  //Predator list generation
  for(int i = 0; i < predators; i++){
    Predator john = new Predator();
    predGr.add(john);
  }
  
  generateFood();
}

void draw(){ 
    background(255);
    
    //Check if there are any cretures
    if(creatGr.size() == 0){
      extinction();
    }
    else{
      //Display food
      for(int i = 0; i < foodGr.size(); i++){
        foodGr.get(i).display();
      }
  
      //Verify actions for each creature
      for(int j = 0; j < creatGr.size(); j++){

        //Check for collisions with food
        for(int k = 0; k < foodGr.size(); k++){
          creatGr.get(j).eat(foodGr.get(k));
        }
      
        //Display and move creature, calculate hunger and check possible death
        creatGr.get(j).display();
        creatGr.get(j).calcHunger();
      }
    
      //For each predator, display, move and check collisions with creatures
      for(int l = 0; l < predGr.size(); l++){
        predGr.get(l).display();
        for(int m = 0; m < creatGr.size()-1; m++){
          if(predGr.get(l).kill(creatGr.get(m)) == true){
            break;
          }
        }
      }
      
      surviveCount++;
    
      //Measure of time is imprecise because frameRate is not constant,
      //to avoid bugs and skipping generations "frameRate" is set to 60
      if(int(surviveSec*60) == surviveCount){
        changeGen();
      }
      
      displayInfo();
    }
}

void displayInfo(){
  fill(0);
  String generation = "Generation " + genCount;
  String numCreats = "Creatures: " + creatGr.size();
  textAlign(CENTER);
  textSize(32);
  text(generation, width/2, 100);
  textSize(26);
  text(numCreats, width/2, 150);
}

void generateFood(){
  foodGr.clear();
  
  //Food list generation
  for(int i = 0; food > i; i++){
    Food foodObj = new Food();
    foodGr.add(foodObj);
  }
}

void changeGen(){
  genCount++;
  surviveCount = 0;
  
  for(int i = 0; i < creatGr.size(); i++){
    creatGr.get(i).reproduce();
  }
  creatGr.clear();
  for(int j = 0; j < childGr.size(); j++){
    creatGr.add(childGr.get(j));
  }
        
  childGr.clear();
  generateFood();
  surviveSec += secIncrement;
}

void extinction(){
  fill(0);
  DecimalFormat df = new DecimalFormat("0.00");
  String title = "\nCREATURES EXTINCT";
  String info =  "\n\n\n\nInitial Jimmies: "
                 + creatures + "\nFood generated: " + food
                 + "\nInitial Johns (predators): " + predators
                 + "\nTo reproduce Jimmies had to survive for "
                 + df.format(surviveSec) + " seconds\n\nThese Jimmies lasted for "
                 + genCount + " generations\n" + killedCount
                 + " Jimmies were killed";
  textAlign(CENTER);
  textSize(48);
  text(title, width/2, 100);
  textSize(32);
  text(info, width/2, 100);
}
