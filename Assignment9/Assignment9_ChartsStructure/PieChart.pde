class PieChart extends Chart{
  
  //FIELDS
  color[] pcColors = {#e6194b, #3cb44b, #ffe119, #0082c8, #f58231, 
                      #911eb4, #46f0f0, #f032e6, #d2f53c, #fabebe,
                      #008080, #e6beff, #aa6e28, #fffac8, #800000,
                      #aaffc3, #808000, #ffd8b1, #000080, #808080};
  String chartTitle;
  float yValueSum = 0;
  
  //CSTRS
  PieChart(){
    super();
  }
  
  PieChart(Table data, String xLabelField, String yValueField, PVector loc, PVector scl, String chartTitle){
    super(data, xLabelField, yValueField, loc, scl);
    this.chartTitle = chartTitle;
    
    getYValueSum();
  } 
  
  //METHODS
  void getYValueSum(){
    for(int i=0; i<yValues.length; i++){
      yValueSum += yValues[i];
    }
  }
  
  void display(){
    textSize(12);
    displayPie();
    displayLegend();
    
    // Draw a title over the top of the chart.
    fill(120);
    textSize(14);
    text("SMU MSDS6390: Assignment 9 by Jack, Hari, Ireti", width - 400, height - 100);
    textSize(36);
    text(chartTitle, (width-textWidth(chartTitle))/2,75);
  }
  
  void displayPie(){
    float start = 3*HALF_PI;
    for(int i=0; i<yValues.length; i++){
      fill(pcColors[i]);
      arc(width/2, height/2, 550, 550, start, start+yValues[i]/yValueSum*TWO_PI);
      start += yValues[i]/yValueSum*TWO_PI;
    }
  }
  
  void displayLegend(){
    PVector legLoc = new PVector(100, 125);
    for(int i=0; i<yValues.length; i++){
      fill(pcColors[i]);
      rect(legLoc.x, legLoc.y, 20, 20);
      textSize(14);
      text(xLabels[i], legLoc.x+25, legLoc.y+15);
      legLoc.y += 25;
    }
  }
}