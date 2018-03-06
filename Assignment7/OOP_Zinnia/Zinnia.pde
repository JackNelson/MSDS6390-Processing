class Zinnia{  
  //FIELDS
  //Zinnia blade shape
  PShape zinniaBlade;
  
  //Structure placement
  PVector loc = new PVector(0, 0);
  
  //Optional aesthetic inputs 
  PVector scl = new PVector(1, 1);  // size of structure
  int sides = 12; // number of sides in structure
  int strokeWt = 8; // line thickness for side
  color zColor = color(0, 0, 0); // structure color
  
  //CSTRS
  Zinnia(){
    this.zinniaBlade = zinniaBlade(scl, strokeWt, zColor);
  }
  
  Zinnia(PVector loc){
    this.loc = loc;
  
    this.zinniaBlade = zinniaBlade(scl, strokeWt, zColor);
  }
  
  Zinnia(PVector loc, PVector scl, int sides, int strokeWt, color zColor){
    this.loc = loc;
    this.scl = scl;
    this.sides = sides;
    this.strokeWt = strokeWt;
    this.zColor = zColor;
    
    this.zinniaBlade = zinniaBlade(scl, strokeWt, zColor);
  }
  
  PShape zinniaBlade(PVector scl, int strokeWt, color zColor){
    noFill();
    strokeWeight(strokeWt);
    stroke(zColor);
    
    pushMatrix();
    scale(scl.x, scl.y);
    
    PShape zinniaBlade = createShape();
    zinniaBlade.beginShape();
    zinniaBlade.vertex(0, 30);
    zinniaBlade.bezierVertex(0, 50, -10, 90, -30, 100);
    zinniaBlade.vertex(0, 135);
    zinniaBlade.bezierVertex(-30, 150, -50, 150, -80, 125);
    zinniaBlade.endShape();
    popMatrix();
    
    return zinniaBlade;
  }
  
  void display(float thetaClockwise, float thetaCounterclockwise){  
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(thetaClockwise);
    
    for(int i = 0; i < sides; i++){
      shape(zinniaBlade, 0, 0);
      rotate(TWO_PI/sides);
    }
    popMatrix();
    
    pushMatrix();
    translate(loc.x, loc.y);
    scale(-1, 1);
    rotate(thetaCounterclockwise);
    
    for(int i = 0; i < sides; i++){
      shape(zinniaBlade, 0, 0);
      rotate(TWO_PI/sides);
    }
    popMatrix();
  }
}