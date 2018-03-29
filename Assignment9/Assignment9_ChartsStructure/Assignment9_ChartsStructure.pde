Engine e;
Chart c;
BarGraph bg;
PieChart pc;
LineGraph lg;
BoxPlot bp;

void setup(){
  size(400,500);
  
  Chart[] cs = new Chart[4];
  
  cs[0] = new BarGraph();
  cs[1] = new PieChart();
  cs[2] = new LineGraph();
  cs[3] = new BoxPlot();
  
  e = new Engine(cs);
  
}