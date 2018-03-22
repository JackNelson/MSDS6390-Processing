/* Modeled using http://gicentre.org/utils/reference/org/gicentre/utils/stat/BarChart.html */
import org.gicentre.utils.stat.*;    // For chart classes.

class BarCharts2{
  //fields
  BarChart barChartUsersComments;
  BarChart barChartEliteUsersComments;
  CountData data;
  String path;
  
  //cstrs
  BarCharts2(){
  }
  
  BarCharts2(String path, BarChart barChartUsersComments, BarChart barChartEliteUsersComments){
    this.path = path;
    this.barChartUsersComments = barChartUsersComments;
    this.barChartEliteUsersComments = barChartEliteUsersComments;
    
    data = new CountData(path);
    init(barChartUsersComments, data.comments, color(0,150,255));
    init(barChartEliteUsersComments, data.commentsEliteUsers, color(0,0,255));
  }
  
  void init(BarChart barChart, float[] x, color barColor){
    barChart.setData(x);
    barChart.setBarLabels(data.year);
    barChart.setMinValue(0);
    barChart.setMaxValue(200000);
    barChart.setCategoryAxisLabel("Year");
    barChart.setValueAxisLabel("Comments");
    barChart.setBarColour(barColor);
    barChart.showCategoryAxis(true);
    barChart.showValueAxis(true);
  }
  
  void display(){
    barChartUsersComments.draw(75,75,width-150,height-150);
    barChartEliteUsersComments.draw(75,75,width-150,height-150);
    
    // Draw a title over the top of the chart.
    fill(120);
    textSize(36);
    text("Yelp Comments by Year", width/2-175,100);
    
    displayLegend();
  }
  
  void displayLegend(){
    textSize(16);
    fill(0,150,255);
    rect(width/2-300, 150, 20, 20);
    fill(120);
    text("All Users", width/2-275, 160);
    fill(0,0,255);
    rect(width/2-300, 200, 20, 20);
    fill(120);
    text("Elite Users", width/2-275, 210);   
  }
}