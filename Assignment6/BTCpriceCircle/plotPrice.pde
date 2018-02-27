void plotPrice(float[] price, color priceColor){
  String[] months = {" ","J","F","M","A","M","J","J","A","S","O","N","D"};
  stroke(priceColor);
  strokeWeight(2.0);
  noFill(); 
  rotate(theta*3); //rotating first month to HALF_PI
  beginShape();
  
  int j = 0; //dummy iterator for price array
  for(int i = 0; i < numMonths + numNewYears; i++){
    float thetaMonth = (-HALF_PI + theta*i);
    int yDist = int(log(price[j])/log(20000) * (outerR - innerR)); //log scaled with radius lines

    if(months[(i+startMonth) % 13] != " "){ 
      curveVertex((innerR+yDist)*cos(thetaMonth), (innerR+yDist)*sin(thetaMonth)); //unit circle conversion to plot point
      if(j == 0 || j == price.length-1){
        curveVertex((innerR+yDist)*cos(thetaMonth), (innerR+yDist)*sin(thetaMonth)); //anchor points
      } else{ }
      j++; //increment dummy iterator for price array
    } else { }
  }
  endShape();
}