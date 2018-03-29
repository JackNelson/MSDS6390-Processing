abstract class Chart implements Display{
  
  //FIELDS
  Table data;
  PVector loc;
  PVector scl;
  
  //CSTRS
  Chart(){
  }
  
  Chart(Table data, PVector loc, PVector scl){
    this.data = data;
    this.loc = loc;
    this.scl = scl;
  }
  
  //METHODS
  abstract void display();
}