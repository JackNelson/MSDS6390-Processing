// call draw only when mouse is moved
void mouseMoved() {
  redraw();
}

// get the coordinates when the mouse was pressed
void mousePressed() {
  clickedX = mouseX;
  clickedY = mouseY;
  previousX = mouseX;
  previousY = mouseY;
  int countWhite = 0;

  for (int i= -5; i<=5; i++) {
    for (int j=-5; j<=5; j++) {
      if (color(255)== get(mouseX+i, mouseY+j))
        countWhite++;
    }
  }
  if (countWhite>=15) {
    clickToRotate = true;
    dragStarted = true;
  } else {
    clickToRotate = false;
    dragStarted = false;
  }
}

// mouse Dragged then rotate
void mouseDragged() {
  if (clickToRotate) {
    pushMatrix();
    translate(283, 283);
    float dx = mouseX - previousX;
    float dy = mouseY - previousY;
    float angle = (-atan2(mouseX, mouseY) + atan2(previousY, previousX));
    if (angle<0)
      angle = PI - (angle);
    //println(atan2(mouseX, mouseY), atan2(previousY, previousX), angle);
    if (dragStarted) {
      rotationAngle = previousRotationAngle + angle;
      dragStarted = false;
    } else
      rotationAngle += angle;

    previousX = mouseX;
    previousY = mouseY;
    popMatrix();
    redraw();
  } //else
  //println("false");
}

// mouse released
void mouseClicked() {
  if (clickToRotate) {
    float dx = mouseX - clickedX;
    float dy = mouseY - clickedY;
    float angle = (-atan2(mouseX, mouseY) + atan2(clickedY, clickedX));
    if (angle<0)
      angle = PI - (angle);
    //println(atan2(mouseX, mouseY), atan2(previousY, previousX), angle);
    previousRotationAngle += angle;
  }
}