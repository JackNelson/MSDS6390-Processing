Engine e;
Character c;
Elf elf;
Giant g;

void setup() {
  size(400, 500);
  
  Character[] cs = new Character[100];
  for(int i=0; i<100; i++){
    if(i%3==0){
      cs[i] = new Elf();
    } else if(i%2==0){
      cs[i] = new Giant();
    } else{
      cs[i] = new Dragon();
    }
  }
  e = new Engine(cs);
  
  Playable p1 = new Elf();
}