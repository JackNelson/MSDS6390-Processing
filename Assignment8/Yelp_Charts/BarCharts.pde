/* Modeled using http://gicentre.org/utils/reference/org/gicentre/utils/stat/BarChart.html */
import org.gicentre.utils.stat.*;    // For chart classes.

class BarCharts{
  //fields
  BarChart barChartUsers;
  BarChart barChartEliteUsers;
  CountData data;
  String path;
  
  //cstrs
  BarCharts(){
  }
  
  BarCharts(String path, BarChart barChartUsers, BarChart barChartEliteUsers){
    this.path = path;
    this.barChartUsers = barChartUsers;
    this.barChartEliteUsers = barChartEliteUsers;
    
    data = new CountData(path);
    init(barChartUsers, data.users, color(0,150,255));
    init(barChartEliteUsers, data.eliteUsers, color(0,0,255));
  }
  
  void init(BarChart barChart, float[] x, color barColor){
    barChart.setData(x);
    barChart.setBarLabels(data.year);
    barChart.setMinValue(0);
    barChart.setMaxValue(70000);
    barChart.setCategoryAxisLabel("Year");
    barChart.setValueAxisLabel("Yelp Users");
    barChart.setBarColour(barColor);
    barChart.showCategoryAxis(true);
    barChart.showValueAxis(true);
  }
  
  void display(){
    barChartUsers.draw(75,75,width-150,height-150);
    barChartEliteUsers.draw(75,75,width-150,height-150);
    
    // Draw a title over the top of the chart.
    fill(120);
    textSize(36);
    text("Yelp Users by Year", width/2-150,100);
    
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