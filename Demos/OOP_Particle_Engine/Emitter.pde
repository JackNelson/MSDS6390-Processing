class Emitter{
  
  //fields
  PVector loc;
  int particleCount;
  float particleBirthRate;
  PVector sprayVector;
  float sprayRadius;
  boolean isInfinite = false;
  
  //
  Particle[] particles;
  float currentParticleCount = 0;
  String particleSpriteURL;
  float particleScale = 1;
  
  //cstrs
  Emitter(){
  }
  
  Emitter(PVector loc, int particleCount, float particleBirthRate, PVector sprayVector, 
    float sprayRadius, boolean isInfinite){
      this.loc = loc;
      this.particleCount = particleCount;
      this.particleBirthRate = particleBirthRate;
      this.sprayVector = sprayVector;
      this.sprayRadius = sprayRadius;
      this.isInfinite = isInfinite;
        
      particles = new Particle[particleCount];
      init();
  }
    
  Emitter(PVector loc, int particleCount, float particleBirthRate, PVector sprayVector, 
  float sprayRadius, boolean isInfinite, String particleSpriteURL, float particleScale){
    this.loc = loc;
    this.particleCount = particleCount;
    this.particleBirthRate = particleBirthRate;
    this.sprayVector = sprayVector;
    this.sprayRadius = sprayRadius;
    this.isInfinite = isInfinite;
    this.particleSpriteURL = particleSpriteURL;
    this.particleScale = particleScale;
        
    particles = new Particle[particleCount];
    init(particleSpriteURL);
  }  
  
  void init(String particleSpriteURL){
    for(int i = 0; i<particles.length; i++){
      float scl = random(1, particleScale);
      //Particle(PVector loc, PVector velocity, float scl, String particleSpriteURL)
      PVector vel = new PVector(sprayVector.x + random(-sprayRadius, sprayRadius), 
        sprayVector.y + random(-sprayRadius, sprayRadius));
      particles[i] = new Particle(new PVector(loc.x, loc.y), vel, scl, particleSpriteURL);
    }
  }
  
  void init(){
    for(int i = 0; i<particles.length; i++){
      float scl = random(1, particleScale);
      //Particle(PVector loc, PVector velocity, float scl, String particleSpriteURL)
      PVector vel = new PVector(sprayVector.x + random(-sprayRadius, sprayRadius), 
        sprayVector.y + random(-sprayRadius, sprayRadius));
      particles[i] = new Particle(new PVector(loc.x, loc.y), vel, scl);
    }
  }
  
  void run(float gravity, PVector turbulance, PVector wind){
    for (int i = 0; i<currentParticleCount; i++){
      particles[i].velocity.y += gravity;
      particles[i].velocity.add(new PVector(random(-turbulance.x, turbulance.x), random(-turbulance.y, turbulance.y)));
      particles[i].velocity.add(wind);
      particles[i].move();
      particles[i].display();
      
      //reset particles
      if(isInfinite){
        if(particles[i].loc.y > height || particles[i].loc.x > width || particles[i].loc.x < 0){
          particles[i].loc = new PVector(loc.x, loc.y);
          particles[i].velocity = new PVector(sprayVector.x + random(-sprayRadius, sprayRadius), 
            sprayVector.y + random(-sprayRadius, sprayRadius));
        }
      }
    }
    if(currentParticleCount < particleCount-particleBirthRate){
      currentParticleCount += particleBirthRate;
    }
  }
}