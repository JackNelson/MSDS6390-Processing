Engine engine;

void setup(){
  size(800, 600); 
  //Emitter(PVector loc, int particleCount, float particleBirthRate, PVector sprayVector, 
  //float sprayRadius, boolean isInfinite)
  Emitter emitter = new Emitter(new PVector(width/2, 200), 300, 1, new PVector(.01, -10.2), 1.25, true);
    
  //Engine(Emitter emitter, float gravity, PVector turbulance, PVector wind)
  engine = new Engine(emitter, 1.15, new PVector(.5, .5), new PVector(.002, -0.7));
}

void draw(){
  fill(0, 175);
  rect(-1, -1, width+1, height+1);
  
  engine.start();
}