void createTree(){
  
  stroke(60, 30, 10);
  fill(60, 30, 10);
  
  // Main Stem joining bottom to center of Zinnia structure
  beginShape();
  curveVertex(width/2-30, height);
  curveVertex(width/2-30, height);
  curveVertex(width/2+30, height);
  curveVertex(width/2, height/2-height/8);
  curveVertex(width/2, height/2-height/8);
  endShape(CLOSE);
  
  // Stem joining bottom center to the left Marigold
  beginShape();
  curveVertex(width/2-30, height);
  curveVertex(width/2-30, height);
  curveVertex(width/2+30, height);
  curveVertex(int(width/4), int(3*height/5));
  curveVertex(int(width/4), int(3*height/5));
  endShape(CLOSE);
  
  // Stem joining bottom center to the right Marigold
  beginShape();
  curveVertex(width/2-30, height);
  curveVertex(width/2-30, height);
  curveVertex(width/2+30, height);
  curveVertex(int(3*width/4), int(3* height/5));
  curveVertex(int(3*width/4), int(3* height/5));
  endShape(CLOSE);
}