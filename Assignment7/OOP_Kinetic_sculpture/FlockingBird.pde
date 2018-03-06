// Class Bird: to create the bird structure on the sketch
// x,y are the coordinates of bird position on the sketch
// xspeed is the horizontal speed of the bird i.e. flocking speed
class Bird {        
  float x;
  float y;
  float xspeed;     

  // Constructor to create the Bird object
  // tempx,tempy are the initial coordinates of bird position on the sketch
  // xspeed is the horizontal speed of the bird i.e. flocking speed
  Bird(float tempx, float tempy, float tempspeed) { 
    x = tempx;   
    y = tempy;
    xspeed = tempspeed;
  }

  // display function create the Bird structure on the sketch
  void display() {
    noStroke();
    fill(random(10));
    ellipse(x, y, 10, random(60));
    triangle(x, y, x+30, y-10, x-40, y+30);
  }

  // drive function adds movement to the bird structure by changing the coordinates
  // newYPos defines the new vertical re-entry position of the bird once it reaches the vertical end of the sketch
  void drive(float newYPos) {             
    x = x + xspeed;
    if (x > width) {
      x = 0;
      y = newYPos;
    }
    display();
  }
}