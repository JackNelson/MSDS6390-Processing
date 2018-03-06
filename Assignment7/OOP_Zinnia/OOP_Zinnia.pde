ZinniaKinetic zinniaKinetic;
float time = 0;

void setup(){
  size(1000, 800);
  
  Zinnia zinnia = new Zinnia(new PVector(width/2, height/2));
  
  zinniaKinetic = new ZinniaKinetic(zinnia);
}
  
void draw(){
  fill(255);
  rect(-1, -1, width+1, height+1);
  
  zinniaKinetic.rotation(time);
  time += 0.016667;
}