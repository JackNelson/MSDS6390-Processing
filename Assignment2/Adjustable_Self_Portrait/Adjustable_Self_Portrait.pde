color blackHair = color(9, 8, 6);
color skinTone = color(255, 205, 148);
color greenEye = color(51, 122, 44);

void setup(){
  size(300,500);
  drawBitmoji(width/2, height/2, 3, greenEye, blackHair, skinTone);
}

// Takes center point coordinates and attribute color features to draw personal Bitmoji at a specified size
void drawBitmoji(int x, int y, int size, color eyeColor, color hairColor, color skinColor){
  strokeWeight(1.5);
  strokeJoin(ROUND);
  strokeCap(ROUND);
  drawEar(x, y, size, skinColor, 1); //1 indicates left side
  drawEar(x, y, size, skinColor, -1); //-1 indicates right side
  drawHead(x, y, size, hairColor); 
  drawFacialHair(x, y, size, skinColor);
  drawMouth(x, y, size, skinColor);
  drawHair(x, y, size, hairColor);
  drawEye(x, y, size, eyeColor, 1); //1 indicates left side
  drawEye(x, y, size, eyeColor, -1); //-1 indicates right side
  drawNose(x, y, size);
  drawEyebrows(x, y, size, hairColor, 1); //1 indicates left side
  drawEyebrows(x, y, size, hairColor, -1); //-1 indicates right side
}
   
// EARS
void drawEar(int centerX, int centerY, float c, color skinTone, int side){
  fill(skinTone);
  int[] earXY = findCoordinates(centerX, centerY, c, 35.014282, -0.028563658, side);
  bezier(earXY[0], earXY[1], earXY[0]-7*c*side, earXY[1]-1*c, earXY[0]-5*c*side, earXY[1]+20*c, earXY[0]+5*c*side, earXY[1]+18*c);
}
  
// HEAD
void drawHead(int centerX, int centerY, float c, color hairColor){
fill(hairColor);
int[] headXY = findCoordinates(centerX, centerY, c, 36.40055, 0.27829966, 1);
beginShape();
vertex(headXY[0], headXY[1]);
bezierVertex(headXY[0]+2*c, headXY[1]+35*c, headXY[0]+2*c, headXY[1]+35*c, headXY[0]+20*c, headXY[1]+45*c); //left cheek
bezierVertex(centerX, headXY[1]+55*c, centerX, headXY[1]+55*c, headXY[0]+50*c, headXY[1]+45*c); //chin
bezierVertex(headXY[0]+68*c, headXY[1]+35*c, headXY[0]+68*c, headXY[1]+35*c, headXY[0]+70*c, headXY[1]); //right cheek
bezierVertex(headXY[0]+65*c, headXY[1]-35*c, headXY[0]+5*c, headXY[1]-35*c, headXY[0], headXY[1]); //forehead
endShape();
}

// FACIAL HAIR
void drawFacialHair(int centerX, int centerY, int c, color skinTone){
  fill(skinTone);
  int[] facialXY = findCoordinates(centerX, centerY, c, 30.413813, 0.16514868, 1);
  beginShape();
  vertex(facialXY[0], facialXY[1]);
  bezierVertex(facialXY[0]-2*c, facialXY[1]+28*c, facialXY[0]+5*c, facialXY[1]+33*c, facialXY[0]+18*c, facialXY[1]+40*c); //left sideburn
  bezierVertex(facialXY[0]+10*c, facialXY[1]+18*c, facialXY[0]+50*c, facialXY[1]+18*c, facialXY[0]+42*c, facialXY[1]+40*c); //goatee
  bezierVertex(facialXY[0]+55*c, facialXY[1]+33*c, facialXY[0]+62*c, facialXY[1]+28*c, facialXY[0]+60*c, facialXY[1]); //right sideburn
  bezierVertex(facialXY[0]+45*c, facialXY[1]-30*c, facialXY[0]+15*c, facialXY[1]-30*c, facialXY[0], facialXY[1]); //hairline
  endShape();
}

// MOUTH
void drawMouth(int centerX, int centerY, int c, color skinTone){
  fill(skinTone);
  int[] mouthXY = findCoordinates(centerX, centerY, c, 35.128338, -1.4852904, 1);
  beginShape();
  vertex(mouthXY[0], mouthXY[1]);
  bezierVertex(mouthXY[0]+2*c, mouthXY[1]-4*c, mouthXY[0]+4*c, mouthXY[1]-4*c, mouthXY[0]+6*c, mouthXY[1]); //underlip
  bezierVertex(mouthXY[0]+13*c, mouthXY[1]+2*c, mouthXY[0]+15*c, mouthXY[1]-5*c, mouthXY[0]+13*c, mouthXY[1]-10*c); //right mustache
  bezierVertex(mouthXY[0]+11*c, mouthXY[1]-15*c, mouthXY[0]-5*c, mouthXY[1]-15*c, mouthXY[0]-7*c, mouthXY[1]-10*c); //upper mustache
  bezierVertex(mouthXY[0]-9*c, mouthXY[1]-5*c, mouthXY[0]-7*c, mouthXY[1]+2*c, mouthXY[0], mouthXY[1]); //left mustache
  endShape();
  
  bezier(mouthXY[0]+10*c, mouthXY[1]-10*c, mouthXY[0]+5*c, mouthXY[1]-7*c, mouthXY[0]+1*c, mouthXY[1]-7*c, mouthXY[0]-4*c, mouthXY[1]-10*c); //smile
  bezier(mouthXY[0]-1*c, mouthXY[1]-5*c, mouthXY[0]+2*c, mouthXY[1]-3*c, mouthXY[0]+4*c, mouthXY[1]-3*c, mouthXY[0]+7*c, mouthXY[1]-5*c); //lower lip
}
 
// HAIR
void drawHair(int centerX, int centerY, int c, color hairColor){
  fill(hairColor);
  strokeWeight(1.5);
  int[] hairXY = findCoordinates(centerX, centerY, c, 31.764761, 1.0789871, -1);
  beginShape();
  vertex(hairXY[0], hairXY[1]);
  bezierVertex(hairXY[0]-3*c, hairXY[1]+13*c, centerX, hairXY[1]+13*c, hairXY[0]-20*c, hairXY[1]+8*c); //hairline sweep
  bezierVertex(hairXY[0]-30*c, hairXY[1]+3*c, hairXY[0]-35*c, hairXY[1]+13*c, hairXY[0]-33*c, hairXY[1]+20*c); //swoop tail
  bezierVertex(hairXY[0]-50*c, hairXY[1]-7*c, hairXY[0]-10*c, hairXY[1]-22*c, hairXY[0], hairXY[1]); //hair on top
  endShape(); 
}

// EYES
void drawEye(int centerX, int centerY, int c, color eyeColor, int side){
  drawOuterEye(centerX, centerY, c, side, 1);
  drawInnerEye(centerX, centerY, c, eyeColor, side); 
  drawOuterEye(centerX, centerY, c, side, 0);
}

void drawOuterEye(int centerX, int centerY, int c, int side, int fillOption){
  if (fillOption == 1){
    fill(255);
  } else {
    noFill();
  }
  stroke(0);
  int[] eyeXY = findCoordinates(centerX, centerY, c, 5.8309517, -0.5404195, side);
  beginShape();
  vertex(eyeXY[0], eyeXY[1]);
  vertex(eyeXY[0]-5*c*side, eyeXY[1]+4*c);
  vertex(eyeXY[0]-17*c*side, eyeXY[1]+2*c);
  vertex(eyeXY[0]-18*c*side, eyeXY[1]);
  bezierVertex(eyeXY[0]-13*c*side, eyeXY[1]-5*c, eyeXY[0]-6*c*side, eyeXY[1]-5*c, eyeXY[0], eyeXY[1]);
  endShape();
}

void drawInnerEye(int centerX, int centerY, int c, color eyeColor, int side){
  fill(eyeColor);
  noStroke();
  int[] pupilXY = findCoordinates(centerX, centerY, c, 12.572291, -0.30288488, side);
  ellipse(pupilXY[0], pupilXY[1], 7*c, 7*c); //iris
  fill(0);
  ellipse(pupilXY[0], pupilXY[1], 3*c, 3*c); //pupil
  fill(255);
  ellipse(pupilXY[0]+1*c, pupilXY[1]-1*c, 2*c, 2*c); //glare
}

// NOSE
void drawNose(int centerX, int centerY, int c){
  noFill();
  stroke(1.5);
  beginShape();
  int[] noseXY = findCoordinates(centerX, centerY, c, 11.401754, -1.3045443, 1);
  vertex(noseXY[0], noseXY[1]);
  bezierVertex(noseXY[0]-5*c, noseXY[1]+6*c, noseXY[0]+2*c, noseXY[1]+6*c, centerX, noseXY[1]+6*c);
  bezierVertex(noseXY[0]+5*c, noseXY[1]+6*c, noseXY[0]+11*c, noseXY[1]+6*c, noseXY[0]+6*c, noseXY[1]);
  endShape();
}

// EYEBROWS
void drawEyebrows(int centerX, int centerY, int c, color hairColor, int side){
  stroke(hairColor);
  strokeWeight(3.5*c);
  int[] eyebrowXY = findCoordinates(centerX, centerY, c, 6.4031243, 0.67474097, side);
  beginShape();
  vertex(eyebrowXY[0], eyebrowXY[1]);
  vertex(eyebrowXY[0]-10*c*side, eyebrowXY[1]-2*c);
  strokeWeight(3.0*c);
  vertex(eyebrowXY[0]-18*c*side, eyebrowXY[1]+2*c);
  endShape();
}

//calculates datum points for certain features based on unit circle values, magnitude and theta.   
int[] findCoordinates(int centerX, int centerY, float size, float mag, float theta, int side){
  int xValue = round(centerX - size * mag * cos(theta) * side);
  int yValue = round(centerY - size * mag * sin(theta));
  return new int[] {xValue, yValue};
}

// Resources:
// https://processing.org
// https://forum.processing.org
// https://stackoverflow.com
// http://www.bitmoji.com
// "Processing: Creative Coding and Generative Art in Processing 2" by Ira Greenberg, Dianna Xu, and Deepak Kumar