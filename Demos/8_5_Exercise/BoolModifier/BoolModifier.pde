IsRunnable run = new IsRunnable();
boolean test = true;

setup(){
  run = new IsRunnable(test);
  run.isTrue();
  run.flipBool();
  println(run.test);
}