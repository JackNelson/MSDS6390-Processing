import org.gicentre.utils.stat.*;

class BarGraph extends Chart{
  
  //FIELDS
  BarChart barGraph;
  color barColor;
  String chartTitle;
  
  //CSTRS
  BarGraph(){
    super();
  }
  
  BarGraph(Table data, String xLabelField, String yValueField, PVector loc, PVector scl, color barColor, String chartTitle, BarChart barGraph){
    super(data, xLabelField, yValueField, loc, scl);
    this.barColor = barColor;
    this.chartTitle = chartTitle;
    this.barGraph = barGraph;
    
    _init();
  }
  
  //METHODS
  void _init(){
    barGraph.setData(yValues);
    barGraph.setBarLabels(xLabels);
    barGraph.setCategoryAxisLabel(xLabelField);
    barGraph.setValueAxisLabel(yValueField);
    barGraph.setBarColour(barColor);
    barGraph.showCategoryAxis(true);
    barGraph.showValueAxis(true);
  }
  
  void display(){
    textSize(12);
    barGraph.draw(loc.x,loc.y,scl.x,scl.y);
    
    // Draw a title over the top of the chart.
    fill(120);
    textSize(14);
    text("SMU MSDS6390: Assignment 9 by Jack, Hari, Ireti", width - 400, height - 100);
    textSize(36);
    text(chartTitle, (width-textWidth(chartTitle))/2,75);
  }
}