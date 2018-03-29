float lightX = -50;
float spdX = 1.2;

void setup(){
  size(600, 600, P3D);
  noStroke();
  fill(175);
}

void draw(){
  background(0);
  //lights();
  pointLight(255, 255, 255, lightX, -20, 420);
  pointLight(255, 255, 255, -100, -200, 0);
  translate(width/2, height/2, 200);
  rotateY(frameCount * PI / 180);
  sphere(100);
  lightX += spdX;
}