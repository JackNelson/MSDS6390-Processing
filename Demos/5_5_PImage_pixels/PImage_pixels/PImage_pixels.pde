PImage img;
void setup(){
  size(600, 200);
  String url = "http://9b83e3ef165f4724a2ca-84b95a0dfce3f3b3606804544b049bc7.r27.cf5.rackcdn.com/production/local_offices/VJP_4376_Detroit_Nighttime_Skyline_Vito_Palmisano_high.jpg";
  img = loadImage(url);
  image(img, 0, 0);
  
  loadPixels();
  for (int i = 0; i < 1200; i++){
    img.pixels[int(random(img.pixels.length))] = color(255);
  }
  img.updatePixels();
  
  image(img, width/2, 0);
  loadPixels();
  for (int i = 0; i < 1200; i++){
    pixels[int(random(pixels.length))] = color(255);
  }  
  updatePixels();
}