
import controlP5.*;
ControlP5 cp5;
void setup() {
  size(displayWidth, displayHeight, P3D);
  //size(1000, 500, P3D);
  //fullScreen(P3D);

  frameRate(80);
  textSize(35);
  //textAlign(CENTER);

  float tmp_start = 0.5;
  float tmp_fin = 9;


  sizeSlider.setSize(displayWidth / 2 - 250, displayHeight / tmp_fin * (1 + tmp_start), 500, 30);
  vinNamberSlider.setSize(displayWidth / 2 - 250, displayHeight / tmp_fin * (2 + tmp_start), 500, 30);
  voidSlider.setSize(displayWidth / 2 - 250, displayHeight / tmp_fin * (3 + tmp_start), 500, 30);
  voidSlider.drawSeparator(false);
  timeSlider.setSize(displayWidth / 2 - 250, displayHeight / tmp_fin * (4 + tmp_start), 500, 30);
  timeSlider.drawSeparator(false);
  namberPlayersSlider.setSize(displayWidth / 2 - 250, displayHeight / tmp_fin * (5 + tmp_start), 500, 30);
  speedSlider.setSize(displayWidth / 2 - 250, displayHeight / tmp_fin * (6 + tmp_start), 500, 30);
  speedSlider.drawSeparator(false);





  cp5 = new ControlP5(this);
  //PImage[] imgs =;
  cp5.addButton("play")
    .setPosition(displayWidth / 2 - 50, displayHeight / tmp_fin * (7 + tmp_start) - 50)
    .setImages(loadImage("button_a.png"), loadImage("button_b.png"), loadImage("button_c.png"))
    .updateSize()
    ;
  cp5.addButton("save")
    .setPosition(displayWidth / 2 - 225, displayHeight / tmp_fin * (7 + tmp_start) - 20)
    .setImages(loadImage("save_a.png"), loadImage("save_b.png"), loadImage("save_c.png"))
    .updateSize()
    ;
  cp5.addButton("load")
    .setPosition(displayWidth / 2 + 75, displayHeight / tmp_fin * (7 + tmp_start) - 20)
    .setImages(loadImage("load_a.png"), loadImage("load_b.png"), loadImage("load_c.png"))
    .updateSize()
    ;


  PFont font = createFont("arial", 20);
  cp5.addTextfield(" ")
    .setPosition(displayWidth / 2 - 225, displayHeight / tmp_fin * (7 + tmp_start) - 50)
    .setSize(150, 30)
    .setFont(font)
    .setAutoClear(false) 
    .setText("Play_1")
    //.setFocus(true)
    //.setColor(color(255, 0, 0))
    ;  
  cp5.addTextfield("  ")
    .setPosition(displayWidth / 2 + 75, displayHeight / tmp_fin * (7 + tmp_start) - 50)
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
    if((timeMax != 0) && (millis() - timer >= timeMax)){
      activeSize = size;
      activeInput = true;
      if (++move > namberPlayers) move = 1;
      timer = millis();
    }

    outPlayers();
    drawExit();

    translate(displayWidth / 2, displayHeight / 2, 0);
    if (activeInput) {
      controlOutPlay();    // крутить кубик
    } else {
      contropOutGO();      // походить
    }
  } else {
    background(150, 100, 240);
    drawExit();

    if (sizeSlider.tick()) vinNamberSlider.setMax(sizeSlider.getValue());
    
    vinNamberSlider.tick();
    voidSlider.tick();
    timeSlider.tick();
    namberPlayersSlider.tick();
    speedSlider.tick();
  }
  //print(rotX + "\t");
  //print(rotY + "\t");
  //println(top);
}
