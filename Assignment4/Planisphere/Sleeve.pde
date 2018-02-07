void drawSleeve() {
  fill(0);
  beginShape();
  vertex(36, 46);
  vertex(37, 565);
  vertex(555, 564);
  vertex(555, 495);
  vertex(464, 403);
  vertex(103, 44);
  vertex(109, 49);
  vertex(102, 46);
  endShape();

  //------- Black  arc ------- 
  fill(0);
  beginShape();
  ellipseMode(RADIUS);  // Set ellipseMode is Radius
  ellipse(282, 284, 217, 217);// PI * 135 / 48, 105 * PI / 48);
  endShape();

  //------- White ellipse ------- 
  fill(255);
  pushMatrix();
  rotate(-radians(50));
  ellipseMode(CORNER);  // Set ellipseMode is CORNER
  ellipse(-232, 226, 268, 334);
  popMatrix();

  // Sleeve Labels
  String[] labels = {"5 AM", "4 AM", "3 AM", "2 AM", "1 AM", "Midnight", "11 PM", "10 PM", "9 PM", "8 PM", "7 PM"};
  fill(255);
  textSize(9);
  noStroke();
  textAlign(LEFT, LEFT);
  for (int i = 0; i<labels.length; i++) {
    pushMatrix();
    translate(282, 284);
    rotate(3*PI/2  + PI/3 + i*PI/12);
    //------- Text Area Triangle ------- 
    triangle(0, -218, 10, -197, 0, -202);
    triangle(0, -218, -10, -197, 0, -202);
    rotate(- radians(3));
    // Add the labels
    if (labels[i].equals("Midnight"))
      rotate(- radians(3));
    text(labels[i], 0, -188);
    popMatrix();
    //break;
  }

  textSize(12);
  fill(255);
  String[] directions = {"North", "West", "South", "East"};
  int[] directionsWidthDiff = {28, -30, -88, -30};
  for (int i = 0; i<directions.length; i++) {
    pushMatrix();
    translate(282, 284);
    rotate(PI/4 + i*HALF_PI);
    //------- Text Area arrow ------- 
    quad(0, -207 + directionsWidthDiff[i], 10, -198 + directionsWidthDiff[i], 10, -188 + directionsWidthDiff[i], 0, -197 + directionsWidthDiff[i]);
    quad(0, -207 + directionsWidthDiff[i], -10, -198 + directionsWidthDiff[i], -10, -188 + directionsWidthDiff[i], 0, -197 + directionsWidthDiff[i]);

    //------- Draw the label ------- 
    rotate(- radians(3) - radians(1.5 * ((i%2 ==0)?1:0)));
    text(directions[i], 0, -175 + directionsWidthDiff[i]);
    popMatrix();
  }
  
  // Naration at the bottom
  fill(0);
  textAlign(CENTER);
  textSize(13);
  text("MSDS 6390 - Visualization of Information\nAssignment 4 : Planisphere creation\nTeam members: Jack Nelson, Ireti Fasere, Hari Narayan Sanadhya", 300, 600);
}