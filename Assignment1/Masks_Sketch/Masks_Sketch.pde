color black = color(22,17,6);
color yellow = color(253,192,70);
color lightBlue = color(102,126,110);
color darkBlue = color(55,95,92);
color lightRed = color(220,94,26);
color darkRed = color(219,78,10);

void setup(){
  size(540,764);
  background(black);
  noStroke();
    
  // TOP FOURTH
  
  //background
  fill(darkBlue); 
  quad(width*0.1907,0, width*0.4296,height*0.2356, 0,height*0.2356, 0,height*0.2068);
  quad(width*0.1759,0, width*0.1907,0, 0,height*0.2356, 0,height*0.1767);
  quad(width-width*0.1907,0, width-width*0.4296,height*0.2356, width,height*0.2356, width,height*0.2068);
  quad(width-width*0.1759,0, width-width*0.1907,0, width,height*0.2356, width,height*0.1767);
  
  fill(black);
  quad(width*0.187,height*0.0105, width*0.4167,height*0.2356, 0,height*0.2356, 0,height*0.2068);
  quad(width-width*0.187,height*0.0105, width-width*0.4167,height*0.2356, width,height*0.2356, width,height*0.2068);
  
  topTriangles(round(width*0.2833), round(height*0.2356), round(width*0.2685), round(height*0.1309));
  topTriangles(round(width-width*0.2833), round(height*0.2356), -round(width*0.2685), round(height*0.1309));
  topInverseTriangles(round(width/2),round(height*0.1832),round(width*0.3));
  
  // MIDDLE SECTION
  
  // background base
  fill(darkRed);
  rect(width*0.05, height*0.3, width*0.9, height*0.15); 
  fill(darkBlue);
  rect(width*0.05, height*0.475, width*0.9, height*0.25);
  fill(lightBlue);
  rect(0, height*0.475, width*0.05, height*0.25);
  rect(width-width*0.05, height*0.475, width, height*0.25);
  fill(lightRed);
  triangle(width*0.05,height*0.325, width*0.05,height*0.45, 0-width*0.1,height*0.45);
  triangle(width*0.95,height*0.325, width*0.95,height*0.45, width+width*0.1,height*0.45);
  middleDiaStripes();
  
  //face
  fill(yellow);
  quad(width*0.015,height*0.2356, width-width*0.015,height*0.2356, width*0.7556,height*0.5, width*0.244,height*0.5);
  middleHorzStripes();
  middleTriangleRow(round(width*0.2833), round(height*0.2356), round(width*0.2685), round(height*0.1309));
  middleTriangleRow(round(width-width*0.2833), round(height*0.2356), -round(width*0.2685), round(height*0.1309));
  fill(black);
  triangle(width*0.5-width*0.2685/4,height*0.2356, width*0.5+width*0.2685/4,height*0.2356, width*0.5,height*0.301);
  
  //eyes
  triangle(width*0.216,height*0.301, width*0.784,height*0.301, width*0.5,height*0.301+sqrt(3)*width*0.568/2);
  middleCircles();
  
  //nose
  fill(darkBlue);
  triangle(width*0.5, height*0.3, width*0.5, height*0.5, width*0.35, height*0.5);
  fill(lightBlue);
  triangle(width*0.5, height*0.3, width*0.5, height*0.5, width*0.65, height*0.5);
  arc(width*0.365, height*0.5, width*0.0926, width*0.0926, PI, TWO_PI);
  fill(darkBlue);
  arc(width*0.635, height*0.5, width*0.0926, width*0.0926, PI, TWO_PI);
  middleVertStripes();
  
  //pencil
  fill(lightRed);
  rect(width*0.185, height*0.5, width*0.652, height*0.016);
  rect(width*0.185, height*0.532, width*0.652, height*0.016);
  arc(width*0.163, height*0.5235, height*0.048, height*0.048, HALF_PI, HALF_PI+PI);
  fill(yellow);
  rect(width*0.185, height*0.5, -width*0.022, height*0.048);
  triangle(width*0.837,height*0.5, width*0.837,height*0.548, width*0.9074,height*0.5235);
  fill(black);
  rect(width*0.185, height*0.516, width*0.652, height*0.016);
  rect(width*0.176, height*0.5, -width*0.004, height*0.048);
  fill(lightRed);
  triangle(width*0.9074,height*0.5235, width*0.884,height*0.532, width*0.884,height*0.516);
  
  //nose correction
  fill(darkBlue);
  rect(width*0.5, height*0.5, -width*0.037, height*0.064);
  fill(lightBlue);
  rect(width*0.5, height*0.5, width*0.037, height*0.064);
  

  
  // BOTTOM FOURTH AND MOUTH
  fill(lightRed);
  triangle(0,height*0.6832, width,height*0.6832, width/2,height);
  bottomCircles(round(width*0.0074), round(height*0.6832), round(width*0.5037), 0);
  bottomCircles(round(width-width*0.0074), round(height*0.6832), round(width*0.5037), 1);
  bottomStripes(round(height*0.6832));
  fill(black);
  triangle(0,height, width,height, width/2,height*0.767);
  bottomTriangles(round(width*0.4648), round(height*0.8377), darkBlue, 0);
  bottomTriangles(round(width*0.5352), round(height*0.8377), lightBlue, 1);
  
  //mouth
  fill(lightBlue);
  triangle(width*0.05,height*0.682, width*0.465,height*0.682, width*0.465,height*0.584);
  triangle(width*0.95,height*0.682, width*0.535,height*0.682, width*0.535,height*0.584);
  triangle(width*0.465,height*0.682, width*0.465,height*0.584, width*0.604,height*0.682);
  triangle(width*0.535,height*0.682, width*0.535,height*0.584, width*0.396,height*0.682);
  fill(black);
  triangle(width*0.05,height*0.682, width*0.95,height*0.682, width*0.5,height*0.634);
  fill(darkBlue);
  triangle(width*0.05,height*0.682, width*0.95,height*0.682, width*0.5,height*0.757);
  
  //teeth
  fill(yellow);
  triangle(width*0.437,height*0.64, width*0.398,height*0.771, width*0.359,height*0.648);
  triangle(width*0.563,height*0.64, width*0.602,height*0.771, width*0.641,height*0.648);
  drawOsTriangle(width*0.231, height*0.682, width*0.1, height*0.115);
  drawOsTriangle(width*0.769, height*0.682, -width*0.1, height*0.115);
  osTwoToneTri(width*0.333, height*0.682, width*0.033, height*0.026, darkRed, lightRed);
  osTwoToneTri(width*0.667, height*0.682, -width*0.033, height*0.026, lightRed, darkRed);
  osTwoToneTri(width*0.5, height*0.682, width*0.074, height*0.039, darkRed, lightRed);
  osTwoToneTri(width*0.5, height*0.682, -width*0.074, height*0.039, lightRed, darkRed);
}

void topTriangles(int x, int y, int base, int tri_height){
  fill(yellow);
  triangle(x,y, x,y-tri_height, round(x-base/4),round(y-tri_height/2));
  fill(darkBlue);
  triangle(x,y, round(x-base/2),y, round(x-base/4),round(y-tri_height/2));
  fill(darkRed);
  triangle(x,y, round(x+base/4),y, round(x+base/4),round(y-tri_height/2));
  fill(lightRed);
  triangle(round(x+base/2),y, round(x+base/4),y, round(x+base/4),round(y-tri_height/2));
}

void topInverseTriangles(int x, int y, int base){
  fill(darkRed);
  triangle(x,y+height*0.0497, round(x-base/2-height*0.0497),0, x,0);
  fill(lightRed);
  triangle(x,y+height*0.0497, round(x+base/2+height*0.0497),0, x,0);
  fill(black);
  triangle(x,y, round(x-base/2),0, round(x+base/2),0);
  fill(yellow);
  triangle(x,round(y/2), round(x-base/4),0, round(x+base/4),0);
  fill(black);
  rect(round(x-base/4),round(y/4), round(base/2), -height*0.017);
}

void middleTriangleRow(int x, int y, int base, int tri_height){
  fill(black);
  triangle(x,y, round(x-base/2),y, round(x-base/4),round(y+tri_height/2));
  triangle(x,y, round(x+base/2),y, round(x+base/4),round(y+tri_height/2));
  fill(darkRed);
  triangle(x,y, round(x-base/4),y, round(x-base/4),round(y+tri_height/2));
}

void middleHorzStripes(){
  for(int i = 0; i < 3; i++){
    fill(black);
    rect(0, height*0.3+(0.05*i*height), width, height*0.025);
  }
}

void middleCircles(){
  color[] colorList = {darkRed, black, lightRed, black, black};
  for (int i = 0; i < 5; i++){
    fill(colorList[i]);
    arc(round(width*0.365), round(height*0.37), round((width*0.13)-(i*width/45)), round((width*0.13)-(i*width/45)), PI+HALF_PI, TWO_PI+HALF_PI);
    arc(round(width*0.635), round(height*0.37), round((width*0.13)-(i*width/45)), round((width*0.13)-(i*width/45)), PI+HALF_PI, TWO_PI+HALF_PI);
  }
  color[] colorList2 = {lightRed, black, darkRed, black, black};
  for (int i = 0; i < 5; i++){
    fill(colorList2[i]);
    arc(round(width*0.365), round(height*0.37), round((width*0.13)-(i*width/45)), round((width*0.13)-(i*width/45)), HALF_PI, PI+HALF_PI);
    arc(round(width*0.635), round(height*0.37), round((width*0.13)-(i*width/45)), round((width*0.13)-(i*width/45)), HALF_PI, PI+HALF_PI);
  }
}

void middleVertStripes(){
  color[] colorList = {black, yellow};
  int j = 0;
  for (int i = 0; i < 7; i++){
    fill(colorList[j]);
    rect(width*0.38+i*width*0.0167, height*0.548, width*0.12-i*width*0.0167, height*0.65);
    rect(width*0.62-i*width*0.0167, height*0.548, -(width*0.12-i*width*0.0167), height*0.65);
    j = j ^ 1;
  }
}

void bottomCircles(int x, int y, int diameter, int s){
  // variable s {0,1) indicator for what side of image
  color[] colorList = {black, yellow, black, darkRed, black, yellow, black, lightRed, lightRed};
  for (int i = 8; i > 0; i--){
    fill(colorList[-1*i+8]);
    arc(x,y, round(diameter*i/8), round(diameter*i/8), s*HALF_PI, s*HALF_PI + HALF_PI);
  } 
  
  color[] colorList2 = {black, darkRed, black, black, black, darkRed, black, black};
  for (int i = 8; i > 0; i--){
    fill(colorList2[-1*i+8]);
    arc(x,y, round(diameter*i/8), round(diameter*i/8), QUARTER_PI + s*QUARTER_PI, HALF_PI + s*QUARTER_PI);
    quad(s*width,y, x+1-s*2,y, s*width,round(y+diameter*i/8/2), x+1-s*2,round(y+diameter*i/8/2));
  }
}

void bottomTriangles(int x, int y, color accent, int s){
  // variable s {0,1) indicator for what side of image
  fill(yellow);
  triangle(x,height, x,y-height*0.0209, s*width-width*0.0704*(s*2-1),height);
  color[] colorList = {accent, black};
  int j = 0;
  for (int i = 0; i < 14; i++){
    fill(colorList[j]);
    triangle(x,y, x,height-(i*height*0.0131), s*width-((s*2-1)*(width*0.1185+i*width*0.0278)),height-(i*height*0.0131));
    j = j ^ 1;
  }
}

void bottomStripes(int y){
  fill(black);
  rect(width*0.3, y, width*0.0556, height-y);
  rect(width*0.4648, y, width*0.0704, height-y);
  rect(width*0.7, y, -width*0.0556, height-y);
  fill(darkRed);
  rect(width*0.3+width*0.0556, y, width*0.0648, height-y);
  rect(width*0.7-width*0.0556, y, -width*0.0648, height-y);
}

void drawOsTriangle(float x, float y, float base, float tri_height){
  triangle(x,y, x+base,y, x+base/2,y-tri_height);
}

void osTwoToneTri(float x, float y, float base, float tri_height, color accent1, color accent2){
  fill(accent1);
  triangle(x,y, x+base/2,y, x+base/2,y-tri_height);
  fill(accent2);
  triangle(x+base/2,y, x+base,y, x+base/2,y-tri_height);
}

void middleDiaStripes(){
  color[] colorList = {black, darkBlue, black, black, darkBlue};
  for(int i = 0; i < 5; i++){
    fill(colorList[i]);
    triangle(i*width*0.05,height*0.683, width*0.380,height*0.683, width*0.380,height*0.475+(i*height*0.0249));
    triangle(width-i*width*0.05,height*0.683, width*0.62,height*0.683, width*0.620,height*0.475+(i*height*0.0249));
    triangle(0,height*0.475, width*0.380-(i*width*0.065),height*0.475, 0,height*0.683-(i*height*0.039));
    triangle(width,height*0.475, width*0.62+(i*width*0.065),height*0.475, width,height*0.683-(i*height*0.039));
  }
}

// Resources:
// https://processing.org
// https://forum.processing.org
// https://stackoverflow.com
// http://www.bennewman.co.uk/