PImage img01;
PImage img02;
String url = "http://9b83e3ef165f4724a2ca-84b95a0dfce3f3b3606804544b049bc7.r27.cf5.rackcdn.com/production/local_offices/VJP_4376_Detroit_Nighttime_Skyline_Vito_Palmisano_high.jpg";
float[][] kernel;

void setup(){
  img01 = loadImage(url, "jpg"); 
  img02 = loadImage(url, "jpg");
  int w = img01.width;
  int h = img01.height;
  kernel = new float[][]{{0, 0, 0}, {0, 1, 0}, {0, 0, 0}}; //identity kernel
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