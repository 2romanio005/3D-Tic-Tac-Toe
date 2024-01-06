
import controlP5.*;
ControlP5 cp5;
void setup() {
  size(displayWidth, displayHeight, P3D);
  //size(1000, 500, P3D);
  //fullScreen(P3D);

  frameRate(80);
  textSize(35);
  //textAlign(CENTER);

  sizeSlider.setSize(displayWidth / 2 - 250, displayHeight / 4, 500, 30);
  vinNamberSlider.setSize(displayWidth / 2 - 250, displayHeight / 8 * 3, 500, 30);
  namberPlayersSlider.setSize(displayWidth / 2 - 250, displayHeight / 2, 500, 30);
  speedSlider.setSize(displayWidth / 2 - 250, displayHeight / 8 * 5, 500, 30);
  speedSlider.drawSeparator(false);





  cp5 = new ControlP5(this);
  //PImage[] imgs =;
  cp5.addButton("play")
    .setPosition(displayWidth / 2 - 50, displayHeight / 4 * 3 - 50)
    .setImages(loadImage("button_a.png"), loadImage("button_b.png"), loadImage("button_c.png"))
    .updateSize()
    ;
  cp5.addButton("save")
    .setPosition(displayWidth / 2 - 225, displayHeight / 4 * 3 - 20)
    .setImages(loadImage("save_a.png"), loadImage("save_b.png"), loadImage("save_c.png"))
    .updateSize()
    ;
  cp5.addButton("load")
    .setPosition(displayWidth / 2 + 75, displayHeight / 4 * 3 - 20)
    .setImages(loadImage("load_a.png"), loadImage("load_b.png"), loadImage("load_c.png"))
    .updateSize()
    ;


  PFont font = createFont("arial", 20);
  cp5.addTextfield(" ")
    .setPosition(displayWidth / 2 - 225, displayHeight / 4 * 3 - 50)
    .setSize(150, 30)
    .setFont(font)
    .setAutoClear(false) 
    .setText("Play_1")
    //.setFocus(true)
    //.setColor(color(255, 0, 0))
    ;  
  cp5.addTextfield("  ")
    .setPosition(displayWidth / 2 + 75, displayHeight / 4 * 3 - 50)
    .setSize(150, 30)
    .setFont(font)
    .setAutoClear(false) 
    .setText("Play_1")
    //.setFocus(true)
    //.setColor(color(255, 0, 0))
    ;  


  //play();
  //vin = true;
}


void draw() {   
  if (playActive) {
    controlMouse();
    background(255);
    if (vin) {
      outVin();
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
