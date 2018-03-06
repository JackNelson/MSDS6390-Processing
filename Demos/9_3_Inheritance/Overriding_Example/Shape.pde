class Shape{
  
  //fields
  PVector loc;
  color fillCol;
  float radius;
  
  Shape(){
  }
  
  Shape(PVector loc, color fillCol, float radius){
    this.loc = loc;
    this.fillCol = fillCol;
    this.radius = radius;
  }
  
  void construct(){
    println("in Shape construct method");
  }
  
  void move(){
    println("in Shape move method");
  }
  
  void display(){
    println("in Shape display method");
  }
}