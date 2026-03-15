#include <ESP32Servo.h>

#define TRIG 5
#define ECHO 18
#define SERVO_PIN 13

Servo myServo;

long duration;
int distance;
int threshold = 20;  // object detection distance

void setup() {
  Serial.begin(115200);

  pinMode(TRIG, OUTPUT);
  pinMode(ECHO, INPUT);

  myServo.setPeriodHertz(50);  
  myServo.attach(SERVO_PIN, 500, 2400);
}

int getDistance() {
  digitalWrite(TRIG, LOW);
  delayMicroseconds(2);

  digitalWrite(TRIG, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG, LOW);

  duration = pulseIn(ECHO, HIGH);
  distance = duration * 0.034 / 2;

  return distance;
}

void loop() {

  for (int angle = 0; angle <= 180; angle++) {
    myServo.write(angle);
    delay(20);

    int dist = getDistance();

 
    Serial.print(angle);
    Serial.print(",");
    
    Serial.print(dist);
    Serial.print(".");
 
   
   
  }

  for (int angle = 180; angle >= 0; angle--) {
    myServo.write(angle);
    delay(20);
  }
}
