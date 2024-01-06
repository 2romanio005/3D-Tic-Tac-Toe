
void play() {
  size = int(sizeSlider.getValue());
  input = new byte[size][size][size];
  vinNamber = int(vinNamberSlider.getValue());
  namberPlayers = byte(namberPlayersSlider.getValue());
  speed = speedSlider.getValue();

  cp5.get(Button.class, "play").hide();

  reset();

  playActive = true;
}

void drawExit() {
  textSize(26);
  if (playActive) {
    fill(0);
  } else {
    fill(255);
  }
  text("Для выхода нажмите \"ESC\"", 185, 40);
  noFill();
  textSize(35);
}

void outPlayers() {
  fill(0);
  text("Очередь ходов:", displayWidth - 175, 40);
  textSize(26);
  for (byte i = 0; i < namberPlayers; ++i) {
    switch((move - 1 + i) % namberPlayers) {
    case 0:
      fill(0, 255, 0);
      text("Игрок №1", displayWidth - 100, 90 + 35 * i);
      break;
    case 1:
      fill(255, 0, 0);
      text("Игрок №2", displayWidth - 100, 90 + 35 * i);
      break;
    case 2:
      fill(0, 0, 255);
      text("Игрок №3", displayWidth - 100, 90 + 35 * i);
      break;
    case 3:
      fill(255, 127, 255);
      text("Игрок №4", displayWidth - 100, 90 + 35 * i);
      break;
    }
  }
  textSize(35);
  noFill();
}







class MySlider {
  public MySlider(String name, float value, float min, float max, float step) {
    this.name = name;
    float tmp = value % step;
    this.value = tmp >= step / 2 ? value + tmp : value - tmp;
    this.step = step;
    this.min = min;
    this.max = max;
  }

  public void setSize(int startX, int startY, int sizeX, int sizeY) {
    this.startX = startX;
    this.startY = startY;
    this.sizeX = sizeX;
    this.sizeY = sizeY;

    pixel_step = float(sizeX) / (round((max - min) / step));
    nowX = (value - min) * pixel_step / step;
  }

  public boolean tick() {
    MyRect(startX, startY, startX + round(nowX), startY + sizeY, activeColor);
    MyRect(startX + round(nowX), startY, startX + sizeX, startY + sizeY, passiveColor);

    MyRect(startX, startY, startX + sizeX, startY, passiveColor);
    MyRect(startX, startY + sizeY, startX + sizeX, startY + sizeY, passiveColor);
    MyRect(startX, startY, startX, startY + sizeY, passiveColor);
    MyRect(startX + sizeX, startY, startX + sizeX, startY + sizeY, passiveColor);

    int tmpY = startY + sizeY - 5;
    if (drawSeparator) {
      for (int i = 0; i < round((max - min) / step) + 1; ++i) {
        int tmpX = round(startX + pixel_step * i);
        for (byte j = 0; j < 5; ++j) {
          set(tmpX, tmpY + j, color(255));
        }
      }
    }

    fill(255);
    textAlign(LEFT, CENTER);
    textSize(sizeY / 2);
    if (int(value) == value) {
      int tmp = int(value);
      text(tmp, startX + sizeY / 3, startY + sizeY / 2);
    } else {
      text(value, startX + sizeY / 6, startY + sizeY / 2);
    }
    textAlign(CENTER, CENTER);
    textSize(sizeY / 1.25);
    //text(name, startX + sizeX / 2, startY - textWidth(name) / 2);
    text(name, startX + sizeX / 2, startY - sizeY / 1.5);
    textAlign(CENTER);
    noFill();

    if (mousePressed) {
      if (activeMove == 0) {
        if (mouseX >= startX && mouseX <= startX + sizeX && mouseY >= startY && mouseY <= startY + sizeY) {
          activeMove = 1;
        } else {
          activeMove = 2;
        }
      }

      if (activeMove == 1 && mouseX != startX + int(nowX)) {
        nowX = constrain(mouseX - startX, 0, sizeX);
        float tmp = nowX % pixel_step;
        //println(tmp);
        if (tmp >= pixel_step / 2) {
          nowX += pixel_step - tmp;
        } else {
          nowX -= tmp;
        }

        float tmpValue = nowX / pixel_step * step + min;
        if (tmpValue != value) {
          value = tmpValue;
          return true;
        }
      }
    } else {
      activeMove = 0;
    } 
    return false;
  }

  public float getValue() {
    return this.value;
  }

  public void drawSeparator(boolean drawSeparator) {
    this.drawSeparator = drawSeparator;
  }
  public void setMax(float max) {
    this.max = max;
    pixel_step = float(sizeX) / (round((max - min) / step));
    value = constrain(value, min, max);
    nowX = (value - min) * pixel_step / step;
  }

  private void MyRect(int x, int y, int finX, int finY, color col) {
    for (int i = x; i < finX + 1; ++i) {
      for (int j = y; j < finY + 1; ++j) {
        set(i, j, col);
      }
    }
  }

  private int startX, startY, sizeX, sizeY;
  private float nowX;
  private float step;
  private float min, max, value;
  private String name;

  private color activeColor = color(66, 136, 232);
  //private color passiveColor = color(160, 184, 216);
  private color passiveColor = color(10, 30, 100);
  //private color strokeColor = color(10, 30, 100);
  //private color strokeColor = color(0);


  private boolean drawSeparator = true;

  private float pixel_step;
  private byte activeMove = 0;
}
