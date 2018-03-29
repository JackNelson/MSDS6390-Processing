class PieChart extends Chart{
  
  //FIELDS
  color pcColor;
  
  //CSTRS
  PieChart(){
    super();
  }
  
  PieChart(Table data, PVector loc, PVector scl, color pcColor){
    super(data, loc, scl);
    this.pcColor = pcColor;
  }
  
  //METHODS
  void display(){
    println("This will show a summary PieChart of the data");
  }
}