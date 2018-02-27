class Particle{
  
  //fields
  PVector loc;
  PVector velocity;
  float scl;
  PImage p;
  
  //cstrs
  Particle(){
  }
  
  Particle(PVector loc, PVector velocity, float scl, String particleSpriteURL){
    this.loc = loc;
    this.scl = scl;
    this.velocity = velocity;
    p = loadImage(particleSpriteURL);
  }
  
  Particle(PVector loc, PVector velocity, float scl){
    this.loc = loc;
    this.scl = scl;
    this.velocity = velocity;
  }
  
  void move(){
    loc.add(velocity);
  }
  
  void display(){
    pushMatrix();
    translate(loc.x, loc.y);
    scale(scl);
    if(p != null){
      image(p, -p.width/2, -p.height/2);
    } else{
      fill(255);
      ellipse(0, 0, 20, 20);
      fill(0);
    }
    popMatrix();
  }
}