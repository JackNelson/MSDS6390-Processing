class Engine{
  
  //FIELDS
  Chart[] charts;
  
  //CSTRS
  Engine(){
  }
  
  Engine(Chart[] charts){
    this.charts = charts;
    
    for(int i=0; i<charts.length; i++){
      charts[i].display();
    }
  }
  
  //METHODS
  void displaying(Display dis){
  }
  
}