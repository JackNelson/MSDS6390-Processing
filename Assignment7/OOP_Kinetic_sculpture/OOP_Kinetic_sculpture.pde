// Assignment 7: Kinetic Sculpture using OOP's
// Submitted By Ireti Fasere, Jack Nelson and Hari Narayan Sanadhya

//Marigold Constructor Parameters
// frontRotationSpeed is the angular speed of rotation of the front portion of the sculpture
float frontRotationSpeed = 0.005;
// backRotationSpeed is the angular speed of rotation of the front portion of the sculpture
float backRotationSpeed = -0.01;
// startFrontAngle is the angle w.r.t. the x-axis where the first middle circular spoke of the front side should be created
float startFrontAngle = 0;
// startFrontAngle is the angle w.r.t. the x-axis where the first middle circular spoke of the back side should be created
float startBackAngle = 0;
// innerArcRadius is the radius of the middle circular spikes, the circle of the middle circular spikes passes through the center of the figure
float innerArcRadius = 40;
// maxArcRadius is the Maximum value of the radius of the middle circular spike
float maxArcRadius = innerArcRadius *1.1;
// minArcRadius is the Minimum value of the radius of the middle circular spike
float minArcRadius = innerArcRadius * 0.9;
// numberSides defines the number of the middle circular spokes to be used to create the Marigold Structure
int numberSides = 10;
// widthOfSpikes is the width of the wooden blocks used to create the Marigold
int widthOfSpikes = 8;


float time; // in seconds

//Class objects for the 3 kinetic sculptures
Bird[] birds = new Bird[5]; //numbers of birds
Marigold obj1, obj2;
ZinniaKinetic zinniaKinetic;

void setup() {
  size(800, 800);
  time = 0;
  
  // Initialize zinnia/zinniaKinetic objects
  pushMatrix();
  Zinnia zinnia = new Zinnia(new PVector(width/2, height/2-height/8)); //constructing Zinnia(PVector loc)
  zinniaKinetic = new ZinniaKinetic(zinnia); //constructing ZinniaKinetic(Zinnia zinnia)
  popMatrix();
  
  // Initialize Marigold objects
  ellipseMode(RADIUS);
  noFill();
  obj1 = new Marigold(int(width/4), int(3*height/5), innerArcRadius, numberSides, widthOfSpikes, color(120, 50, 50), color(120, 40, 40), color(100, 30, 30), color(80, 20, 20), color(60, 15, 15));
  obj2 = new Marigold(int(3*width/4), int(3* height/5), innerArcRadius, numberSides, widthOfSpikes, color(120, 50, 50), color(120, 40, 40), color(100, 30, 30), color(80, 20, 20), color(60, 15, 15));
  
  // Initialize bird objects with a random location on the sketch
  for (int i = 0; i < birds.length; i++ ) {
    birds[i] = new Bird(random(width), random(height/3)+15, random(1, 6));
  }
}


void draw() {
  background(#e09432);

  noStroke();

  // create tree structure
  createTree();

  time += 0.016667; // increment time (assumed 60 frames/sec)

  // Create the Marigold structure
  obj1.drawMarigold(startFrontAngle, startBackAngle);
  obj2.drawMarigold(startFrontAngle, startBackAngle);
  
  // Create the Zinnia structure
  zinniaKinetic.rotation(time);

  // adjust the startFrontAngle so that the front side has a movement effect
  startFrontAngle +=frontRotationSpeed;
  if (startFrontAngle > TWO_PI)
    startFrontAngle -= TWO_PI;

  // adjust the startBackAngle so that the front side has a movement effect
  startBackAngle +=backRotationSpeed;
  if (startBackAngle > TWO_PI)
    startBackAngle -= TWO_PI;

  // Create Bird structures
  for (int i = 0; i < birds.length; i++ ) {
    birds[i].drive(random(height/3)+15);
  }

  // Add label to the sketch
  textSize(30);
  fill(50);
  text("Assignment 7: Kinetic Sculpture using OOP", int(width/8), 40);
  //popMatrix();
}