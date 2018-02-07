PImage img01;
PImage img02;
float[][] kernel = {{1.0/9, 1.0/9, 1.0/9}, {1.0/9, 1.0/9, 1.0/9}, {1.0/9, 1.0/9, 1.0/9}};

void setup(){
  String url = "http://9b83e3ef165f4724a2ca-84b95a0dfce3f3b3606804544b049bc7.r27.cf5.rackcdn.com/production/local_offices/VJP_4376_Detroit_Nighttime_Skyline_Vito_Palmisano_high.jpg";
  img01 = loadImage(url, "jpg");
  img02 = loadImage(url, "jpg");
  int w = img01.width;
  int h = img01.height;
  surface.setSize(w, h);
  
  image(img01, 0, 0);
  img01.loadPixels();
  img02.loadPixels();

  for(int i = 0; i < h; i++){
    for(int j = 0; j < w; j++){
      
      int k = i*w + j;
      if((i == 0 || i == h-1) || (j == 0 || j == w-1)){ 
      } else{
        color[][] window = {{img01.pixels[k-w-1], img01.pixels[k-w], img01.pixels[k-w+1]}, 
                            {img01.pixels[k-1], img01.pixels[k], img01.pixels[k+1]}, 
                            {img01.pixels[k+w-1], img01.pixels[k+w], img01.pixels[k+w+1]}};
        img02.pixels[k] = getNewColor(window);
      }
    }
  }
  img02.updatePixels();
}

void draw(){
  background(img02);
}

color getNewColor(color[][] window){
  float cRed = 0;
  float cGreen = 0;
  float cBlue = 0;
   
  for(int i = 0; i < window.length; i++){
    for(int j = 0; j < window[i].length; j++){
      cRed += red(window[i][j]) * kernel[i][j];
      cGreen += green(window[i][j]) * kernel[i][j];
      cBlue += blue(window[i][j]) * kernel[i][j];
    }
  }
  color c = color(cRed, cGreen, cBlue);
  return c;
}