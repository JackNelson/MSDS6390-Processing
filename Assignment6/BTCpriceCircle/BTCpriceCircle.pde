int outerR; //radius of outer circle
int innerR; //radius of inner circle
float theta; //angle of rotation for each month
int numMonths; //number of months in data
int numNewYears; //number of Dec-Jan crossings
int startMonth; //numberic month number of first month

void setup(){
  size(800,800);
  outerR = round(height/2 * 0.9);
  innerR = round(height/2 * 0.2);
  numMonths = 77;
  numNewYears = 7;
  startMonth = 9;
  //leaving gap for y axis labels
  theta = TWO_PI / (numMonths + numNewYears + 5);
    
  translate(width/2, height/2);
  pushMatrix();
  monthLabels();
  popMatrix();
  
  pushMatrix();
  yearLabels();
  popMatrix();
  
  pushMatrix();
  priceScale();
  popMatrix();
}