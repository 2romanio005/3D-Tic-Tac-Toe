
void controlOutPlay() {
  cursor();

  rotateX(radians(rotX));
  rotateZ(radians(rotY));

  //stroke(255, 0, 0);
  //box(3000, 0, 0);
  //stroke(0, 255, 0);
  //box(0, 3000, 0);
  //stroke(0, 0, 255);
  //box(0, 0, 3000);

  stroke(255, 0, 0, 125); 
  {
    int tmpSize = (top == topBefore ? activeSize : size);
    switch(top) {
    case 1:
      translate(0, 0, (size - tmpSize) * -sizeStep + sizeStep * (size - 1) / 2);
      box(sizeStep * size + 2, sizeStep * size + 2, sizeStep + 2);
      box(sizeStep * size + 1, sizeStep * size + 1, sizeStep + 1);
      box(sizeStep * size, sizeStep * size, sizeStep);
      translate(0, 0, (size - tmpSize) * sizeStep + sizeStep * (size - 1) / -2);
      break;
    case 2:
      translate(0, 0, (size - tmpSize) * sizeStep + sizeStep * (size - 1) / -2);
      box(sizeStep * size + 2, sizeStep * size + 2, sizeStep + 2);
      box(sizeStep * size + 1, sizeStep * size + 1, sizeStep + 1);
      box(sizeStep * size, sizeStep * size, sizeStep);
      translate(0, 0, (size - tmpSize) * -sizeStep + sizeStep * (size - 1) / 2);
      break;
    case 3:
      translate(0, (size - tmpSize) * sizeStep + sizeStep * (size - 1) / -2, 0);
      box(sizeStep * size + 2, sizeStep + 2, sizeStep * size + 2);
      box(sizeStep * size + 1, sizeStep + 1, sizeStep * size + 1);
      box(sizeStep * size, sizeStep, sizeStep * size);
      translate(0, (size - tmpSize) * -sizeStep + sizeStep * (size - 1) / 2, 0);
      //outTopBox(sizeStep * size, sizeStep, sizeStep * size, 0, (size - tmpSize) * sizeStep + sizeStep * (size - 1) / -2, 0);
      break;
    case 4:
      translate((size - tmpSize) * sizeStep + sizeStep * (size - 1) / -2, 0, 0);
      box(sizeStep + 2, sizeStep * size + 2, sizeStep * size + 2);
      box(sizeStep + 1, sizeStep * size + 1, sizeStep * size + 1);
      box(sizeStep, sizeStep * size, sizeStep * size);
      translate((size - tmpSize) * -sizeStep + sizeStep * (size - 1) / 2, 0, 0);
      break;
    case 5:
      translate(0, (size - tmpSize) * -sizeStep + sizeStep * (size - 1) / 2, 0);
      box(sizeStep * size + 2, sizeStep + 2, sizeStep * size + 2);
      box(sizeStep * size + 1, sizeStep + 1, sizeStep * size + 1);
      box(sizeStep * size, sizeStep, sizeStep * size);
      translate(0, (size - tmpSize) * sizeStep + sizeStep * (size - 1) / -2, 0);
      break;
    case 6:
      translate((size - tmpSize) * -sizeStep + sizeStep * (size - 1) / 2, 0, 0);
      box(sizeStep + 2, sizeStep * size + 2, sizeStep * size + 2);
      box(sizeStep + 1, sizeStep * size + 1, sizeStep * size + 1);
      box(sizeStep, sizeStep * size, sizeStep * size);
      translate((size - tmpSize) * sizeStep + sizeStep * (size - 1) / -2, 0, 0);
      break;
    }
  }

  stroke(0, 20);
  translate(sizeStep * (size - 1) / -2, sizeStep * (size - 1) / -2, sizeStep * (size - 1) / -2);
  {
    int minI = 0, minJ = 0, minH = 0, maxI = size, maxJ = size, maxH = size;
    switch(topBefore) {
    case 1:
      maxI = activeSize;
      break;
    case 2:
      minI = size - activeSize;
      break;
    case 3:
      minJ = size - activeSize;
      break;
    case 4:
      minH = size - activeSize;
      break;
    case 5:
      maxJ = activeSize;
      break;
    case 6:
      maxH = activeSize;
      break;
    }

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
            if (flag_no_draw == false && input[i][j][h] != 5) {
              box(sizeStep, sizeStep, sizeStep);
            }
            outToken(input[i][j][h]);
          }
          translate(sizeStep, 0, 0);
        }
        translate(-sizeStep * maxH, sizeStep, 0);
      }
      translate(0, -sizeStep * maxJ, sizeStep);
    }
  }
}








boolean outToken(byte type) {
  if (type == 0) {
    return false;
  }

  switch(type) {
  case 1:
    stroke(0, 255, 0);
    break;
  case 2:
    stroke(255, 0, 0);
    break;
  case 3:
    stroke(0, 0, 255);
    break;
  case 4:
    stroke(255, 127, 255);
    break;
  case 5:
    stroke(0, 255, 0, 25);
    break;
  case 6:
    stroke(255, 0, 0, 25);
    break;
  case 7:
    stroke(0, 0, 255, 25);
    break;
  case 8:
    stroke(255, 127, 255, 30);
    break;
  }


  sphere(sizeStep / 4.0);
  stroke(0, 20);
  return true;
}
