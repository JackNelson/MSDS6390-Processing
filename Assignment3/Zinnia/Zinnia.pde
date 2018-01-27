float speedClockwise;
float speedCounterClockwise;
float damping;
int x;
int y;

void setup(){
  size(500,500);
  noFill();
  speedClockwise = 0;
  strokeWeight(10);
  damping = .;
}

void draw(){
  background(255);
  
  pushMatrix();
  translate(width/2,height/2);
  rotate(TWO_PI/360 - speedClockwise);
  //scale(-1, 1);
  for(int i = 0; i < 12; i++){ 
    rotate(TWO_PI/12);
    beginShape();
    vertex(0, 30);
    bezierVertex(0, 50, -10, 90, -30, 100);
    vertex(0, 135);
    bezierVertex(-30, 150, -50, 150, -80, 125);
    endShape();
  }
  popMatrix();  
  
  pushMatrix();
  translate(width/2,height/2);
  rotate(TWO_PI/360 + speedClockwise);
  scale(-1, 1);
  for(int i = 0; i < 12; i++){ 
    rotate(TWO_PI/12);
    beginShape();
    vertex(0, 30);
    bezierVertex(0, 50, -10, 90, -30, 100);
    vertex(0, 135);
    bezierVertex(-30, 150, -50, 150, -80, 125);
    endShape();
  }
  speedClockwise += 1*damping;
  popMatrix();
}