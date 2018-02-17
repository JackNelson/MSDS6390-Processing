void priceScale(){
  String[] axisLabels = {"price1","price2","price3","price4","price5","price6","price7","price8"};
  String axisTitle = "Price (USD)";
  textSize(8);
  fill(0,0,0);
  textAlign(CENTER);
  
  int lineLength = round((outerR - innerR - textAscent()*axisLabels.length) / axisLabels.length); //calculate length of line between labels
  translate(0, -innerR); //translate to scale start
  
  for(int i = 0; i < axisLabels.length; i++){
    line(0, 0, 0, -lineLength + textAscent()/2); //draw axis line with buffer for axisLabels
    translate(0, -lineLength); //translate to axisLabel location
    text(axisLabels[i], 0, 0); //draw axisLabel
    translate(0, -textAscent()); //translate to next axis line
  }
  translate(0, -textAscent()); //translate buffer for axisTitle
  textSize(10);
  text(axisTitle, 0, 0); //draw axisTitle
}