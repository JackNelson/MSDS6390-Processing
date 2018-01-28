//zinnia global variables 
float angularSpeed = 0.0174533*30; // 30 degrees/epoch ( deg(0.0174533) = 1 )
float decay = 0.2; // displacement dampening
float displacementClockwise; // revolutions per oscillation
float displacementCounterclockwise; 
float time; // in seconds
int wavePeriodClockwise; // numbered oscillation
int wavePeriodCounterclockwise;

void setup(){
  size(500,500);
  displacementClockwise = 2*TWO_PI; // two revolutions 
  displacementCounterclockwise = 2*TWO_PI;
  time = 0;
  wavePeriodClockwise = 1;
  wavePeriodCounterclockwise = 1;  
}

void draw(){
  background(255);
  
//drawZinniaHalf(int x, int y, int sides, float displacement, float time, float delay, float scale, float mirror, color zinniaColor, int strokeWt)
  drawZinniaHalf(width/2, height/2, 12, displacementClockwise, time, 0, 1, 1, 0, 10);
  drawZinniaHalf(width/2, height/2, 12, displacementCounterclockwise, time, PI/8, 1, -1, 0, 10);
  
  time += 0.016667;
}

void drawZinniaHalf(int x, int y, int sides, float displacement, float time, float delay, float scale, float mirror, color zinniaColor, int strokeWt){  
  stroke(zinniaColor);
  strokeWeight(strokeWt);
  noFill();
  
  pushMatrix();
  translate(x, y);
  rotate(mirror*displacement*cos(angularSpeed*time/2 - delay)); //rotates to cosine wave (y = A * cosine((omega * t) / period - phi) 
  scale(mirror*scale, scale);
  
  //drawing zinnia flower circle
  for(int i = 0; i < sides; i++){ 
    rotate(TWO_PI/sides);
    beginShape();
    vertex(0, 30);
    bezierVertex(0, 50, -10, 90, -30, 100);
    vertex(0, 135);
    bezierVertex(-30, 150, -50, 150, -80, 125);
    endShape();
  }
  //drawing zinnia flower center
  fill(30);
  ellipse(0,0,60,60);
  noStroke();
  fill(50);
  ellipse(0,0,30,30);
  noFill();
  stroke(0);
  popMatrix();
  
  //damping displacement with each oscillation
  if (displacement*cos(angularSpeed*time/2 - delay) == 0){
    displacementClockwise *= decay;
  }
}