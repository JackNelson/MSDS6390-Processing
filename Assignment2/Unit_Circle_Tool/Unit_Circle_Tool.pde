void setup(){
  size(300,500);
  unitCircleConvert(width/2-12, 48.75);
}

void unitCircleConvert(int x, float y){
  int xDist = x - 150;
  float yDist = y - 45;
  
  float mag = sqrt(pow(xDist,2)+pow(yDist,2));
  float theta = asin(yDist / mag);
  
  float xUnit = mag*cos(theta);
  float yUnit = mag*sin(theta);
  
  print("\nTheta: "+theta+"\nMagnitude: "+mag+"\n");
}


/* Example
void drawBitmoji(int x, int y, size){
  
eyeX = centerX - size*mag*cos(theta);
eyeY = centerY - size*mag*sin(theta);

eyebrowX = centerX - size*mag*cos(theta);
eyebrowY = centerY - size*mag*sin(theta);

drawEye(eyeX, eyeY, side);
drawEye(eyeX, eyeY, side);
}
*/