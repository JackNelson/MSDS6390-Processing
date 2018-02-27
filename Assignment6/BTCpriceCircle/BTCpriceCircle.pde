int outerR; //radius of outer circle
int innerR; //radius of inner circle
float theta; //angle of rotation for each month
int numMonths; //number of months in data
int numNewYears; //number of Dec-Jan crossings
int startMonth; //numberic month number of first month

Data btc; //object from the Data class housing cryptocurrency price data

void setup(){
  size(700,700);
  //initialize chart parameters
  outerR = round(height/2 * 0.9);
  innerR = round(height/2 * 0.2);
  numMonths = 77;
  numNewYears = 7;
  startMonth = 9;
  
  theta = TWO_PI / (numMonths + numNewYears + 5);   //leaving gap for y axis labels
    
  translate(width/2, height/2);
  pushMatrix();
  monthLabels(); //plots month labels
  popMatrix();
  
  pushMatrix();
  yearLabels(); //plots year labels
  popMatrix();
  
  pushMatrix();
  priceScale(); //plots y axis scale
  popMatrix();
  
  btc = new Data("BTC_data2.txt");
  
  //plotting price variables from Data object
  pushMatrix();
  plotPrice(btc.price_high, color(0,255,0)); //green
  popMatrix();
  pushMatrix();
  plotPrice(btc.price_low, color(255,0,0)); //red
  popMatrix();
  pushMatrix();
  plotPrice(btc.price_open, color(0, 0, 255)); //blue
  popMatrix();
  pushMatrix();
  plotPrice(btc.price_close, color(0, 125, 255)); //light blue
  popMatrix();
}