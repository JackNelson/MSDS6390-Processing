class LineGraph extends Chart{
  
  //FIELDS
  color lgColor;
  
  //CSTRS
  LineGraph(){
    super();
  }
  
  LineGraph(Table data, PVector loc, PVector scl, color lgColor){
    super(data, loc, scl);
    this.lgColor = lgColor;
  }
  
  //METHODS
  void display(){
    println("This will show a summary LineGraph of the data");
  }
}