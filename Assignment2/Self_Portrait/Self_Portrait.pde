void setup(){
  size(300,500);
  
  beginShape();
  //vertex(width/2-45, 100);
  vertex(width/2-20, 90);
  //left sleeve
  bezierVertex(width/2-20, 90, width/2-60, 100, width/2-63, 135);
  bezierVertex(width/2-63, 135, width/2-53, 145, width/2-43, 140);
  //left side and bottom seam
  bezierVertex(width/2-45, 120, width/2-30, 175, width/2-42, 220);
  bezierVertex(width/2-42, 220, width/2, 250, width/2+42, 220);
  endShape();
  
  beginShape();
  vertex(width/2-20, 90);
  //neck
  bezierVertex(width/2-20, 90, width/2, 110, width/2+20, 90);
  //right sleeve
  bezierVertex(width/2+20, 90, width/2+60, 100, width/2+63, 135);
  bezierVertex(width/2+63, 135, width/2+53, 145, width/2+43, 140);
  //right side
  bezierVertex(width/2+45, 120, width/2+30, 175, width/2+42, 220);
  endShape();
  
  strokeJoin(ROUND);
  strokeCap(ROUND);
  strokeWeight(1.5);
  
  // EARS
  fill(255,205,148);
  bezier(width/2-35, 44, width/2-42, 43, width/2-40, 64, width/2-30, 62);
  bezier(width/2+35, 44, width/2+42, 43, width/2+40, 64, width/2+30, 62);
  
  // HEAD
  fill(9, 8, 6);
  beginShape();
  vertex(width/2-35, 35);
  bezierVertex(width/2-33, 70, width/2-33, 70, width/2-15, 85); //left cheek
  bezierVertex(width/2, 90, width/2, 90, width/2+15, 85); //chin
  bezierVertex(width/2+33, 70, width/2+33, 70, width/2+35, 35); //right cheek
  bezierVertex(width/2+30, 0, width/2-30, 0, width/2-35, 35); //forehead
  endShape();
  
  // FACIAL HAIR
  fill(255,205,148);
  beginShape();
  vertex(width/2-30, 40);
  bezierVertex(width/2-32, 68, width/2-25, 73, width/2-12, 80); //left sideburn
  bezierVertex(width/2-20, 58, width/2+20, 58, width/2+12, 80); //goatee
  bezierVertex(width/2+25, 73, width/2+32, 68, width/2+30, 40); //right sideburn
  bezierVertex(width/2+15, 10, width/2-15, 10, width/2-30, 40); //hairline
  endShape();
  
  // MOUTH
  beginShape();
  vertex(width/2-3, 80);
  bezierVertex(width/2-1, 76, width/2+1, 76, width/2+3, 80); //underlip
  bezierVertex(width/2+10, 82, width/2+12, 75, width/2+10, 70); // right mustache
  bezierVertex(width/2+8, 65, width/2-8, 65, width/2-10, 70); // upper mustache
  bezierVertex(width/2-12, 75, width/2-10, 82, width/2-3, 80); // left mustache
  endShape();
  
  bezier(width/2+7, 70, width/2+2, 73, width/2-2, 73, width/2-7, 70); //smile
  bezier(width/2-4, 75, width/2-1, 77, width/2+1, 77, width/2+4, 75); //lower lip
  
  // HAIR
  fill(9, 8, 6);
  beginShape();
  vertex(width/2+15,17);
  bezierVertex(width/2+12, 30, width/2, 30, width/2-5, 25); //hairline sweep
  bezierVertex(width/2-15, 20, width/2-20, 30, width/2-18, 37); //swoop tail
  bezierVertex(width/2-35, 10, width/2+5, -5, width/2+15,17); //hair on top
  endShape();
  
  // EYES
  fill(255);
  beginShape();
  vertex(width/2-5, 48);
  vertex(width/2-10, 52);
  vertex(width/2-22, 50);
  vertex(width/2-23, 48);
  bezierVertex(width/2-18, 43, width/2-11, 43, width/2-5, 48);
  endShape();
  
  fill(51, 122, 44);
  noStroke();
  ellipse(width/2-12, 49, 7, 7); //iris
  fill(0);
  ellipse(width/2-12, 49, 3, 3); //pupil
  fill(255);
  ellipse(width/2-11, 48, 2, 2);  //glare
  
  noFill();
  stroke(1.5);
  beginShape();
  vertex(width/2-5, 48);
  vertex(width/2-10, 52);
  vertex(width/2-22, 50);
  vertex(width/2-23, 48);
  bezierVertex(width/2-18, 43, width/2-11, 43, width/2-5, 48);
  endShape();
  
  fill(255);
  beginShape();
  vertex(width/2+5, 48);
  vertex(width/2+10, 52);
  vertex(width/2+22, 50);
  vertex(width/2+23, 48);
  bezierVertex(width/2+18, 43, width/2+11, 43, width/2+5, 48);
  endShape();
  
  fill(51, 122, 44);
  noStroke();
  ellipse(width/2+13, 49, 7, 7); //iris
  fill(0);
  ellipse(width/2+13, 49, 3, 3); //pupil
  fill(255);
  ellipse(width/2+14, 48, 2, 2);  //glare
  
  noFill();
  stroke(1.5);
  beginShape();
  vertex(width/2+5, 48);
  vertex(width/2+10, 52);
  vertex(width/2+22, 50);
  vertex(width/2+23, 48);
  bezierVertex(width/2+18, 43, width/2+11, 43, width/2+5, 48);
  endShape();
  
  // NOSE
  noFill();
  beginShape();
  vertex(width/2-3, 56);
  bezierVertex(width/2-8, 62, width/2-1, 62, width/2, 62);
  bezierVertex(width/2+1, 62, width/2+8, 62, width/2+3, 56);
  endShape();
  
  // EYEBROWS
  strokeWeight(3.5);
  beginShape();
  vertex(width/2-5, 41);
  vertex(width/2-15, 39);
  strokeWeight(3.0);
  vertex(width/2-23, 43);
  endShape();
  
  strokeWeight(3.5);
  beginShape();
  vertex(width/2+5, 41);
  vertex(width/2+15, 39);
  strokeWeight(3.0);
  vertex(width/2+23, 43);
  endShape();
}

// Resources:
// https://processing.org
// https://forum.processing.org
// https://stackoverflow.com
// http://www.bitmoji.com
// "Processing: Creative Coding and Generative Art in Processing 2" by Ira Greenberg, Dianna Xu, and Deepak Kumar