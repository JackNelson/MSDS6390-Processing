// MSDS 6390 - Visualization of Information
// Assignment 4 
// Planisphere creation
// Team members
//  Jack Nelson, Ireti Fasere, Hari Narayan Sanadhya

import java.util.*;
Table starLocation;
int constellationCount;
// constellations is a integer dictionary which stores the constellation name as key and index in array coordinates corresponding to the position which holds the coordinates of stars in the array
IntDict  constellations = new IntDict();
// coordinates holds the coordinates of all the constellations that are part of the planishpere
int[][][] coordinates;
String[] nameOfConstellation;
Set[] uniqueCoordinates;
Constellation[] constellation;

PImage sleeve ;
float clickedX, clickedY, previousX, previousY;
float previousRotationAngle = 0;
boolean clickToRotate = false, dragStarted = false;
float rotationAngle = 0;

color[] colorMatrix = new color[25];
color currentLocColor;

// Array to store the line variables (slope and y-intercept) joining the various stars to from the constellation
// This array will be used to the current mouse position
float[][][] lineSlopeIntercept;

void setup() {
  size(600, 765);
  stroke(0);
  noLoop();
  noFill();
  initializeConstellations(300, 300);
  smooth();
  background(230);
  pushMatrix();
  translate(283, 283);
  starWheelTemplate(rotationAngle, false);
  popMatrix();
  drawSleeve();

  saveFrame("sleeveImage.png");
  sleeve = loadImage("sleeveImage.png", "png");
}

void draw() {
  constellationCount=0;
  //background(230);
  image(sleeve, 0, 0);



  // Draws the star wheel template with all the textual labels
  pushMatrix();
  translate(283, 283);
  starWheelTemplate(rotationAngle, true);
  popMatrix();


  noFill();
  stroke(0);
  String constellationName = "";
  constellationCount=0;

  // Draw the constellation shape
  pushMatrix();
  translate(width/2, 300);
  rotate(previousRotationAngle + rotationAngle);
  for (TableRow row : starLocation.rows()) {
    if (! constellationName.equals(row.getString(0).trim())) {
      if (constellationCount != 0)
        endShape();
      constellationName = row.getString(0).trim();
      constellationCount++;
      beginShape();
    }
    vertex(row.getFloat(1), row.getFloat(2));
    ellipse(row.getFloat(1), row.getFloat(2), 2, 2);
  }
  endShape();
  popMatrix();

  
  // scale the mouse pointer coordinates as per the image coordinates
  mouseX = mouseX - 300;// -  int(sqrt((mouseX-300 - int(clickedX-300))^2 + (mouseY-300 - int(clickedY-300))^2)*cos(previousRotationAngle));
  mouseY = mouseY - 300;// - int(sqrt((mouseX-300 - int(clickedX-300))^2 + (mouseY-300 - int(clickedY-300))^2)*sin(previousRotationAngle));
  pushMatrix();
    //translate(300, 300);
    //translate(width/2, 300);
      rotate(-previousRotationAngle);
      println(mouseX, mouseY, clickedX - 300, clickedY-300);
  // check if the mouse is in the center circle, cirlce with radius of 220 and the star coordinates transformed with center of the middle circle as the origin
  if (mouseX>(-220) && mouseX<(+220) && mouseY>-220 && mouseY<220) {
    boolean match = false;
    float slope= 0.0;
    float intercept = 0.0;
    constellationName = "";
    int objectCount=0, recordCount = 0;
    Set toCountDistinctCord = new HashSet<String>();
    float[] y = new float[7];
    float previousX=0, previousY=0, currentX=0, currentY=0;

    // Code within checkMouse named block below is to check if the mouse is currently above any constellation
  checkMouse:
    for (TableRow row : starLocation.rows()) {
      currentX = row.getFloat(1) - sqrt(int(row.getFloat(1))^2 + int(row.getFloat(2))^2) * cos(previousRotationAngle);
      currentY = row.getFloat(2) - sqrt(int(row.getFloat(1))^2 + int(row.getFloat(2))^2) * sin(previousRotationAngle);
      // check if the name of the constellation has changed 
      if (! constellationName.equals(row.getString(0).trim())) {
        slope= 0.0;
        intercept = 0.0;
        constellationName = row.getString(0).trim();
        toCountDistinctCord.clear();
        // if not the first record, then increment the object count
        if (recordCount>0)
          objectCount++;
      } else { // This part is when the constellation name has not changed when the next record is read

        // check if mouse pointer lies with the rectangle formed by joining the previous and current vertices as a diagonal
        // This is to make sure that the mouse pointer is on the visible section of the line joining the two points
        if (mouseX>=min(previousX, currentX) && mouseX<=max(previousX, currentX) && mouseY>=min(previousY, currentY) && mouseY<=max(previousY, currentY)) {
          slope = (previousY - currentY)/ (previousX - currentX);
          intercept = ((currentY * previousX) - (currentX * previousY))/ (previousX - currentX);

          // compute 7 values of y as per the equation of line corresponding to 7 values of x (mouseX - 3 to mouseX +3)
          // Used 7 values to make the selection of the constellation a little lenient 
          for (int l=-3; l<=3; l++)
            y[l+3] = slope * (mouseX + l) + intercept;

          // Check if any of the 7 values of y lies within mouseY-3 and mouseY+3 
          for (float yValue : y) {
            if (yValue>=mouseY-3 && yValue<=mouseY+3 ) {
              // if the match is found , then create the popup window
              fill(0, 100);
              stroke(0);
              pushMatrix();
              translate( mouseX + width/2 + 10, mouseY + 310);
              rect(0, 0, 200, 60);
              fill(255);
              textSize(14);
              text(constellation[objectCount].toString(), 10, 20);
              popMatrix();
              match = true;
              break checkMouse;
            }
          }
        }
      }
      previousX = row.getFloat(1);// - sqrt(int(row.getFloat(1))^2 + int(row.getFloat(2))^2) * cos(previousRotationAngle);
      previousY = row.getFloat(2);// - sqrt(int(row.getFloat(1))^2 + int(row.getFloat(2))^2) * sin(previousRotationAngle);
      toCountDistinctCord.add(String.valueOf(row.getFloat(1))+String.valueOf(row.getFloat(2)));
      recordCount++;
    }
    // check if the mouse location was confirmed to be on any constellation
    if (match)
      //Recreate the selected constellation with more weight
      recreate(objectCount, previousRotationAngle + rotationAngle);
  }
  popMatrix();
}

// recreate a constellation with more weight and deep blue color 
void recreate(int index, float angle) {
  pushMatrix();
  translate(width/2, 300);
  rotate(angle);
  noFill();
  beginShape();
  stroke(0, 100, 255);
  strokeWeight(3);
  for (int i=0; i<constellation[index].getNumberOfPoints(); i++) {
    TableRow row = starLocation.getRow(constellation[index].getStartIndexInFile()+i);
    vertex(row.getFloat(1), row.getFloat(2));
    ellipse(row.getFloat(1), row.getFloat(2), 2.5, 2.5);
  }
  endShape();
  strokeWeight(1);
  stroke(0);
  popMatrix();
}