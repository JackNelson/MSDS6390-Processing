// subclass
class Burst extends Shape{
  
  //fields
  // PVector loc;
  // color fillCol;
  // float radius;
  
  float pointRadius;
  
  Burst(){
    super();
  }
  
  Burst(PVector loc, color fillCol, float radius, float pointRadius){
    super(loc, fillCol, radius);
    this.pointRadius = pointRadius;
  }
  
  void construct(){
    println("in Burst construct method");
  }
}