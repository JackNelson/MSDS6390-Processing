class Engine{
  
  Character[] characters;
  
  Engine(){
  }
  
  Engine(Character[] characters){
    this.characters = characters;
    
    for(int i=0; i<characters.length; i++){
      characters[i].fight();
      characters[i].updateInventory();
    }
  }
  
  void play(Playable p){
  }
  
}