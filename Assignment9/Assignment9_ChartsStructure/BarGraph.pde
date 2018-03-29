class BarGraph extends Chart{
  
  //FIELDS
  color bgColor;
  
  //CSTRS
  BarGraph(){
    super();
  }
  
  BarGraph(Table data, PVector loc, PVector scl, color bgColor){
    super(data, loc, scl);
    this.bgColor = bgColor;
  }
  
  //METHODS
  void display(){
    println("This will show a summary BarGraph of the data");
  }
}