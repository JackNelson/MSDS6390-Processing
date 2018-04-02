import java.io.PrintWriter;

boolean expOccured = false;
String expText = "";
// Mid Term Assignment: Yelp Data Plots 
// Team Members: Hari Narayan Sanadhya, Ireti Fasere, Jack Nelson

/* ButtonType.java, Component, Dimension, Layout.java, Menu, RectButton, RoundedRectButton objects
 From Verlet World Demo 
 By: Ira Greenberg
 Made for MSDS6390: Visualization of Information
 at Southern Methodist University*/

// Charts Section
Engine e;
Chart c;
Chart[] cs;

BarGraph bg;
BarChart barGraph;

TargetChart tc;

LineGraph lg;
XYChart lineChart;

ScatterChart sc;
XYChart scatterChart;

PieChart pc;

Table dataFile;

Menu menu;

// Menu Section
color bgCol = #113322;
//Menu menu;
int menuWidth = 23;


public void setup() {
  size(1024, 772);
  String[] labels = {"BarChart", "TargetChart", "LineGraph", "ScatterPlot", "PieChart"};  
  color[] states = {
    //offState, onState, overState, pressState
    #eebfbb, bgCol, #eeffef, #ffaa66
  };
  menu = new Menu(Layout.TOP, new Dimension(width, 23), labels, states, ButtonType.RECT);

  //Table data = loadTable("CountData.csv", "header");


  try {
    dataFile = loadTable("file3.csv", "header", 0, 2);
    ((TimeSeriesTable) dataFile).summarizeData("");
  } 
  catch (Exception exp) {
    expOccured = true;
    expText = exp.getMessage();
  }
  if (expOccured)
    noLoop();
  else {
    PVector scl = new PVector(width*.75, height*.65);
    PVector loc = new PVector((width-scl.x)/2, 130);
    barGraph = new BarChart(this);
    lineChart = new XYChart(this);
    scatterChart = new XYChart(this);

    // Charts Section 
    cs = new Chart[5];

    // BarGraph(Table data, String xLabelField, String yValueField, PVector loc, PVector scl, color barColor, String chartTitle)
    cs[0] = new BarGraph(((TimeSeriesTable)dataFile).summaryData, ((TimeSeriesTable)dataFile).summaryData.getColumnTitle(0), ((TimeSeriesTable)dataFile).summaryData.getColumnTitle(1), loc, scl, color(120), "BarGraph of Yearly Comments", barGraph);
    // TargetChart(Table data, String xLabelField, String yValueField, PVector loc, PVector scl, String chartTitle)
    cs[1] = new TargetChart(((TimeSeriesTable)dataFile).summaryData, ((TimeSeriesTable)dataFile).summaryData.getColumnTitle(0), ((TimeSeriesTable)dataFile).summaryData.getColumnTitle(1), loc, scl, "TargetChart of Yearly Comments");
    // LineGraph(Table data, String xLabelField, String yValueField, PVector loc, PVector scl, color lineColor, String chartTitle, XYChart lineGraph)
    cs[2] = new LineGraph(((TimeSeriesTable)dataFile).summaryData, ((TimeSeriesTable)dataFile).summaryData.getColumnTitle(0), ((TimeSeriesTable)dataFile).summaryData.getColumnTitle(1), loc, scl, color(120), "LineGraph of Yearly Comments", lineChart);
    // ScatterChart(Table data, String xLabelField, String yValueField, PVector loc, PVector scl, color lineColor, String chartTitle, XYChart lineGraph)
    cs[3] = new ScatterChart(((TimeSeriesTable)dataFile).summaryData, ((TimeSeriesTable)dataFile).summaryData.getColumnTitle(0), ((TimeSeriesTable)dataFile).summaryData.getColumnTitle(1), loc, scl, color(120), "LineGraph of Yearly Comments", lineChart);
    // PieChart(Table data, String xLabelField, String yValueField, PVector loc, PVector scl, String chartTitle)
    cs[4] = new PieChart(((TimeSeriesTable)dataFile).summaryData, ((TimeSeriesTable)dataFile).summaryData.getColumnTitle(0), ((TimeSeriesTable)dataFile).summaryData.getColumnTitle(1), loc, scl, "TargetChart of Yearly Comments");

    TimeSeriesTable.sketchDataPath = dataPath("");
    print(dataPath(""));
    
    e = new Engine(cs);
  }
}

public void draw() {
  if (expOccured) {
    textAlign(CENTER, CENTER);
    text(expText, width / 2, height / 2, 0);
  } else {
    background(bgCol);
    menu.display();
    int bottomSelected = menu.getSelected();
    if (bottomSelected>=0)
      cs[bottomSelected].display();
  }
}

public TimeSeriesTable loadTable(String fileName) throws InvalidTableException {
  Table temp = super.loadTable(fileName);
  TimeSeriesTable temp1 = new TimeSeriesTable();
  try {
    temp1.addColumn(temp.getColumnTitle(0), temp.getColumnType(0));
    temp1.addColumn(temp.getColumnTitle(1), temp.getColumnType(1));
    temp1.addColumn(temp.getColumnTitle(2), temp.getColumnType(2));
    for (TableRow c : temp.rows()) {
      if (c.getInt(1) == 0)
        continue;
      TableRow row = temp1.addRow();
      row.setString(0, c.getString(0));
      row.setInt(1, c.getInt(1));
      row.setString(2, c.getString(2));
    }
  } 
  catch (Exception E) {
    throw new InvalidTableException();
  }
  return temp1;
}

public TimeSeriesTable loadTable(String fileName, String options) throws InvalidTableException {
  Table temp = super.loadTable(fileName, options);
  TimeSeriesTable temp1 = new TimeSeriesTable();
  try {
    temp1.addColumn(temp.getColumnTitle(0), temp.getColumnType(0));
    temp1.addColumn(temp.getColumnTitle(1), temp.getColumnType(1));
    temp1.addColumn(temp.getColumnTitle(2), temp.getColumnType(2));
    for (TableRow c : temp.rows()) {
      if (c.getInt(1) == 0)
        continue;
      TableRow row = temp1.addRow();
      row.setString(0, c.getString(0));
      row.setInt(1, c.getInt(1));
      row.setString(2, c.getString(2));
    }
  } 
  catch (Exception E) {
    throw new InvalidTableException();
  }
  return temp1;
}

public TimeSeriesTable loadTable(String fileName, int indexCategory, int indexValue) throws InvalidTableException {
  Table temp = super.loadTable(fileName);
  TimeSeriesTable temp1 = new TimeSeriesTable();
  try {
    temp1.addColumn(temp.getColumnTitle(indexCategory), temp.getColumnType(indexCategory));
    temp1.addColumn(temp.getColumnTitle(indexValue), temp.getColumnType(indexValue));
    for (TableRow c : temp.rows()) {
      if (c.getInt(indexValue) == 0)
        continue;
      TableRow row = temp1.addRow();
      row.setString(0, c.getString(indexCategory));
      row.setInt(1, c.getInt(indexValue));
    }
  } 
  catch (Exception E) {
    throw new InvalidTableException();
  }
  return temp1;
}

public TimeSeriesTable loadTable(String fileName, String options, int indexCategory, int indexValue)
  throws InvalidTableException {
  Table temp = super.loadTable(fileName, options);
  TimeSeriesTable temp1 = new TimeSeriesTable();
  try {
    temp1.addColumn(temp.getColumnTitle(indexCategory), temp.getColumnType(indexCategory));
    temp1.addColumn(temp.getColumnTitle(indexValue), temp.getColumnType(indexValue));
    for (TableRow c : temp.rows()) {
      if (c.getInt(indexValue) == 0)
        continue;
      TableRow row = temp1.addRow();
      row.setString(0, c.getString(indexCategory));
      row.setInt(1, c.getInt(indexValue));
    }
  } 
  catch (Exception E) {
    throw new InvalidTableException();
  }
  return temp1;
}

public TimeSeriesTable loadTable(String fileName, int indexCategory, int indexValue, int indexHue)
  throws InvalidTableException {
  Table temp = super.loadTable(fileName);
  TimeSeriesTable temp1 = new TimeSeriesTable();
  try {
    temp1.addColumn(temp.getColumnTitle(indexCategory), temp.getColumnType(indexCategory));
    temp1.addColumn(temp.getColumnTitle(indexValue), temp.getColumnType(indexValue));
    temp1.addColumn(temp.getColumnTitle(indexHue), temp.getColumnType(indexHue));
    for (TableRow c : temp.rows(new int[] { indexCategory, indexValue, indexHue })) {
      if (c.getInt(indexValue) == 0)
        continue;
      temp1.addRow(c);
    }
  } 
  catch (Exception E) {
    throw new InvalidTableException();
  }
  return temp1;
}

public TimeSeriesTable loadTable(String fileName, String options, int indexCategory, int indexValue, int indexHue)
  throws InvalidTableException {
  Table temp = super.loadTable(fileName, options);
  TimeSeriesTable temp1 = new TimeSeriesTable();
  try {
    temp1.addColumn(temp.getColumnTitle(indexCategory), temp.getColumnType(indexCategory));
    temp1.addColumn(temp.getColumnTitle(indexValue), temp.getColumnType(indexValue));
    temp1.addColumn(temp.getColumnTitle(indexHue), temp.getColumnType(indexHue));
    for (TableRow c : temp.rows()) {
      if (c.getInt(indexValue) == 0)
        continue;
      TableRow row = temp1.addRow();
      row.setString(0, c.getString(indexCategory));
      row.setInt(1, c.getInt(indexValue));
      row.setString(2, c.getString(indexHue));
    }
  } 
  catch (Exception E) {
    throw new InvalidTableException();
  }
  return temp1;
}