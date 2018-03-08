Octipi[] octipi = new Octipi[100];

setup(){
  octipi = new Octipi()[100];
  for (int i=0; i<100; i++){
    octipi[i] = new Octipi(8);
  }
}

class Octipi{
  int legs = 8;
  
  Octipi(){
  }
  
  Octipi(int legs){
    this.legs = legs;
  }