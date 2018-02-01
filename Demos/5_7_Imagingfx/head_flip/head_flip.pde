PImage img1;
PImage img2;

void setup(){
  background(255);
  String url = "https://www.theatricalindex.com/media/cimage/persons/will-ferrell/headshot_headshot.jpg";
  img1 = loadImage(url, "jpg");
  
  img2 = createImage(img1.width, img1.height, RGB);
  surface.setSize(img1.width*2, img1.height);
}

void draw(){
  int len = img1.pixels.length - 1;
  image(img1, 0, 0);
  
  for (int i = len; i >= 0; i--){
    img2.pixels[len-i] = img1.pixels[i];
  }
  image(img2, width/2, 0);
}