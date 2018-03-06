class Marigold {
  private color centerColor, frontOuterColor, frontInnerColor, backOuterColor, backInnerColor, centerEdge;
  private int centerX;
  private int centerY;
  private float radiusInner;
  private int sides;
  private float strokeWt;

  // No Argument Constructor
  Marigold() {
    centerColor = 0;
    frontOuterColor = 0;
    frontInnerColor = 0;
    backOuterColor = 0;
    backInnerColor = 0;
    centerEdge = 0;
    sides = 10;
    strokeWt = 8;
    radiusInner = 40;
    centerX = width/2;
    centerY = height/2;
  }

  // Overloaded constructor to create default Marigold at specific coordinates
  Marigold(int x, int y) {
    centerColor = 0;
    frontOuterColor = 0;
    frontInnerColor = 0;
    backOuterColor = 0;
    backInnerColor = 0;
    centerEdge = 0;
    sides = 10;
    strokeWt = 8;
    radiusInner = 40;
    centerX = x;
    centerY = y;
  }

  // Overloaded constructor to create custom Marigold 
  Marigold(int centerX, int centerY, float radiusInner, int sides, float strokeWt, color... colors) {
    switch(colors.length) {
    case 1: 
      centerColor = colors[0];
      frontOuterColor = colors[0];
      frontInnerColor = colors[0];
      backOuterColor = colors[0];
      backInnerColor = colors[0];
      break;
    case 2: 
      centerColor = colors[0];
      frontOuterColor = colors[1];
      frontInnerColor = colors[1];
      backOuterColor = colors[1];
      backInnerColor = colors[1];
      break;
    case 3: 
      centerColor = colors[0];
      frontOuterColor = colors[2];
      frontInnerColor = colors[1];
      backOuterColor = colors[2];
      backInnerColor = colors[1];
      break;
    case 4: 
      centerColor = colors[0];
      frontOuterColor = colors[2];
      frontInnerColor = colors[1];
      backOuterColor = colors[3];
      backInnerColor = colors[3];
      break;
    case 5: 
      centerColor = colors[0];
      frontOuterColor = colors[2];
      frontInnerColor = colors[1];
      backOuterColor = colors[4];
      backInnerColor = colors[3];
      break;
    default:
      centerColor = 0;
      frontOuterColor = 0;
      frontInnerColor = 0;
      backOuterColor = 0;
      backInnerColor = 0;
    }
    this.sides = sides;
    this.strokeWt = strokeWt;
    this.radiusInner = radiusInner;
    this.centerX = centerX;
    this.centerY = centerY;
  }

  void drawMarigold(float thetaFront, float thetaBack) {
    noFill();
    strokeWeight(strokeWt);

    // Create in back portion
    createArcs(false, thetaBack);

    // Create the front portion
    createArcs(true, thetaFront);

    // Create the central region of the Kinetic Sculpture
    noStroke();
    centerEdge = color(abs(red(centerColor)-20), abs(green(centerColor)-20), abs(blue(centerColor)-20));
    fill(centerEdge);
    ellipse(centerX, centerY, 0.6*radiusInner, 0.6*radiusInner);
    strokeWeight(radiusInner*0.1);
    stroke(color(abs(red(centerColor)-10), abs(green(centerColor)-10), abs(blue(centerColor)-10)));
    fill(centerColor);
    ellipse(centerX, centerY, 0.6 * radiusInner * 0.8, 0.6 * radiusInner * 0.8);
  }

  private void createArcs(boolean isFront, float theta) {
    noFill();
    // rotAmount is the distance between 2 middle circular spikes
    float rotAmount = TWO_PI/sides;
    float x=centerX, y=centerY;
    // x2, y2 is the center of the circles used for creating the middle circular spikes
    // (x3, y3) is the coordinate of the point on the middle circular spike thats connected with the outer arcs along the circumference
    // (x4, y4) and (x5, y5) are the coordinates on the outer circumference that connected with the middle circular spike
    // (x6, y6) and (x7,y7) will be used to have the extra filled material around the portion connecting the middle circular spikes with the outer circular spikes
    float x2=0, y2=0, x3=0, y3=0, x4=0, y4=0, x5=0, y5=0, x6=0, y6=0, x7=0, y7=0;
    // interval is the angular width of the outer arc
    float interval = TWO_PI / 20;
    float radiusOuterArc_1 =  radiusInner/2.25;
    float radiusOuterArc_2 = radiusInner/2.5;
    noFill();
    for (int i=0; i<sides; i++) 
    {

      // Create the acrs along the outer circumference
      if (isFront) {
        stroke(frontOuterColor);
        arc(x, y, 4*radiusInner, 4*radiusInner, theta + 3* interval, theta + 4* interval);
        x4 = x + cos(theta + 3 * interval)* (4*radiusInner);
        y4 = y + sin(theta + 3 * interval)* (4*radiusInner);
        x5 = x + cos(theta + 4 * interval)* (4*radiusInner);
        y5 = y + sin(theta + 4 * interval)* (4*radiusInner);
      } else {
        stroke(backOuterColor);
        arc(x, y, 4*radiusInner, 4*radiusInner, (theta - 3 * interval), ( theta -2 * interval));
        x4 = x + cos((theta - 3 * interval))* (4*radiusInner);
        y4 = y + sin((theta - 3 * interval))* (4*radiusInner);
        x5 = x + cos((theta - 2 * interval))* (4*radiusInner);
        y5 = y + sin((theta - 2 * interval))* (4*radiusInner);
      }

      x2 = x + cos(theta)*radiusInner;
      y2 = y + sin(theta)*radiusInner;



      // Create the middle portion of the kinetic sculpture - circular spikes around the center
      if (isFront) {
        stroke(frontInnerColor);
        arc(x2, y2, radiusInner, radiusInner, theta + 0.125 * PI, theta + PI );
        x3 = x2 + cos(theta + 0.125 * PI)* (radiusInner);
        y3 = y2 + sin(theta + 0.125 * PI)* (radiusInner);
        stroke(frontOuterColor);
      } else {
        stroke(backInnerColor);
        arc(x2, y2, radiusInner, radiusInner, theta + PI, theta + 1.875 * PI );
        x3 = x2 + cos(theta + 1.875 * PI )* (radiusInner);
        y3 = y2 + sin(theta + 1.875 * PI )* (radiusInner);
        stroke(backOuterColor);
      }

      // Create the two arcs joining the middle portion to the arcs created along the circumference
      // Arc 1

      beginShape();
      curveVertex(x3, y3);
      curveVertex(x3, y3);
      if (isFront)
        curveVertex((x3+x4)/2+radiusOuterArc_1*cos(theta), (y3+y4)/2 +radiusOuterArc_1*sin(theta));
      else
        curveVertex((x3+x4)/2-radiusOuterArc_1*cos(theta), (y3+y4)/2 -radiusOuterArc_1*sin(theta));
      curveVertex(x4, y4);
      curveVertex(x4, y4);
      endShape();
      //Arc 2
      beginShape();
      curveVertex(x3, y3);
      curveVertex(x3, y3);
      if (isFront)
        curveVertex((x3+x5)/2+radiusOuterArc_2*cos(theta), (y3+y5)/2 +radiusOuterArc_2*sin(theta));
      else
        curveVertex((x3+x5)/2-radiusOuterArc_2*cos(theta), (y3+y5)/2 -radiusOuterArc_2*sin(theta));
      curveVertex(x5, y5);
      curveVertex(x5, y5);
      endShape();

      // Create the additional material filling around the portion joining the middle and outer region
      if (isFront) {
        x6 = (x3+ (x3+x4)/2+radiusOuterArc_1*cos(theta))/2;
        y6 = (y3+ (y3+y4)/2 +radiusOuterArc_1*sin(theta))/2;
        x7 =  (x3+x5)/2+radiusOuterArc_1*cos(theta);
        y7 =  (y3+y5)/2 +radiusOuterArc_1*sin(theta);
        fill(frontOuterColor);
        stroke(frontOuterColor);
      } else {
        x6 = (x3+ (x3+x4)/2 -radiusOuterArc_1*cos(theta))/2;
        y6 = (y3+ (y3+y4)/2 -radiusOuterArc_1*sin(theta))/2;
        x7 =  (x3+x5)/2 - radiusOuterArc_1*cos(theta);
        y7 =  (y3+y5)/2 - radiusOuterArc_1*sin(theta);
        fill(backOuterColor);
        stroke(backOuterColor);
      }
      strokeCap(ROUND);
      noStroke();

      triangle(x3, y3, x6, y6, x7, y7);

      line(x3, y3, x6, y6);
      theta += rotAmount;
      noFill();
    }
  }
}