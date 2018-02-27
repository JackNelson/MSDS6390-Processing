class Engine{
  
  //fields
  Emitter emitter;
  Emitter[] emitters;
  float gravity;
  PVector turbulance;
  PVector wind;
  
  Engine(){
  }
  
  Engine(Emitter emitter, float gravity, PVector turbulance, PVector wind){
    this.emitter = emitter;
    this.gravity = gravity;
    this.turbulance = turbulance;
    this.wind = wind;
  }
  
  Engine(Emitter[] emitters){
    this.emitters = emitters;
  }
  
  void start(){
    emitter.run(gravity, turbulance, wind);
  }
  
  void stop(){
  }
}