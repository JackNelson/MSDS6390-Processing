void unitCircleConvert(int x, int y){
  xDist = x - 150;
  yDist = y - 45;
  
  mag = sqrt(pow(xDist,2)+pow(yDist,2);
  theta = asin(yDist / mag);
  
  yUnit = mag*sine(theta) 
  
  
}

/* Example
void drawBitmoji(int x, int y, size){
  
eyeX = centerX - size*mag*cos(theta);
eyeY = centerY - size*mag*sin(theta);

eyebrowX

drawEye(eyeX, eyeY, side);
drawEye(eyeX, eyeY, side);
}

*/