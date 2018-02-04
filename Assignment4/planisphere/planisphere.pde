// MSDS 6390 - Visualization of Information
// Assignment 4 
// Planisphere creation
// Team members
//  Jack Nelson, Ireti Fasere, Hari Narayan Sanadhya

// constellations is a integer dictionary which stores the constellation name as key and index in array coordinates corresponding to the position which holds the coordinates of stars in the array
IntDict  constellations = new IntDict();
// coordinates holds the coordinates of all the constellations that are part of the planishpere
int[][][] coordinates;

void setup() {
  size(600, 765);
  background(230);
  stroke(0);
  
  // Draw main circle
  fill(255);
  for(int i = 0; i < 12; i++){
    arc(width/2, 300, 490, 490, i*TWO_PI/12 + TWO_PI/24, (i+1)*TWO_PI/12 + TWO_PI/24, PIE);
  }
  
  // Text Date Labels
  String[] dates = {"5", "10", "15", "20", "25", "30"};
  textSize(10);
  fill(0);
  
  for(int i = 0; i < 12; i++){
    for(int j = 0; j < dates.length; j++){
      pushMatrix();
      translate(width/2, 300);
      rotate(HALF_PI + TWO_PI/24 + radians(1) + i*TWO_PI/12 + j*TWO_PI/72);
      text(dates[j], 0, -223);
      popMatrix();
    }
  }
  
  // Text Month Labels
  // Based on tutorial at https://www.openprocessing.org/sketch/129166
  String[] months = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
  float r = 235;
  
  for(int i = 0; i < months.length; i++){
     // current distance around the circle
    float arcLength = 0; 

    // total number of radians that the text will consume
    float totalAngle = textWidth(months[i]) / r;

    for (int j = 0; j < months[i].length(); j++){
      // charAt(i) gets the character at position i in the String
      char currentChar = months[i].charAt(j); 
      float w = textWidth(currentChar);
      // since the letters are drawn centered, we advance by half a letter width
      arcLength += w/2;

      // use a some trig to find the angle matching this arclength
      // the totalAngle/2 just adds some additional rotation so the 
      // text starts wraps evenly around the circle
      float theta = arcLength / r - totalAngle/2;

      pushMatrix();
      translate(width/2, 300);
      // rotate to line up with the orientation of the letter
      rotate(theta + HALF_PI + TWO_PI/12 + TWO_PI/12*i);
      // translate out along the radius to where the letter will be drawn 
      translate(0, -r);
      text(currentChar, 0, 0);
      popMatrix();
      // add the other half of the character width to our current position
      arcLength += w/2;
    }
  }

  
  // Draw inner circle
  fill(255);
  ellipse(width/2, 300, 440, 440);
  
  noFill();
  initializeConstellations();
  // Draw the constellation shape
  for (int i=0; i<coordinates.length; i++) {
    beginShape();
    for (int j=0; j<coordinates[i].length; j++) {
      vertex(coordinates[i][j][0], coordinates[i][j][1]);
      ellipse(coordinates[i][j][0], coordinates[i][j][1], 2, 2);
    }
    endShape();
  }
  //drawCentralWheel(225, 186, 175, 154);
}