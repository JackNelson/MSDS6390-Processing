//float speedClockwise;
//float speedCounterClockwise;
float decay;
float displacement;
float angularSpeed;
float time;
int wavePeriod;
int x;
int y;

void setup(){
  size(500,500);
  noFill();
  //speedClockwise = 0;
  strokeWeight(10);
  decay = 0.8;
  displacement = 5*TWO_PI;
  angularSpeed = 0.0174533*30;
  time = 0;
  wavePeriod = 1;
}

void draw(){
  background(255);
  
  pushMatrix();
  translate(width/2,height/2);
  rotate(displacement*/*exp(-1*decay*time)*/cos(angularSpeed*time/2 - PI/8));
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
  //rotate(TWO_PI/360 + speedClockwise);
  rotate(-displacement*/*exp(-1*decay*time)*/cos(angularSpeed*time/2));
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
  time += 0.016667;
  popMatrix();
  
  if (time > TWO_PI*wavePeriod){
    displacement *= decay;
    wavePeriod += 1;
  }
}