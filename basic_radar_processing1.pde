import processing.serial.*;

Serial myPort;

int angle = 0;
int distance = 0;

void setup() {
  size(800,600);
  smooth();

  // CHANGE COM PORT
  myPort = new Serial(this,"COM3",115200);
}

void draw() {

  background(0);
  translate(width/2,height-50);

  readSerial();     // ✅ read data every frame
  drawRadar();
  drawSweep();
  drawObject();
}

void readSerial() {

  while(myPort.available() > 0) {

    String data = myPort.readStringUntil('.');

    if(data != null) {

      data = trim(data);
      data = data.substring(0,data.length()-1);

      int comma = data.indexOf(',');

      if(comma > 0){
        angle = int(data.substring(0,comma));
        distance = int(data.substring(comma+1));
      }
    }
  }
}

void drawRadar(){
  stroke(0,255,0);
  noFill();

  arc(0,0,700,700,PI,TWO_PI);
  arc(0,0,500,500,PI,TWO_PI);
  arc(0,0,300,300,PI,TWO_PI);
}

void drawSweep(){
  stroke(0,255,0);
  strokeWeight(4);

  float x = 350*cos(radians(angle));
  float y = -350*sin(radians(angle));

  line(0,0,x,y);
}

void drawObject(){

  if(distance < 40){

    fill(255,0,0);
    noStroke();

    float x = distance*8*cos(radians(angle));
    float y = -distance*8*sin(radians(angle));

    ellipse(x,y,12,12);
  }
}
