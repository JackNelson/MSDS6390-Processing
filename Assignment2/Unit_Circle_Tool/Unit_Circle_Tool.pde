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

// Resources:
// https://processing.org
// https://forum.processing.org
// https://stackoverflow.com
// http://www.bitmoji.com
// "Processing: Creative Coding and Generative Art in Processing 2" by Ira Greenberg, Dianna Xu, and Deepak Kumar