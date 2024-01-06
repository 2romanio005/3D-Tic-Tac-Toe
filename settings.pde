
int size = 5;       // размер куба(клеток)
int vinNamber = 2;  // количество одинаковых в ряд для победы
float speed = 0.75; // скорость кручения(от 0 до 1)
byte namberPlayers = 2; //количество игроков

int sizeStep = 33;  // размер одной клетки куба(в пикселях)
float errore_cord_share = 0.2; // чтобы нормально работал выбор ячейки



int activeSize = size;
boolean activeInput = true;
boolean vin = false;
boolean playActive = false; 
byte move = 1;

int rotX = 250;  // 250
int rotY = 50;  // 50
int rotZ = 0;

byte top = 4;
byte topBefore = 4;

byte [][][] input;

int namberClick = 0;
long counterClick;

boolean flag_no_draw = false;
boolean flag_no_draw_before = false;


MySlider sizeSlider = new MySlider("Размер поля", 8.0, 1.0, 50.0, 1.0);
MySlider vinNamberSlider = new MySlider("Требуется в ряд для победы", 5.0, 1.0, 8.0, 1.0);
MySlider namberPlayersSlider = new MySlider("Количество игроков", 2.0, 2.0, 4.0, 1.0);
MySlider speedSlider = new MySlider("Чувствительность прокрутки", 0.75, 0.1, 2.0, 0.01);



void reset() {
  for (int i = 0; i < size; ++i) {
    for (int j = 0; j < size; ++j) {
      for (int h = 0; h < size; ++h) {
        input[i][j][h] = 0;
      }
    }
  }
  flag_no_draw = false;
  namberClick = 0;

  top = 4;
  topBefore = 4;

  activeSize = size;
  activeInput = true;
  vin = false;
  move = 1;

  rotX = 250;  // 250
  rotY = 50;  // 45 

  sizeStep = 33;

  cursor();
}
