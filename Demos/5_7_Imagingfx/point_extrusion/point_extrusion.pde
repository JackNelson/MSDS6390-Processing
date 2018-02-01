float detail;

PImage img1;
PVector[][] vecs;
int imgW, imgH;

void setup(){
  background(255);
  size(100, 100, P3D);
  String url = "https://www.theatricalindex.com/media/cimage/persons/will-ferrell/headshot_headshot.jpg";
  img1 = loadImage(url, "jpg");
  surface.setSize(img1.width*2, img1.height);
  
  imgW = img1.width;
  imgH = img1.height;
  
  vecs = new PVector[imgH][imgW];
  
  for (int i = 0; i < imgH; i++){
    for (int j = 0; j < imgW; j++){
      vecs[i][j] = new PVector(j, i, 0);
    }
  }
}

void draw(){
  background(0);
  image(img1, 0, 0);
  
  lights();
  
  if (mouseX < width/2){
    detail = mouseX * .005;
  }
  
  translate(width - imgW / 2, height / 2, -255 / 2);
  rotateY(frameCount * PI / 720);
  
  for (int i = 0; i < imgH; i++){
    for (int j = 0; j < imgW; j++){
      stroke(img1.pixels[i * imgW + j]);
      float z = -255 / 2 + brightness(img1.pixels[i * imgW + j]);
      point(-imgW / 2 + vecs[i][j].x, -imgH / 2 + vecs[i][j].y, z * detail);
    }
  }
}