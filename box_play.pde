import controlP5.*;
ControlP5 cp5;
void setup() {
  //size(displayWidth, displayHeight, P3D);
  //size(1000, 500, P3D);
  fullScreen(P3D);

  frameRate(80);
  textSize(35);
  textAlign(CENTER);

  sizeSlider.setSize(displayWidth / 2 - 250, displayHeight / 4, 500, 30);
  vinNamberSlider.setSize(displayWidth / 2 - 250, displayHeight / 8 * 3, 500, 30);
  namberPlayersSlider.setSize(displayWidth / 2 - 250, displayHeight / 2, 500, 30);
  speedSlider.setSize(displayWidth / 2 - 250, displayHeight / 8 * 5, 500, 30);
  speedSlider.drawSeparator(false);

  cp5 = new ControlP5(this);
  PImage[] imgs = {loadImage("button_a.png"), loadImage("button_b.png"), loadImage("button_b.png")};
  cp5.addButton("play")
    .setPosition(displayWidth / 2 - 50, displayHeight / 4 * 3 - 50)
    .setImages(imgs)
    .updateSize()
    ;
  //play();
  //vin = true;
}


void draw() {   
  if (playActive) {
    controlMouse();
    background(255);
    if (vin) {
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

    outPlayers();
    drawExit();
    
    translate(displayWidth / 2, displayHeight / 2, 0);
    if (activeInput) {
      controlOutPlay();
    } else {
      contropOutGO();
    }
  } else {
    background(150, 100, 240);
    drawExit();
    
    if (sizeSlider.tick()) vinNamberSlider.setMax(sizeSlider.getValue());
    vinNamberSlider.tick();
    namberPlayersSlider.tick();
    speedSlider.tick();
  }
  //print(rotX + "\t");
  //print(rotY + "\t");
  //println(top);
}
