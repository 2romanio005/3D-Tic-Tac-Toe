void contropOutGO() {
  noFill();
  cursor();
  
  int tmp_rotX = 0, tmp_rotY = 0;
  int minI = 0, minJ = 0, minH = 0, maxI = size, maxJ = size, maxH = size;
  byte tmp_top = activeSize != size ? topBefore : top;
  switch(tmp_top) {
  case 1:
    maxI = activeSize;
    minI = maxI - 1;
    tmp_rotX = 0;
    switch(rotY / 45) {
    case 1: 
    case 2:
      tmp_rotY = 90;
      break;
    case 3: 
    case 4:
      tmp_rotY = 180;
      break;
    case 5: 
    case 6:
      tmp_rotY = 270;
      break;
    }
    break;
  case 2:
    minI = size - activeSize;
    maxI = minI + 1;
    tmp_rotX = 180;
    switch(rotY / 45) {
    case 1: 
    case 2:
      tmp_rotY = 90;
      break;
    case 3: 
    case 4:
      tmp_rotY = 180;
      break;
    case 5: 
    case 6:
      tmp_rotY = 270;
      break;
    }
    break;
  case 3:
    minJ = size - activeSize;
    maxJ = minJ + 1;
    if (rotX > 180) {
      tmp_rotX = 270;
      tmp_rotY = 0;
    } else {
      tmp_rotX = 90;
      tmp_rotY = 180;
    }
    break;
  case 4:
    minH = size - activeSize;
    maxH = minH + 1;
    if (rotX > 180) {
      tmp_rotX = 270;
      tmp_rotY = 90;
    } else {
      tmp_rotX = 90;
      tmp_rotY = 270;
    }
    break;
  case 5:
    maxJ = activeSize;
    minJ = maxJ -1;
    if (rotX > 180) {
      tmp_rotX = 270;
      tmp_rotY = 180;
    } else {
      tmp_rotX = 90;
      tmp_rotY = 0;
    }
    break;
  case 6:
    maxH = activeSize;
    minH = maxH - 1;
    if (rotX > 180) {
      tmp_rotX = 270;
      tmp_rotY = 270;
    } else {
      tmp_rotX = 90;
      tmp_rotY = 90;
    }
    break;
  }
  translate(0, 0, sizeStep * (size - activeSize));

  rotateX(radians(tmp_rotX));
  rotateZ(radians(tmp_rotY));
  //rotateZ(radians(rotZ));

  //byte tmp = 0;
  translate(sizeStep * (size - 1) / -2, sizeStep * (size - 1) / -2, sizeStep * (size - 1) / -2);
  for (int i = 0; i < maxI; ++i) {
    if (i < minI) {
      translate(0, 0, sizeStep);
      continue;
    }
    for (int j = 0; j < maxJ; ++j) {
      if (j < minJ) {
        translate(0, sizeStep, 0);
        continue;
      }
      for (int h = 0; h < maxH; ++h) {
        if (!(h < minH)) {
          box(sizeStep, sizeStep, sizeStep);
          //outToken(tmp++);
          //if (tmp == 5) tmp = 1;

          if (outToken(input[i][j][h]) == false) {
            int tmp_X_min = 0, tmp_X_max = 0, tmp_Y_min = 0, tmp_Y_max = 0;
            int X_tmp = 0, Y_tmp = 0, tmp_stepSize = (sizeStep + round(sizeStep * errore_cord_share));
            switch(tmp_top) {
            case 1:
              switch(rotY / 45) {
              case 1: 
              case 2:
                X_tmp = (displayWidth + tmp_stepSize * size) / 2;       // 90
                Y_tmp = (displayHeight - tmp_stepSize * size) / 2;
                tmp_X_min = X_tmp - tmp_stepSize * (j + 1);
                tmp_X_max = X_tmp - tmp_stepSize * j;
                tmp_Y_min = Y_tmp + tmp_stepSize * h;
                tmp_Y_max = Y_tmp + tmp_stepSize * (h + 1);
                break;
              case 3: 
              case 4:
                X_tmp = (displayWidth + tmp_stepSize * size) / 2;       // 180
                Y_tmp = (displayHeight + tmp_stepSize * size) / 2;
                tmp_X_min = X_tmp - tmp_stepSize * (h + 1);
                tmp_X_max = X_tmp - tmp_stepSize * h;
                tmp_Y_min = Y_tmp - tmp_stepSize * (j + 1);
                tmp_Y_max = Y_tmp - tmp_stepSize * j;
                break;
              case 5: 
              case 6:
                X_tmp = (displayWidth - tmp_stepSize * size) / 2;       // 270
                Y_tmp = (displayHeight + tmp_stepSize * size) / 2;
                tmp_X_min = X_tmp + tmp_stepSize * j;
                tmp_X_max = X_tmp + tmp_stepSize * (j + 1);
                tmp_Y_min = Y_tmp - tmp_stepSize * (h + 1);
                tmp_Y_max = Y_tmp - tmp_stepSize * h;
                break;
              default:
                X_tmp = (displayWidth - tmp_stepSize * size) / 2;       // 0
                Y_tmp = (displayHeight - tmp_stepSize * size) / 2;
                tmp_X_min = X_tmp + tmp_stepSize * h;
                tmp_X_max = X_tmp + tmp_stepSize * (h + 1);
                tmp_Y_min = Y_tmp + tmp_stepSize * j;
                tmp_Y_max = Y_tmp + tmp_stepSize * (j + 1);
                break;
              }
              break;
            case 2:
              switch(rotY / 45) {
              case 1: 
              case 2:
                X_tmp = (displayWidth + tmp_stepSize * size) / 2;        // 90
                Y_tmp = (displayHeight + tmp_stepSize * size) / 2; 
                tmp_X_min = X_tmp - tmp_stepSize * (j + 1);
                tmp_X_max = X_tmp - tmp_stepSize * j;
                tmp_Y_min = Y_tmp - tmp_stepSize * (h + 1);
                tmp_Y_max = Y_tmp - tmp_stepSize * h;
                break;
              case 3: 
              case 4:
                X_tmp = (displayWidth + tmp_stepSize * size) / 2;        // 180
                Y_tmp = (displayHeight - tmp_stepSize * size) / 2; 
                tmp_X_min = X_tmp - tmp_stepSize * (h + 1);
                tmp_X_max = X_tmp - tmp_stepSize * h;
                tmp_Y_min = Y_tmp + tmp_stepSize * j;
                tmp_Y_max = Y_tmp + tmp_stepSize * (j + 1);
                break;
              case 5: 
              case 6:
                X_tmp = (displayWidth - tmp_stepSize * size) / 2;        // 270
                Y_tmp = (displayHeight - tmp_stepSize * size) / 2; 
                tmp_X_min = X_tmp + tmp_stepSize * j;
                tmp_X_max = X_tmp + tmp_stepSize * (j + 1);
                tmp_Y_min = Y_tmp + tmp_stepSize * h;
                tmp_Y_max = Y_tmp + tmp_stepSize * (h + 1);
                break;
              default:
                X_tmp = (displayWidth - tmp_stepSize * size) / 2;        // 0
                Y_tmp = (displayHeight + tmp_stepSize * size) / 2; 
                tmp_X_min = X_tmp + tmp_stepSize * h;
                tmp_X_max = X_tmp + tmp_stepSize * (h + 1);
                tmp_Y_min = Y_tmp - tmp_stepSize * (j + 1);
                tmp_Y_max = Y_tmp - tmp_stepSize * j;
                break;
              }
              break;
            case 3:
              if (rotX > 180) {
                X_tmp = (displayWidth - tmp_stepSize * size) / 2;
                Y_tmp = (displayHeight - tmp_stepSize * size) / 2;
                tmp_X_min = X_tmp + tmp_stepSize * h;
                tmp_X_max = X_tmp + tmp_stepSize * (h + 1);
                tmp_Y_min = Y_tmp + tmp_stepSize * i;
                tmp_Y_max = Y_tmp + tmp_stepSize * (i + 1);
              } else {
                X_tmp = (displayWidth + tmp_stepSize * size) / 2;
                Y_tmp = (displayHeight + tmp_stepSize * size) / 2;
                tmp_X_min = X_tmp - tmp_stepSize * (h + 1);
                tmp_X_max = X_tmp - tmp_stepSize * h;
                tmp_Y_min = Y_tmp - tmp_stepSize * (i + 1);
                tmp_Y_max = Y_tmp - tmp_stepSize * i;
              }
              break;
            case 4:
              if (rotX > 180) {
                X_tmp = (displayWidth + tmp_stepSize * size) / 2;
                Y_tmp = (displayHeight - tmp_stepSize * size) / 2;
                tmp_X_min = X_tmp - tmp_stepSize * (j + 1);
                tmp_X_max = X_tmp - tmp_stepSize * j;
                tmp_Y_min = Y_tmp + tmp_stepSize * i;
                tmp_Y_max = Y_tmp + tmp_stepSize * (i + 1);
              } else {
                X_tmp = (displayWidth - tmp_stepSize * size) / 2;
                Y_tmp = (displayHeight + tmp_stepSize * size) / 2;
                tmp_X_min = X_tmp + tmp_stepSize * j;
                tmp_X_max = X_tmp + tmp_stepSize * (j + 1);
                tmp_Y_min = Y_tmp - tmp_stepSize * (i + 1);
                tmp_Y_max = Y_tmp - tmp_stepSize * i;
              }
              break;
            case 5:
              if (rotX > 180) {
                X_tmp = (displayWidth + tmp_stepSize * size) / 2;
                Y_tmp = (displayHeight - tmp_stepSize * size) / 2;
                tmp_X_min = X_tmp - tmp_stepSize * (h + 1);
                tmp_X_max = X_tmp - tmp_stepSize * h;
                tmp_Y_min = Y_tmp + tmp_stepSize * i;
                tmp_Y_max = Y_tmp + tmp_stepSize * (i + 1);
              } else {
                X_tmp = (displayWidth - tmp_stepSize * size) / 2;
                Y_tmp = (displayHeight + tmp_stepSize * size) / 2;
                tmp_X_min = X_tmp + tmp_stepSize * h;
                tmp_X_max = X_tmp + tmp_stepSize * (h + 1);
                tmp_Y_min = Y_tmp - tmp_stepSize * (i + 1);
                tmp_Y_max = Y_tmp - tmp_stepSize * i;
              }
              break;
            case 6:
              if (rotX > 180) {
                X_tmp = (displayWidth - tmp_stepSize * size) / 2;
                Y_tmp = (displayHeight - tmp_stepSize * size) / 2;
                tmp_X_min = X_tmp + tmp_stepSize * j;
                tmp_X_max = X_tmp + tmp_stepSize * (j + 1);
                tmp_Y_min = Y_tmp + tmp_stepSize * i;
                tmp_Y_max = Y_tmp + tmp_stepSize * (i + 1);
              } else {
                X_tmp = (displayWidth + tmp_stepSize * size) / 2;
                Y_tmp = (displayHeight + tmp_stepSize * size) / 2;
                tmp_X_min = X_tmp - tmp_stepSize * (j + 1);
                tmp_X_max = X_tmp - tmp_stepSize * j;
                tmp_Y_min = Y_tmp - tmp_stepSize * (i + 1);
                tmp_Y_max = Y_tmp - tmp_stepSize * i;
              }
              break;
            }

            if (mouseX > tmp_X_min && mouseX < tmp_X_max && mouseY > tmp_Y_min && mouseY < tmp_Y_max) {
              if (namberClick >= 2) {
                byte search = move;
                //int vinCounter = 1;
                activeSize = size;
                input[i][j][h] = search;
                namberClick = 0;
                if(++move > namberPlayers) move = 1;
                activeInput = true;

                if (search_vin(i, j, h, 0, 0, 1, search) >= vinNamber) vin = true;    // 1
                if (search_vin(i, j, h, 0, 1, 0, search) >= vinNamber) vin = true;    // 2
                if (search_vin(i, j, h, 0, 1, 1, search) >= vinNamber) vin = true;    // 3
                if (search_vin(i, j, h, 0, -1, 1, search) >= vinNamber) vin = true;   // 4
                if (search_vin(i, j, h, 1, 0, 0, search) >= vinNamber) vin = true;    // 5
                if (search_vin(i, j, h, 1, 0, 1, search) >= vinNamber) vin = true;    // 6
                if (search_vin(i, j, h, -1, 0, 1, search) >= vinNamber) vin = true;   // 7
                if (search_vin(i, j, h, 1, 1, 0, search) >= vinNamber) vin = true;    // 8
                if (search_vin(i, j, h, -1, 1, 0, search) >= vinNamber) vin = true;   // 9
                if (search_vin(i, j, h, 1, 1, 1, search) >= vinNamber) vin = true;    // 10
                if (search_vin(i, j, h, -1, 1, 1, search) >= vinNamber) vin = true;   // 11
                if (search_vin(i, j, h, -1, -1, 1, search) >= vinNamber) vin = true;  // 12
                if (search_vin(i, j, h, 1, -1, -1, search) >= vinNamber) vin = true;  // 13
              } else {
                outToken(byte(move + 4));
              }
            }
          }
        }
        translate(sizeStep, 0, 0);
      }
      translate(-sizeStep * maxH, sizeStep, 0);
    }
    translate(0, -sizeStep * maxJ, sizeStep);
  }
}



int search_vin(int i, int j, int h, int stepI, int stepJ, int stepH, byte search) {
  int vinCounter = 1;
  int tmp = size - 1;
  for (byte f = 0; f < 2; ++f) {
    int tmp_i = i, tmp_j = j, tmp_h = h;
    while ((stepI == 0 || (stepI > 0 ? tmp_i != tmp : tmp_i != 0))   &&   (stepJ == 0 || (stepJ > 0 ? tmp_j != tmp : tmp_j != 0))   &&   (stepH == 0 || (stepH > 0 ? tmp_h != tmp : tmp_h != 0)) ) { 
      tmp_i += stepI;
      tmp_j += stepJ;
      tmp_h += stepH;
      if (input[tmp_i][tmp_j][tmp_h] == search) {
        ++vinCounter;
      } else {
        break;
      }
    }
    stepI *= -1;
    stepJ *= -1;
    stepH *= -1;
  }
  return vinCounter;
}
