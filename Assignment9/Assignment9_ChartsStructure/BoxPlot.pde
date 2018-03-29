class BoxPlot extends Chart{
  
  //FIELDS
  color bpColor;
  
  //CSTRS
  BoxPlot(){
    super();
  }
  
  BoxPlot(Table data, PVector loc, PVector scl, color bpColor){
    super(data, loc, scl);
    this.bpColor = bpColor;
  }
  
  //METHODS
  void display(){
    println("This will show a summary BoxPlot of the data");
  }
}