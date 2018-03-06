class ZinniaKinetic{
  //FIELDS
  Zinnia zinnia;
  
  //Optional animation inputs
  float angularSpeed = 0.0174533*30; // 30 degrees/epoch ( deg(0.0174533) = 1 )
  float decay = 0.2; // displacement dampening
  float delay = PI/8; // delay between spinning 
  float displacementClockwise = 2*TWO_PI; // revolutions per oscillation
  float displacementCounterclockwise = 2*TWO_PI; // revolutions per oscillation
    
  //CSTRS
  ZinniaKinetic(){
  }
  
  ZinniaKinetic(Zinnia zinnia){
    this.zinnia = zinnia;
  }
  
  ZinniaKinetic(Zinnia zinnia, float angularSpeed, float decay, float delay, float displacementClockwise, float displacementCounterclockwise){    
    this.zinnia = zinnia;
    this.angularSpeed = angularSpeed;
    this.decay = decay;
    this.delay = delay;
    this.displacementClockwise = displacementClockwise;
    this.displacementCounterclockwise = displacementCounterclockwise;
  }
  
  void rotation(float time){
    float thetaClockwise;
    float thetaCounterclockwise;
    thetaClockwise = displacementClockwise*cos(angularSpeed*time/2);
    thetaCounterclockwise = displacementCounterclockwise*cos(angularSpeed*time/2 - delay);
    
    zinnia.display(thetaClockwise, thetaCounterclockwise);
    damping(time);
  }
  
  void damping(float time){
    //damping displacement with each oscillation
    if (displacementClockwise*cos(angularSpeed*time/2 - delay) == 0){
      displacementClockwise *= decay;
    }
    //damping displacement with each oscillation
    if (displacementCounterclockwise*cos(angularSpeed*time/2 - delay) == 0){
      displacementCounterclockwise *= decay;
    }    
  }
}