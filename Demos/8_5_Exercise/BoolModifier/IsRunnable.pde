class IsRunnable{
  boolean test;
  
  IsRunnable(){
  }  
  
  IsRunnable(boolean test){
    this.test = test;
  }
  
  void isTrue(){
    if (test){
      println("True");
    } else {
      println("False");
    }
  }
  
  void flipBool(){
    if (test){
      test = false;
    } else {
      test = true;
    }
    println("Flipped!");
  }
}