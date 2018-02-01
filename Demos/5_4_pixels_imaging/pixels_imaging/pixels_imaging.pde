PImage img;
void setup(){
  size(300, 200);
  String url = "http://9b83e3ef165f4724a2ca-84b95a0dfce3f3b3606804544b049bc7.r27.cf5.rackcdn.com/production/local_offices/VJP_4376_Detroit_Nighttime_Skyline_Vito_Palmisano_high.jpg";
  img = loadImage(url);
  image(img, 0, 0);
  loadPixels();
  for (int i = 0; i < pixels.length; i++){
    float r = red(pixels[i]);
    float g = green(pixels[i]);
    float b = blue(pixels[i]);
    r *= 0.5;
    g *= 0.5;
    b *= 0.5;
    pixels[i] = color(r, g, b);
  }
  updatePixels();
}