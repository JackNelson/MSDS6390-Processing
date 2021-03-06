PImage img1, img2;
float halfW, halfH;
int f = 5;
void setup(){
  String url = "https://www.theatricalindex.com/media/cimage/persons/will-ferrell/headshot_headshot.jpg";
  img1 = loadImage(url, "jpg");
  surface.setSize(img1.width*2, img1.height);
  img2 = createImage(img1.width, img1.height, RGB);
  halfW = img1.width/2.0;
  halfH = img1.height/2.0;
}

void draw(){
  image(img1, 0, 0);
  for (int i = 0; i < img1.height; i++){
    for (int j = 0; j < img1.width; j++){
      float r = floor(dist(j, i, mouseX, mouseY));
      float theta = atan2(i - mouseY, j - mouseX);
      float d = degrees(theta);
      int x = mouseX + int(cos(radians(int(d / f) * f)) * int(r / f) * f);
      int y = mouseY + int(sin(radians(int(d / f) * f)) * int(r / f) * f);
      img2.pixels[img1.width * i + j] = img1.pixels[constrain(y * img1.width + x, 0, img1.pixels.length - 1)];
    }
  }
  translate(width/2, 0);
  img2.updatePixels();
  
  image(img2, 0, 0);
}