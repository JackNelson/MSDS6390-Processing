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