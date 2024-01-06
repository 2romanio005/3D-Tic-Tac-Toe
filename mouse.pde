
void mouseWheel(MouseEvent event) {
  if (topBefore != top) {
    activeSize = size;
    topBefore = top;
    return;
  }
  int e = event.getCount();
  if (e < 0) {
    if (keyCode == SHIFT) {
      sizeStep += 5;
    } else {
      if (activeSize != size) {
        ++activeSize;
      }
    }
  } else {
    if (keyCode == SHIFT) {
      sizeStep -= 5;
      if (sizeStep < 3) {
        sizeStep = 3;
      }
    } else {
      if (activeSize != 1) {
        --activeSize;
      }
    }
  }
}




void mouseClicked() {
  if (activeInput == false) {
    ++namberClick;
    counterClick = millis() + 500;
  }
  //MySliderClick = true;
}

void controlMouse() {
  if (millis() > counterClick) {
    namberClick = 0;
  }

  if (mousePressed) {
    if (activeInput) {
      int tmp = round(rotX + (pmouseY - mouseY) * speed);
      rotX = tmp < 0 ? 360 + tmp : tmp % 360;
      tmp = round(rotY - (pmouseX - mouseX) * speed);
      rotY = tmp < 0 ? 360 + tmp : tmp % 360;

      searchActive();
    }
  }
}



void searchActive() {
  if (rotX > 315 || rotX <= 45) {
    top = 1;
  } else if (rotX > 135 && rotX <= 225) {
    top = 2;
  } else 
  if ((rotX > 225 && rotX <= 315)) {
    if (rotY > 315 || rotY <= 45) {
      top = 3;
    } else if (rotY > 45 && rotY <= 135) {
      top = 4;
    } else if (rotY > 135 && rotY <= 225) {
      top = 5;
    } else {
      top = 6;
    }
  } else {
    if (rotY > 315 || rotY <= 45) {
      top = 5;
    } else if (rotY > 45 && rotY <= 135) {
      top = 6;
    } else if (rotY > 135 && rotY <= 225) {
      top = 3;
    } else {
      top = 4;
    }
  }
  if (activeSize == size) {
    topBefore = top;
  }
}
