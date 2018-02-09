PImage img01;
PImage img02;

// 3x3 kernels taken from http://matlabtricks.com/post-5/3x3-convolution-kernels-with-online-demo

//float[][] kernel = {{1.0/9, 1.0/9, 1.0/9}, {1.0/9, 1.0/9, 1.0/9}, {1.0/9, 1.0/9, 1.0/9}}; //blur convolution filter
//float[][] kernel = {{0, -1, 0}, {-1, 5, -1}, {0, -1, 0}}; //sharpen convolution filter
float[][] kernel = {{0, -1, 0}, {-1, 4, -1}, {0, -1, 0}}; //edge detection convolution filter
//float[][] kernel = {{0, 0, 0}, {-1, 2, -1}, {0, 0, 0}}; //horizontal edge detection convolution filter
//float[][] kernel = {{0, -1, 0}, {0, 2, 0}, {0, -1, 0}}; //vertical edge detection convolution filter
//float[][] kernel = {{-1, -1, -1}, {0, 0, 0}, {1, 1, 1}}; //horizaontal gradient convolution filter
//float[][] kernel = {{-1, 0, 1}, {-1, 0, 1}, {-1, 0, 1}}; //vertical gradient convolution filter
//float[][] kernel = {{1, 2, 1}, {0, 0, 0}, {-1, -2, -1}}; //horizontal sobel convolution filter
//float[][] kernel = {{1, 0, -1}, {2, 0, -2}, {1, 0, -1}}; //vertical sobel convolution filter
//float[][] kernel = {{-2, -1, 0}, {-1, 1, 1}, {0, 1, 2}}; //emboss convolution filter

void setup(){
  String url = "http://9b83e3ef165f4724a2ca-84b95a0dfce3f3b3606804544b049bc7.r27.cf5.rackcdn.com/production/local_offices/VJP_4376_Detroit_Nighttime_Skyline_Vito_Palmisano_high.jpg";
  img01 = loadImage(url, "jpg");
  img02 = loadImage(url, "jpg");
  int w = img01.width;
  int h = img01.height;
  surface.setSize(w, h);
}

void draw(){
  image(img02, 0, 0);
  int w = img02.width;
  int h = img02.height;
  int k = ((mouseY-1)*w + mouseX);
  println("k: "+k);  
  println("width: "+w);
  println("height: "+h);
  println("x: "+mouseX);
  println("y: "+mouseY);
  
  img01.loadPixels();
  img02.loadPixels();
  
  if((mouseY > 1 && mouseY < h) && (mouseX > 1 && mouseX < w)){ 
        color[][] window = getKernelWindow(w, k);
        img02.pixels[k] = getNewColor(window);
  } else {}
  img02.updatePixels();
}

color[][] getKernelWindow(int w, int k){

  color[][] window = {{img01.pixels[k-w-1], img01.pixels[k-w], img01.pixels[k-w+1]}, 
                      {img01.pixels[k-1], img01.pixels[k], img01.pixels[k+1]}, 
                      {img01.pixels[k+w-1], img01.pixels[k+w], img01.pixels[k+w+1]}};
  return window;
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