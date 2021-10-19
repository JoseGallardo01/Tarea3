/* 
Programa creado por José Francisco Gallardo Ojeda para la asignatura "Software para ingeniería electrónica"
Se utiliza la librería Sound
Se debe cargar el archivo de auudio car-alarm.mp3 disponible en el archivo .zip
*/
import processing.sound.*;
SoundFile file;

int p0_x_1 = 150;
int p0_x_2 = 170;
int p0_x_3 = 160;
int p1_x_1 = 150;
int p1_x_2 = 170;
int p1_x_3 = 160;

void settings() {  
  size(900, 500);
  smooth(14);
}

void setup(){
  background(255);
  file = new SoundFile(this, "car-alarm.mp3");
}

void draw() {
// Dibujando la interfáz visual de los sensores
// Barra de Sensor 1 y título
  fill(15, 189, 12);
  rect(150,100,195,50);
  fill(248, 228, 29);
  rect(345,100,200,50);
  fill(249, 29, 29);
  rect(545,100,205,50);
  fill(0);
  triangle(p0_x_1,100,p0_x_2,100,p0_x_3,110);
  
  //Números
  fill(0);
  for(int i=1; i<=24; i++){
    pushMatrix();
    translate(157+25*(i-1), 140);
    textSize(10);
    text((i-1)*20, 0, 0);
    popMatrix();
  }
// Barra de Sensor 2
  fill(15, 189, 12);
  rect(150,350,200,50);
  fill(248, 228, 29);
  rect(340,350,215,50);
  fill(249, 29, 29);
  rect(555,350,200,50);
  fill(0);
  triangle(p1_x_1,350,p1_x_2,350,p1_x_3,360);
  
  //Números
  fill(0);
  for(int i=1; i<=17; i++){
    pushMatrix();
    translate(155+35.3*(i-1), 390);
    textSize(10);
    text(970+(i-1)*5, 0, 0);
    popMatrix();
  }
//Puntos de prueba:
  fill(0);
  textSize(14);
  text("Punto de prueba temperatura",200,210);
  fill(255);
  rect(200,220,200,50);
  fill(0);
  textSize(14);
  text("Punto de prueba presión",518,210);
  fill(255);
  rect(500,220,200,50);


//Detección del mouse en el sensor rectangular 1:
  if (mouseEnSensor1()){
    p0_x_1=p0_x_1+1;
    p0_x_2=p0_x_2+1;
    p0_x_3=p0_x_3+1;
    if (p0_x_1>=730){
      p0_x_1=p0_x_1-1;
    }
    if (p0_x_2>=750){
      p0_x_2=p0_x_2-1;
    }
    if (p0_x_3>=740){
      p0_x_3=p0_x_3-1;
    }
  }
  else {
    p0_x_1=p0_x_1-1;
    p0_x_2=p0_x_2-1;
    p0_x_3=p0_x_3-1;
    if (p0_x_1<150){
      p0_x_1=p0_x_1+1;
    }
    if (p0_x_2<170){
      p0_x_2=p0_x_2+1;
    }
    if (p0_x_3<160){
      p0_x_3=p0_x_3+1;
    }
  }

//Detección del mouse en el sensor rectangular 2:
   if (mouseEnSensor2()){
    p1_x_1=p1_x_1+1;
    p1_x_2=p1_x_2+1;
    p1_x_3=p1_x_3+1;
    if (p1_x_1>=730){
      p1_x_1=p1_x_1-1;
    }
    if (p1_x_2>=750){
      p1_x_2=p1_x_2-1;
    }
    if (p1_x_3>=740){
      p1_x_3=p1_x_3-1;
    }
  }
  else {
    p1_x_1=p1_x_1-1;
    p1_x_2=p1_x_2-1;
    p1_x_3=p1_x_3-1;
    if (p1_x_1<150){
      p1_x_1=p1_x_1+1;
    }
    if (p1_x_2<170){
      p1_x_2=p1_x_2+1;
    }
    if (p1_x_3<160){
      p1_x_3=p1_x_3+1;
    }
  }
  
//Alarma sonora:
  if (p0_x_3>=545 || p1_x_3>=555){
    if (!file.isPlaying()){file.play();}
  }
  else{
    file.stop();
  }
  
//Alarma visual:
  if (p0_x_3>=545){
  fill(255,8,8);
  rect(200,220,200,50);
  fill(255);
  textSize(18);
  text("PELIGRO",263,250);
  }
  if (p1_x_3>=555){
  fill(255,8,8);
  rect(500,220,200,50);
  fill(255);
  textSize(18);
  text("PELIGRO",563,250);
  }
// Medición instantánea:
  fill(255);
  rect(345,60,200,40);
  fill(0);
  textSize(14);
  text("Temperatura (°C) =",350,90);
  fill(0);
  textSize(14);
  text((p0_x_3-160)*0.8,485,90);
  
  fill(255);
  rect(340,310,215,40);
  fill(0);
  textSize(14);
  text("Presión (hPa) =",360,340);
  fill(0);
  textSize(14);
  text((p1_x_3+6920.29)*0.137,470,340);
}
boolean mouseEnSensor1(){
  return( (pmouseX > 200 && pmouseX <400) && (pmouseY > 220 && pmouseY <270) );
}
boolean mouseEnSensor2(){
  return( (pmouseX > 500 && pmouseX <700) && (pmouseY > 220 && pmouseY <270) );
}
