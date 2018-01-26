void setup(){
  size(500,500);
  noFill();
  translate(width/2,height/2);
  for(int i = 0; i < 12; i++){ 
    rotate(TWO_PI/12);
    beginShape();
    vertex(0, 30);
    bezierVertex(0, 50, -10, 90, -30, 100);
    vertex(0, 135);
    bezierVertex(-30, 150, -50, 150, -80, 125);
    endShape();
  }
}