import processing.sound.*;

SoundFile File;

void setup  (){
  size (200, 200);
  background (0);
}

void draw(){
  fill (255);
  square (50, 50, 50);
  audio = new SoundFile(this, "Mahjong.mp3");
  audio.play();
}
