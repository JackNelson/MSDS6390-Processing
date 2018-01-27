//float speedClockwise;
//float speedCounterClockwise;
float decayClockwise;
float decayCounterclockwise;
float displacementClockwise;
float displacementCounterclockwise;
float angularSpeed;
float time;
int wavePeriodClockwise;
int wavePeriodCounterclockwise;
int x;
int y;

void setup(){
  size(500,500);
  noFill();
  //speedClockwise = 0;
  strokeWeight(10);
  decayClockwise = 0.2;
  decayCounterclockwise = 0.2;
  displacementClockwise = 2*TWO_PI;
  displacementCounterclockwise = 2*TWO_PI;
  angularSpeed = 0.0174533*30;
  time = 0;
  wavePeriodClockwise = 1;
  wavePeriodCounterclockwise = 1;
  
}

void draw(){
  background(255);
  
  pushMatrix();
  translate(width/2,height/2);
  rotate(displacementClockwise*/*exp(-1*decay*time)*/cos(angularSpeed*time/2 - PI/8));
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
  rotate(-displacementCounterclockwise*/*exp(-1*decay*time)*/cos(angularSpeed/2*time));
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
  
  if (displacementClockwise*/*exp(-1*decay*time)*/cos(angularSpeed*time/2 - PI/8) == 0){
    displacementClockwise *= decayClockwise;
  }
  
  if (-displacementCounterclockwise*/*exp(-1*decay*time)*/cos(angularSpeed*time/2) == 0){
    displacementCounterclockwise *= decayCounterclockwise;
  }
    
}
// Turn whole spinning motion into one function and call clockwise or counterclockwise