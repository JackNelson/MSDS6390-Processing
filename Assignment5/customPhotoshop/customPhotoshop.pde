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
  surface.setSize(w, h); //resizing canvas to image size
}

void draw(){
  image(img02, 0, 0);
  int w = img02.width;
  int h = img02.height; 
  int stroke = 10; // amount of pixels away from center point for window filtering original pixels (i.e. stroke 1 = 3x3 window) 
  
  int loc_x = windowEdgeFix(mouseX, w, stroke);
  int loc_y = windowEdgeFix(mouseY, h, stroke);
  
  img01.loadPixels();
  img02.loadPixels();
  
  // looping through each pixel in window that is to be updated
  for(int i = loc_y - stroke; i < loc_y+stroke; i++){
      for(int j = loc_x-stroke; j < loc_x+stroke; j++){
        int k = i*w - (w-j);
        color[][] window = getKernelWindow(w, k);
        img02.pixels[k] = getNewColor(window);
      }
  }
  img02.updatePixels();
}

// function that defaults mouseX and mouseY values when stroke goes off the canvas
int windowEdgeFix(int x_y, int w_h, int stroke){
  int new_xy;
  new_xy = x_y;
  if(x_y < stroke + 2){
    new_xy = stroke + 2;
  } else{
    if(x_y > w_h - (stroke + 2)){
      new_xy = w_h - stroke - 2;
    } else{ }
  }
  return new_xy;
}

// generates a 3x3 window of pixels around pixel at k
color[][] getKernelWindow(int w, int k){

  color[][] window = {{img01.pixels[k-w-1], img01.pixels[k-w], img01.pixels[k-w+1]}, 
                      {img01.pixels[k-1], img01.pixels[k], img01.pixels[k+1]}, 
                      {img01.pixels[k+w-1], img01.pixels[k+w], img01.pixels[k+w+1]}};
  return window;
}

// generates new color using 3x3 window pixels around pixel at k and 3x3 convolution kernel 
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