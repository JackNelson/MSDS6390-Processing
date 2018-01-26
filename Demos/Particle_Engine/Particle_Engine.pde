float birthRate = .4;
float particleCountCurrent = 0;
int particleCount = 300;
float[] x = new float[particleCount];
float[] y = new float[particleCount];
int[] sideCount = new int[particleCount];
float[] radius = new float[particleCount];
float[] speedX = new float[particleCount];
float[] speedY = new float[particleCount];
float[] gravity = new float[particleCount];
float[] damping = new float[particleCount];
float[] friction = new float[particleCount];

void setup(){
  size(800,1000);
  for (int i=0; i< particleCount; i++){
    x[i] = width/2;
    y[i] = 250;
    sideCount[i] = int(random(3, 10));
    speedX[i] = random(-1.2, 1.2);
    speedY[i] = random(-4, -10);
    radius[i] = random(1, 4);
    gravity[i] = .09;
    damping[i] = .77;
    friction[i] = .77;
  }
}

void draw() {
  background(255);
  fill(255,5);
  noStroke();
  rect(-1, -1, width+1, height+1);
  //polygon(float x, float y, float radius, int sides, float strokeWt, color strokeCol)
  for (int i=0; i<particleCountCurrent; i++){
    polygon(x[i], y[i], radius[i], sideCount[i], 2, color(255, 0, 0, 100));
    x[i] += speedX[i]; //+ random(-3, 3);
    speedY[i] += gravity[i];
    y[i] += speedY[i];
    
    checkCollisions(i);
  }
  
  if(particleCountCurrent < particleCount - birthRate){
    particleCountCurrent += birthRate;
  }
}

void checkCollisions(int i){
  if (x[i] > width - radius[i]){
    x[i] = width - radius[i];
    speedX[i] = speedX[i] * -1;
  }
  
  if (x[i] < radius[i]){
    x[i] = radius[i];
    speedX[i] = speedX[i] * -1;
  }
  
  if (y[i] > height - radius[i]){
    y[i] = height - radius[i];
    speedY[i] = speedY[i] * -1;
    speedY[i] *= damping[i];
    speedX[i] *= friction[i];
  }
  
  if (y[i] < radius[i]){
    y[i] = radius[i];
    speedY[i] = speedY[i] * -1;
  }
}

  
    