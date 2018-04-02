import org.gicentre.utils.stat.*;

class LineGraph extends Chart{
  
  //FIELDS
  XYChart lineGraph;
  color lineColor;
  String chartTitle;
  
  //CSTRS
  LineGraph(){
    super();
  }
  
  LineGraph(Table data, String xLabelField, String yValueField, PVector loc, PVector scl, color lineColor, String chartTitle, XYChart lineGraph){
    super(data, xLabelField, yValueField, loc, scl);
    this.lineColor = lineColor;
    this.chartTitle = chartTitle;
    this.lineGraph = lineGraph;
    
    _init();
  }
  
  //METHODS
  void _init(){
    lineGraph.setData(float(xLabels), yValues);
    lineGraph.setXFormat("0000");
    lineGraph.setXAxisLabel(xLabelField);
    lineGraph.setYAxisLabel(yValueField);
    lineGraph.setLineColour(lineColor);
    lineGraph.showXAxis(true);
    lineGraph.showYAxis(true);
  }
  
  void display(){
    textSize(12);
    lineGraph.setPointSize(0);
    lineGraph.setLineWidth(2);
    lineGraph.draw(loc.x,loc.y,scl.x,scl.y);
    
    // Draw a title over the top of the chart.
    fill(120);
    textSize(14);
    text("SMU MSDS6390: Assignment 9 by Jack, Hari, Ireti", width - 400, height - 100);
    textSize(36);
    text(chartTitle, (width-textWidth(chartTitle))/2,75);
  }
}