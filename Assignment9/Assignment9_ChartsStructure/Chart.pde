abstract class Chart extends ChartData implements Display{
  
  //FIELDS
  PVector loc;
  PVector scl;
  
  //CSTRS
  Chart(){
  }
  
  Chart(Table data, String xLabelField, String yValueField, PVector loc, PVector scl){
    super(data, xLabelField, yValueField);
    this.loc = loc;
    this.scl = scl;
  }
  
  //METHODS
  abstract void display();
}