import controlP5.*;
ControlP5 cp5;
void setup() {
  size(1000, 500, P3D);
  //size(displayWidth, displayHeight, P3D);
  //fullScreen(P3D);
  frameRate(80);
  textSize(35);
  textAlign(CENTER);
  PFont font = createFont("arial", 20);
  //noFill();
  cp5 = new ControlP5(this);





  sliderSize = cp5.addSlider("Size_map")
    .setPosition(displayWidth / 2 - 270, displayHeight / 4 )
    .setRange(2, 30)
    .setWidth(500)
    .setHeight(30)
    .setFont(font)
    .setValue(8)
    .setNumberOfTickMarks(29)
    ;
  cp5.addSlider("Win_namber")
    .setPosition(displayWidth / 2 - 270, displayHeight / 8 * 3 )
    .setRange(1, 30)
    .setWidth(500)
    .setHeight(30)
    .setFont(font)
    .setValue(5)
    .setNumberOfTickMarks(29)
    ;
  cp5.addSlider("Namber_players")
    .setPosition(displayWidth / 2 - 270, displayHeight / 2 )
    .setRange(2, 4)
    .setWidth(500)
    .setHeight(30)
    .setFont(font)
    .setValue(2)
    .setNumberOfTickMarks(3)
    ;
  cp5.addSlider("Sensibility")
    .setPosition(displayWidth / 2 - 270, displayHeight / 8 * 5 )
    .setRange(0.1, 2)
    .setWidth(500)
    .setHeight(30)
    .setFont(font)
    .setValue(0.75)
    ;

  PImage[] imgs = {loadImage("button_a.png"), loadImage("button_b.png"), loadImage("button_b.png")};
  cp5.addButton("play")
    .setPosition(displayWidth / 2, displayHeight / 16 * 12 )
    .setImages(imgs)
    .updateSize()
    ;
 // play();
   test.drawSeparator(false);
  test.setMax(2.5);
}


void draw() { 

  if (playActive) {
    controlMouse();
    translate(displayWidth / 2, displayHeight / 2, 0);
    background(255);
    if (vin) {
      switch(move) {
      case 2:
        fill(0, 255, 0);
        text("ВЫЙГРАЛ ЗЕЛЁНЫЙ!!!", CENTER, CENTER + 350, CENTER);
        break;
      case 3:
        fill(255, 0, 0);
        text("ВЫЙГРАЛ КРАСНЫЙ!!!", CENTER, CENTER + 350, CENTER);
        break;
      case 4:
        fill(0, 0, 255);
        text("ВЫЙГРАЛ СИНИЙ!!!", CENTER, CENTER + 350, CENTER);
        break;
      case 1:
        fill(255, 127, 255);
        text("ВЫЙГРАЛ РОЗОВЫЙ!!!", CENTER, CENTER + 350, CENTER);
        break;
      }
    }


    if (activeInput) {
      controlOutPlay();
    } else {
      contropOutGO();
    }
  } else {
    cp5.get(Slider.class, "Win_namber").setMax(Size_map);
    cp5.get(Slider.class, "Win_namber").setNumberOfTickMarks(Size_map);

    background(150, 100, 240);
    //background(255);
  }
  test.tick();

  test2.tick();
}


// 1 - красная
// 2 - зелёная / синяя
