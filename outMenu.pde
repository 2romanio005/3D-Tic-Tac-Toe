
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
void Win_namber(int val){
  vinNamber = val;
}
void Namber_players(int val){
  namberPlayers = byte(val);
}
void Sensibility(float val){
  speed = val;
}
