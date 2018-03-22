abstract class Character implements Playable{
  String name;
  int age;
  float force;
  
  Character(){
  }
  
  Character(String name, int age, float force){
    this.name = name;
    this.age = age;
    this.force = force;
  }
  
  abstract void fight();
  
  String[] getInventory(){
    return new String[50];
  }
  
  void beReborn(){
  }
  
  abstract void setScore(int score);
  abstract void updateInventory();
  
}