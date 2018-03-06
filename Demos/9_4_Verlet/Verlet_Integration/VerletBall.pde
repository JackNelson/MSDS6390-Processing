class VerletBall{
  
  PVector pos, posOld;
  PVector push;
  float radius;
  
  VerletBall(){
  }
  
  VerletBall(PVector pos, float radius){
    this.pos = pos;
    this.radius = radius;
    this.posOld = new PVector(pos.x, pos.y);
  }
  
  // start motion
  void start(PVector push){
    pos.add(push);
  }
  
  void verlet(){
    PVector posTemp = new PVector(pos.x, pos.y);
    pos.x += (pos.x - posOld.x);
    pos.y += (pos.y - posOld.y);
    posOld.set(posTemp);
  }
  
  void render() {
    ellipse(pos.x, pos.y, radius*2, radius*2);
  }
  
  void boundsCollision(){
    if (pos.x > width - radius){
      pos.x = width - radius;
      posOld.x = pos.x;
    } else if (pos.x < radius){
      pos.x = radius;
      posOld.x = pos.x;
    }
    
    if (pos.y < radius){
      pos.y = radius;
      posOld.y = pos.y;
    }
    if (pos.y > height-radius){
      pos.y = height - radius;
      posOld.y = pos.y;
    }
  }
}