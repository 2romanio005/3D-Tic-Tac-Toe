 //<>//
void play() {
  size = int(sizeSlider.getValue());
  
  
  if (flag_load == false) {
    input = new byte[size][size][size];
    int tmp = int(voidSlider.getValue());
    for(byte i = 0; i < size; ++i){
      for(byte j = 0; j < size; ++j){
        for(byte h = 0; h < size; ++h){
          if(int(random(100)) < tmp) input[i][j][h] = 5;
        }  
      }  
    }  
  }
  
  vinNamber = int(vinNamberSlider.getValue());
  namberPlayers = byte(namberPlayersSlider.getValue());
  speed = speedSlider.getValue();

  cp5.get(Button.class, "play").hide();
  cp5.get(Button.class, "save").hide();
  cp5.get(Button.class, "load").hide();

  cp5.get(Textfield.class, " ").hide();
  cp5.get(Textfield.class, "  ").hide();

  reset();

  playActive = true;
}

void save() {
  String[] save = new String[2];

  save[0]  = Integer.toString(size) + ';';
  save[0] += Integer.toString(vinNamber) + ';';
  save[0] += Byte.toString(namberPlayers) + ';';
  save[0] += Float.toString(speed) + ';';
  save[0] += Byte.toString(move) + ';';
  if (vin) {
    save[0] += '1';
  }

  save[1] = "";
  for (int i = 0; i < size; ++i) {
    for (int j = 0; j < size; ++j) {
      for (int h = 0; h < size; ++h) {
        save[1] += Byte.toString(input[i][j][h]) + ';';
      }
    }
  }

  boolean tmp_flag = true;
  String way = cp5.get(Textfield.class, " ").getText();
  for (int i = 0; i < way.length(); ++i) {
    if (way.charAt(i) == '\\') {
      tmp_flag = false;
      break;
    }
  }
  if (tmp_flag) {
    saveStrings( "save\\" + way + ".cube", save);
  } else {
    saveStrings(way + ".cube", save);
  }
}

void load() {
  String[] load;

  boolean tmp_flag = true;
  String way = cp5.get(Textfield.class, "  ").getText();
  for (int i = 0; i < way.length(); ++i) {
    if (way.charAt(i) == '\\') {
      tmp_flag = false;
      break;
    }
  }
  if (tmp_flag) {
    load = loadStrings("save\\" + way + ".cube");
  } else {
    load = loadStrings(way + ".cube");
  }

  if (load != null) {
    //println(load[0].charAt(0));
    int iter = 1;

    String loadString = "";
    char laodChar = load[0].charAt(0);
    while (laodChar != ';') {
      loadString += laodChar;
      laodChar = load[0].charAt(iter++);
    }
    size = Integer.parseInt(loadString);
    input = new byte[size][size][size];
    sizeSlider.setValue(float(size));

    loadString = "";
    laodChar = load[0].charAt(iter++);
    while (laodChar != ';') {
      loadString += laodChar;
      laodChar = load[0].charAt(iter++);
    }
    vinNamberSlider.setValue(float(Integer.parseInt(loadString)));

    loadString = "";
    laodChar = load[0].charAt(iter++);
    while (laodChar != ';') {
      loadString += laodChar;
      laodChar = load[0].charAt(iter++);
    }
    namberPlayersSlider.setValue(float(Byte.parseByte(loadString)));

    loadString = "";
    laodChar = load[0].charAt(iter++);
    while (laodChar != ';') {
      loadString += laodChar;
      laodChar = load[0].charAt(iter++);
    }
    speedSlider.setValue(Float.parseFloat(loadString));

    loadString = "";
    laodChar = load[0].charAt(iter++);
    while (laodChar != ';') {
      loadString += laodChar;
      laodChar = load[0].charAt(iter++);
    }    
    move = Byte.parseByte(loadString);

    if (iter != load[0].length()) {
      flag_load_vin = true;
    }


    iter = 0;
    for (int i = 0; i < size; ++i) {
      for (int j = 0; j < size; ++j) {
        for (int h = 0; h < size; ++h) {
          loadString = "";
          laodChar = load[1].charAt(iter++);
          while (laodChar != ';') {
            loadString += laodChar;
            laodChar = load[1].charAt(iter++);
          }
          input[i][j][h] = Byte.parseByte(loadString);
        }
      }
    }

    flag_load = true;
    play();
  }
}





//void controlEvent(ControlEvent theEvent) {
//  if (theEvent.isAssignableFrom(Textfield.class)) {
//    println("controlEvent: accessing a string from controller '"
//      +theEvent.getName()+"': "
//      +theEvent.getStringValue()
//      );
//    //theEvent.setFocus(false);
//  }
//}

void drawExit() {
  textSize(26);
  textAlign(LEFT);
  if (playActive) {
    fill(0);
    text("Чтобы выйти в меню нажмите \"TAB\"", 20, 70);
  } else {
    fill(255);
    text("Чтобы продолжить игру жмите \"TAB\"", 20, 70);
  }
  text("Для выхода нажмите \"ESC\"", 20, 40);


  noFill();
  textSize(35);
}

void outVin() {
  textAlign(CENTER);
  int tmp = move - 1;
  if (tmp == 0) {
    tmp = namberPlayers;
  }
  switch(tmp) {
  case 1:
    fill(0, 255, 0);
    text("ВЫЙГРАЛ ЗЕЛЁНЫЙ!!!", displayWidth / 2, displayHeight - 100);
    break;
  case 2:
    fill(255, 0, 0);
    text("ВЫЙГРАЛ КРАСНЫЙ!!!", displayWidth / 2, displayHeight - 100);
    break;
  case 3:
    fill(0, 0, 255);
    text("ВЫЙГРАЛ СИНИЙ!!!", displayWidth / 2, displayHeight - 100);
    break;
  case 4:
    fill(255, 127, 255);
    text("ВЫЙГРАЛ РОЗОВЫЙ!!!", displayWidth / 2, displayHeight - 100);
    break;
  }
}



void outPlayers() {
  fill(0);
  textAlign(RIGHT);
  text("Очередь ходов:", displayWidth - 20, 85);
  textSize(26);
  text("Требуется в ряд для победы: " + vinNamber, displayWidth - 20, 40);
  for (byte i = 0; i < namberPlayers; ++i) {
    switch((move - 1 + i) % namberPlayers) {
    case 0:
      fill(0, 255, 0);
      text("Игрок №1", displayWidth - 20, 120 + 35 * i);
      break;
    case 1:
      fill(255, 0, 0);
      text("Игрок №2", displayWidth - 20, 120 + 35 * i);
      break;
    case 2:
      fill(0, 0, 255);
      text("Игрок №3", displayWidth - 20, 120 + 35 * i);
      break;
    case 3:
      fill(255, 127, 255);
      text("Игрок №4", displayWidth - 20, 120 + 35 * i);
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
    //println(int(value) / step + "\t" + int(value / step));
    if (int(value) / step == int(value / step)) {
      int tmp = int(value);
      text(tmp, startX + sizeY / 3, startY + sizeY / 2);
    } else {
      text(value, startX + sizeY / 6, startY + sizeY / 2);
    }
    textAlign(CENTER, CENTER);
    textSize(sizeY / 1.25);
    //text(name, startX + sizeX / 2, startY - textWidth(name) / 2);
    text(name, startX + sizeX / 2, startY - sizeY / 1.5);
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
  public void setValue(float value) {
    this.value = constrain(value, min, max);
    nowX = (this.value - min) / step * pixel_step;
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
