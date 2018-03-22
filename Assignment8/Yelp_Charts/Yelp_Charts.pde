/* ButtonType.java, Component, Dimension, Layout.java, Menu, RectButton, RoundedRectButton objects
   From Verlet World Demo 
   By: Ira Greenberg
   Made for MSDS6390: Visualization of Information
   at Southern Methodist University*/

color bgCol = #111122;
Menu menu;

PieCharts pieCharts;

BarCharts barCharts;
BarChart barChartUsers;
BarChart barChartEliteUsers;

BarCharts2 barCharts2;
BarChart barChartUsersComments;
BarChart barChartEliteUsersComments;

void setup(){
  size(1024, 700, P3D);
  
  String[] labels = {
    "Data Summary", "Total Users by Year", "Total Comments by Year", "Yelp Chart 4", "Yelp Chart 5"
  };  
  color[] states = {
    //offState, onState, overState, pressState
    #eebfbb, bgCol, #eeffef, #ffaa66
  };
  menu = new Menu(Layout.TOP, new Dimension(width, 23), labels, states, ButtonType.RECT);
  //menu = new Menu(Layout.LEFT, new Dimension(65, height/4), labels, states, ButtonType.ROUNDED_RECT);
  //menu = new Menu(Layout.BOTTOM, new Dimension(width, 23), labels, states, ButtonType.RECT);
  //menu = new Menu(Layout.RIGHT, new Dimension(65, height), labels, states, ButtonType.RECT);
  // How to change corner radius through explicit casting
  //RoundedRectButton rb = (RoundedRectButton)(menu.buttons[0]);
  //rb.cornerRadius = 12;
  
  pieCharts = new PieCharts("CountData.csv");
  
  barChartUsers = new BarChart(this);
  barChartEliteUsers = new BarChart(this);
  barCharts = new BarCharts("CountData.csv", barChartUsers, barChartEliteUsers);
  
  barChartUsersComments = new BarChart(this);
  barChartEliteUsersComments = new BarChart(this);
  barCharts2 = new BarCharts2("CountData.csv", barChartUsersComments, barChartEliteUsersComments);
}

void draw(){
  background(bgCol);
  
  menu.display();
  
  if (menu.getSelected() == "Data Summary"){
      pieCharts.display();
  } else if (menu.getSelected() == "Total Users by Year"){
      barCharts.display();
  } else if (menu.getSelected() == "Total Comments by Year"){
      barCharts2.display();
  }
}