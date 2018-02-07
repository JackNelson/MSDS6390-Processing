void starWheelTemplate(float rotationAngle, boolean transparent) {
  ellipseMode(CENTER);
  
  // Draw main circle
  if(transparent){
  fill(255,0);
  stroke(1);}
  else{
  fill(255);
  noStroke();
  }
  for (int i = 0; i < 12; i++) {
    arc(0 , 0, 490, 490, i*TWO_PI/12 + TWO_PI/24 + rotationAngle, (i+1)*TWO_PI/12 + TWO_PI/24 + rotationAngle, PIE);
  }
  if(transparent){
      //pushMatrix();
      //translate(-283, -283);
      fill(255);
  rotate(-radians(50));
 // Set ellipseMode is CORNER
  ellipse(-63, -5, 268, 334);
    rotate(radians(50));
  //popMatrix();
  drawDates(rotationAngle);
  drawMonths(rotationAngle);

  // Draw inner circle
  fill(255, 0);
  ellipse(0, 0, 440, 440);
  }
}

// Text Date Labels
void drawDates(float rotationAngle) {
  String[] dates = {" 5", "10", "15", "20", "25", "30"};
  textSize(10);
  fill(0);
  pushMatrix();
  //translate(width/2, 300);
  rotate(HALF_PI + TWO_PI/24 + TWO_PI / 360 + rotationAngle);
  for (int i = 0; i < 12; i++) {
    for (int j = 0; j < dates.length; j++) {
      text(dates[j], 0, -223);
      rotate(TWO_PI/72);
    }
  }
  popMatrix();
}

// Text Month Labels
// Based on tutorial at https://www.openprocessing.org/sketch/129166
void drawMonths(float rotationAngle) {
  String[] months = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
  float r = 235;
  pushMatrix();
  //translate(width/2, 300);
  rotate(HALF_PI + TWO_PI/24 + rotationAngle);

  for (int i = 0; i < months.length; i++) {   

    // angle to label start
    float startAngle = (TWO_PI / 12 - textWidth(months[i]) / r) / 2 ; 

    rotate(startAngle);

    for (int j = 0; j < months[i].length(); j++) {
      // charAt(i) gets the character at position i in the String
      char currentChar = months[i].charAt(j); 
      float charAngle = textWidth(currentChar) / r;

      rotate(charAngle / 2);
      translate(0, -r);
      text(currentChar, 0, 0);
      translate(0, r);
      rotate(charAngle / 2);
    }

    rotate(startAngle);
  }
  popMatrix();
}