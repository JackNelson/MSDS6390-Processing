class ChartData{
  
  Table data;
  String xLabelField;
  String yValueField;
  String[] xLabels;
  float[] yValues;
  
  ChartData(){
  }
  
  ChartData(Table data, String xLabelField, String yValueField){
    this.data = data;
    this.xLabelField = xLabelField;
    this.yValueField = yValueField;
    
    _init();
  }
  
  private void _init(){
    xLabels = new String[data.getRowCount()];
    yValues = new float[data.getRowCount()];
    
    int i = 0;
    
    for(TableRow row : data.rows()){
      xLabels[i] = row.getString(xLabelField);
      yValues[i] = row.getFloat(yValueField);
      i++; //increment dummy iterator for variable arrays
    }
  }
}