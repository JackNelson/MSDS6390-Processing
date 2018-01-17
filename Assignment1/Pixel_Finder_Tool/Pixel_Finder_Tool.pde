PImage webImg;

void setup(){
  size(100,100);
  
  // get image from web and resize to image size
  String url = "http://www.bennewman.co.uk/imageGen.ashx?image=/media/1093/mask04-bennewman.png"; //insert image url here
  webImg = loadImage(url, "png"); //adjust file type as necessary
  surface.setSize(webImg.width,webImg.height);
}

void draw(){
  background(webImg);

  // color square
  color c = get(mouseX,mouseY);
  float redValue = red(c);
  float greenValue = green(c);
  float blueValue = blue(c);
  fill(c);
  rect(mouseX-55,mouseY-30,20,20); 
  
  // coordinate lines
  fill(255);
  stroke(255);
  textSize(10);
  line(0,mouseY,width,mouseY);
  line(mouseX,0,mouseX,height);
  
  // text for RGB values and coordinates 
  text("R:"+round(redValue),mouseX-30,mouseY-21);
  text("G:"+round(greenValue),mouseX-30,mouseY-12);
  text("B:"+round(blueValue),mouseX-30,mouseY-3);
  text("x:"+mouseX,mouseX+2,mouseY-12);
  text("y:"+mouseY,mouseX+2,mouseY-3);
}
  
void mouseReleased(){
  // initialize RGB values of swatch
  float[] redValues = {};
  float[] greenValues = {};
  float[] blueValues = {};
  
  // get RGB values of swatch
  for (int i = 0; i < 10; i++){
    for (int j = 0; j < 10; j++){
      color cSwatch = get(mouseX-11+i, mouseY+1+j);
      redValues = append(redValues, red(cSwatch));
      greenValues = append(greenValues, green(cSwatch));
      blueValues = append(blueValues, blue(cSwatch));
    }
  }
  
  // draw swatch
  noFill();
  stroke(255);
  rect(mouseX-11,mouseY+1,10,10);
  
  //print results
  print("\nX:", mouseX, "("+nf(float(mouseX)/width,1,4)+")", "\nY:", mouseY, "("+nf(float(mouseY)/height,1,4)+")", "\n");
  print("\nAverage R:", average(redValues), "Stdev R:", stdev(redValues, average(redValues)));
  print("\nAverage G:", average(greenValues), "Stdev G:", stdev(greenValues, average(greenValues)));
  print("\nAverage B:", average(blueValues), "Stdev B:", stdev(blueValues, average(blueValues)), "\n");
}

// function to get average of an array of floats
float average(float[] valuesArray){
  float sum = 0;
  for (int i = 0; i < valuesArray.length; i++){
    sum += valuesArray[i];
  }
  return (sum/valuesArray.length);
}

// function to get standard deviation of array of floats
float stdev(float [] valuesArray, float valuesAverage){
  float stdev = 0;
  for (int i = 0; i < valuesArray.length; i++){
    stdev += pow(valuesArray[i]-valuesAverage,2);
  }
  return sqrt(stdev/(valuesArray.length - 1));
}
 
// Resources:
// https://processing.org
// https://forum.processing.org
// https://stackoverflow.com
// http://www.bennewman.co.uk/