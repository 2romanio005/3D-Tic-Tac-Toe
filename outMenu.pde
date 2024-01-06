
void play() {
  input = new byte[Size_map][Size_map][Size_map];
  size = Size_map;

  sliderSize.hide();
  cp5.get(Slider.class, "Win_namber").hide();
  cp5.get(Slider.class, "Namber_players").hide();
  cp5.get(Slider.class, "Sensibility").hide();

  cp5.get(Button.class, "play").hide();


  reset();

  playActive = true;
}
void Win_namber(int val) {
  vinNamber = val;
}
void Namber_players(int val) {
  namberPlayers = byte(val);
}
void Sensibility(float val) {
  speed = val;
}








class MySlider {
  public MySlider(String name, int startX, int startY, int sizeX, int sizeY, float value, float min, float max, float step) {
    this.name = name;
    this.startX = startX;
    this.startY = startY;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    float tmp = value % step;
    this.value = tmp >= step / 2 ? value + tmp : value - tmp;
    this.step = step;
    this.min = min;
    this.max = max;

    pixel_step = float(sizeX) / (round((max - min) / step));
    nowX = (value - min) * pixel_step / step;
  }

  public boolean tick() {
    stroke(strokeColor);
    fill(activeColor);
    rect(startX, startY, nowX, sizeY);
    fill(passiveColor);
    rect(startX + nowX, startY, sizeX - nowX, sizeY);

    fill(255);
    textAlign(LEFT, CENTER);
    textSize(sizeY / 2);
    if (int(value) == value) {
      int tmp = int(value);
      text(tmp, startX + pixel_step / 3, startY + sizeY / 2);
    } else {
      text(value, startX + pixel_step / 3, startY + sizeY / 2);
    }
    textAlign(CENTER, CENTER);
    textSize(sizeY / 1.5);
    text(name, startX + sizeX / 2, startY - textWidth(name) / 2);

    int tmpY = startY + sizeY - 5;
    //println(tmpY);
    if (drawSeparator) {
      for (int i = 0; i < round((max - min) / step) + 1; ++i) {
        int tmpX = round(startX + pixel_step * i);
        for (byte j = 0; j < 5; ++j) {
          set(tmpX, tmpY + j, color(255));
        }
      }
    }
    textAlign(CENTER);
    noStroke();
    noFill();

    if (mousePressed) {
      if (activeMove != 2 && mouseX != startX + int(nowX) && mouseX >= startX && mouseX <= startX + sizeX && mouseY >= startY && mouseY <= startY + sizeY) {
        activeMove = 1;
      } else if (activeMove != 1) {
        activeMove = 2;
      }

      if (activeMove == 1) {
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

  float getValue(){
    return this.value;
  }

  void drawSeparator(boolean drawSeparator) {
    this.drawSeparator = drawSeparator;
  }
  void setMax(float max) {
    this.max = max;
    pixel_step = float(sizeX) / (round((max - min) / step));
    value = constrain(value, min, max);
    nowX = (value - min) * pixel_step / step;
  }


  private int startX, startY, sizeX, sizeY;
  private float nowX;
  private float step;
  private float min, max, value;
  private String name;

  private color activeColor = color(66, 136, 232);
  private color passiveColor = color(160, 184, 216);
  private color strokeColor = color(31, 78, 142);

  private boolean drawSeparator = true;

  private float pixel_step;
  private byte activeMove = 0;
}
