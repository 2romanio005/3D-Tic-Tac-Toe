
void keyPressed() {  
  if (activeInput) {
    switch(key) {
    case ' ':
      if (vin == false) {
        activeInput = false;
        flag_no_draw = false;
        //println("spase");
      }
      break;
    case BACKSPACE:
      flag_no_draw = !flag_no_draw;
      break;
    case TAB:
      //reset();

      sliderSize.show();
      cp5.get(Slider.class, "Win_namber").show();
      cp5.get(Slider.class, "Namber_players").show();
      cp5.get(Slider.class, "Sensibility").show();

      cp5.get(Button.class, "play").show();

      playActive = false;
      break;
    case ENTER:
      play();
      break;
    case CODED:
      if (keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT) {
        if (rotX % 90 == 0 && rotY % 90 == 0) {
          switch(keyCode) {
          case UP:
            rotX -= 90;
            if (rotX < 0) rotX += 360;
            break;
          case DOWN:
            rotX += 90;
            rotX %= 360;
            break;
          case LEFT:
            if (rotX > 180) {
              rotY += 90;
              rotY %= 360;
            } else {
              rotY -= 90;
              if (rotY < 0) rotY += 360;
            }
            break;
          case RIGHT:
            if (rotX > 180) {
              rotY -= 90;
              if (rotY < 0) rotY += 360;
            } else {
              rotY += 90;
              rotY %= 360;
            }
            break;
          }
        } else {
          switch(top) {
          case 1:
            rotX = 0;
            switch(rotY / 45) {
            case 1: 
            case 2:
              rotY = 90;
              break;
            case 3: 
            case 4:
              rotY = 180;
              break;
            case 5: 
            case 6:
              rotY = 270;
              break;
            }
            break;
          case 2:
            rotX = 180;
            switch(rotY / 45) {
            case 1: 
            case 2:
              rotY = 90;
              break;
            case 3: 
            case 4:
              rotY = 180;
              break;
            case 5: 
            case 6:
              rotY = 270;
              break;
            }
            break;
          case 3:
            if (rotX > 180) {
              rotX = 270;
              rotY = 0;
            } else {
              rotX = 90;
              rotY = 180;
            }
            break;
          case 4:
            if (rotX > 180) {
              rotX = 270;
              rotY = 90;
            } else {
              rotX = 90;
              rotY = 270;
            }
            break;
          case 5:
            if (rotX > 180) {
              rotX = 270;
              rotY = 180;
            } else {
              rotX = 90;
              rotY = 0;
            }
            break;
          case 6:
            if (rotX > 180) {
              rotX = 270;
              rotY = 270;
            } else {
              rotX = 90;
              rotY = 90;
            }
            break;
          }
        }
        searchActive();
      }
      break;
    }
  } else {
    activeInput = true;
  }
}


void keyReleased() {
  keyCode = ESC;
  //println("stop");
}
