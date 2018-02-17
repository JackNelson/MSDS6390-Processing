
void monthLabels(){    
  String[] months = {" ","J","F","M","A","M","J","J","A","S","O","N","D"};
  textSize(10);
  fill(0,0,0);
  textAlign(CENTER);
  rotate(theta*2); //rotate to starting point
  
  for(int i = 0; i < numMonths + numNewYears; i++){
    strokeWeight(1.0);
    rotate(theta);
    text(months[(i+startMonth) % 13], 0, -outerR); //draw month label
    
    if(months[(i+startMonth) % 13] == " "){ //draw thicker line between years
      strokeWeight(2.0);
      line(0, round(-innerR), 0, round(-width/2*0.95));
    } else{ //draw month line
      line(0, round(-innerR), 0, round(-outerR + textAscent()/2));
    }
  }
   
}