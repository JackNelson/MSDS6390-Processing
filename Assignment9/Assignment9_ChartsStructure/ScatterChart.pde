import org.gicentre.utils.stat.*;

class ScatterChart extends Chart{
  
  //FIELDS
  XYChart scatterChart;
  color pointColor;
  String chartTitle;
  
  //CSTRS
  ScatterChart(){
    super();
  }
  
  ScatterChart(Table data, String xLabelField, String yValueField, PVector loc, PVector scl, color lineColor, String chartTitle, XYChart scatterChart){
    super(data, xLabelField, yValueField, loc, scl);
    this.pointColor = lineColor;
    this.chartTitle = chartTitle;
    this.scatterChart = scatterChart;
    
    _init();
  }
  
  //METHODS
  void _init(){
    scatterChart.setData(float(xLabels), yValues);
    scatterChart.setXFormat("0000");
    scatterChart.setXAxisLabel(xLabelField);
    scatterChart.setYAxisLabel(yValueField);
    scatterChart.setPointColour(pointColor);
    scatterChart.showXAxis(true);
    scatterChart.showYAxis(true);
  }
  
  void display(){
    textSize(12);
    scatterChart.setPointSize(5);
    scatterChart.setLineWidth(0);
    scatterChart.draw(loc.x,loc.y,scl.x,scl.y);
    
    // Draw a title over the top of the chart.
    fill(120);
    textSize(14);
    text("SMU MSDS6390: Assignment 9 by Jack, Hari, Ireti", width - 400, height - 100);
    textSize(36);
    text(chartTitle, (width-textWidth(chartTitle))/2,75);
  }
}