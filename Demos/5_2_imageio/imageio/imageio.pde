PImage img01;

void setup(){
  String url = "http://9b83e3ef165f4724a2ca-84b95a0dfce3f3b3606804544b049bc7.r27.cf5.rackcdn.com/production/local_offices/VJP_4376_Detroit_Nighttime_Skyline_Vito_Palmisano_high.jpg";
  img01 = loadImage(url, "jpg");
  int w = img01.width;
  int h = img01.height;
  surface.setSize(w, h);
}

void draw(){
  background(img01);
}