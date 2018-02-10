// 3x3 kernels taken from http://matlabtricks.com/post-5/3x3-convolution-kernels-with-online-demo

void keyPressed(){
  //press spacebar to reset image and kernel
  if(key == ' '){
    img02 = loadImage(url, "jpg");
    kernel = new float[][]{{0, 0, 0}, {0, 1, 0}, {0, 0, 0}};
  }
  //press b key to switch to blur kernel
  if(key == 'b'){
    kernel = new float[][]{{1.0/9, 1.0/9, 1.0/9}, {1.0/9, 1.0/9, 1.0/9}, {1.0/9, 1.0/9, 1.0/9}};
  }
  //press e key to switch to edge detection kernel
  if(key == 'e'){
    kernel = new float[][]{{0, -1, 0}, {-1, 4, -1}, {0, -1, 0}};
  }
  //press s key to switch to sharpen kernel
  if(key == 's'){
    kernel = new float[][]{{0, -1, 0}, {-1, 5, -1}, {0, -1, 0}};
  }
  //press m key to switch to emboss kernel
  if(key == 'm'){
    kernel = new float[][]{{-2, -1, 0}, {-1, 1, 1}, {0, 1, 2}};
  }
  //press w to switch to horizontal edge detection kernel (left of 'e')
  if(key == 'w'){
    kernel = new float[][]{{0, 0, 0}, {-1, 2, -1}, {0, 0, 0}};
  }
  //press r to switch to vertical edge detection kernel (right of 'e')
  if(key == 'r'){
    kernel = new float[][]{{0, -1, 0}, {0, 2, 0}, {0, -1, 0}};
  }
  //press f to switch to horizontal gradient kernel (left of 'g')
  if(key == 'f'){
    kernel = new float[][]{{-1, -1, -1}, {0, 0, 0}, {1, 1, 1}};
  }
  //press h to switch to vertical gradient kernel (right of 'g')
  if(key == 'h'){
    kernel = new float[][]{{-1, 0, 1}, {-1, 0, 1}, {-1, 0, 1}};
  }
  //press a to switch to horizontal gradient kernel (left of 's')
  if(key == 'a'){
    kernel = new float[][]{{1, 2, 1}, {0, 0, 0}, {-1, -2, -1}};
  } 
  //press d to switch to vertical gradient kernel (right of 's')
  if(key == 'd'){
    kernel = new float[][]{{1, 0, -1}, {2, 0, -2}, {1, 0, -1}};
  }      
}