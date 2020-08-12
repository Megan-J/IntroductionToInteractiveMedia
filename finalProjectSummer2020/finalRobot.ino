/* 
 * Final project for DES INV 23: Arduino portion.
 * 
 * This side brings my robot to life! He enjoys traveling all over his small encloser.
 * He collects distance, light, and potentiometer data to help people interact with him.
 * 
 * Credits: I used the SparkFun tutorial for Autonomous Robot to code the turning of the geared
 * motors and Adafruit's Multi-tasking the Arduino tutorial to make sure I did not use
 * the delay function within my code. The delay function would have paused the motion of
 * moving the robot while collecting the information from the photoresisotr, potentiometer,
 * and Ultrasonic sensor. 
 * 
*/


//----------------------Variables----------------------//

//Geared motor controls
//Pin number of the Motor Driver pins to the Arduino pins

const int ain1Pin = 13;
const int ain2Pin = 12;
const int pwmAPin = 11;

const int bin1Pin = 8;
const int bin2Pin = 9;
const int pwnBPin = 10;

//Ultrasonic Sensor pins

const int triggerPin = 7;
const int echoPin = 4;

//On and off switch pin

const int switchPin = 2;

//photoresistor pin
const int photoresistorPin = A0;

//potentiometer pin
const int potentiometerPin = A3;

//pins for the RGB LED
const int redPin = 6;
const int greenPin = 5;
const int bluePin = 3;

//variable to collect the distance data from 
//the Ultrasonic sensor
long distance = 0;

//previous milliseconds to run functions
//without delay()

//for the geared motors
unsigned long previousMillisWheels = 0;

//time to stop moving
unsigned long previousMillisPause = 0;

//time to backup
unsigned long previousMillisBackupTime = 0;

//time to turn
unsigned long previousMillisTurnTime = 0;

//time to print distance
unsigned long previousMillisDistance = 0;

//time to print photoresistor
unsigned long previousMillisPhotoresistor = 0;

//time to print potentiometer
unsigned long previousMillisPotentiometer = 0;

//time to light the LED
unsigned long previousMillisLED = 0;

//intervals for the previous millis above

int backupTime = 300;
int turnTime = 200;
int timeBetweenRead = 50;
int pause = 200;
int distancePauseTime = 1000;
int photoresistorPauseTime = 1000;
int potentiometerPauseTime = 1000;
int LEDpauseTime = 1000;



//----------------------SetUp----------------------//

void setup() {

  //establishing pins and how they function
  
  pinMode(ain1Pin, OUTPUT);
  pinMode(ain2Pin, OUTPUT);
  pinMode(bin1Pin, OUTPUT);
  pinMode(bin2Pin, OUTPUT);
  pinMode(triggerPin, OUTPUT);
  digitalWrite(triggerPin, LOW);
  pinMode(echoPin, INPUT);
  pinMode(switchPin,  INPUT_PULLUP);
  pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT);

  //start the serial monitor
  Serial.begin(9600);

}


//----------------------Loop----------------------//

void loop() {

  //start counting how many milliseconds
  unsigned long currentMillis = millis();


  //if it is time get the distance from the function below (calcDistance())
  //and print the number in the serial monitor
  
  if (currentMillis - previousMillisDistance >= distancePauseTime) {
    distance = calcDistance();
    previousMillisDistance = currentMillis;
    //Serial.print("Distance: ");
    Serial.print(distance);
    Serial.print(",");
  }


  //if it's time, get the information from the photoresistor and print it
  //into the serial monitor
  
  if (currentMillis - previousMillisPhotoresistor >= photoresistorPauseTime) {
    previousMillisPhotoresistor = currentMillis;
    //Serial.println("Photoresistor: ");
    Serial.print(analogRead(photoresistorPin));
    Serial.print(",");
  }


  //if it's time get the information from the potentiometer and print it 
  //into the serial monitor
  
  if (currentMillis - previousMillisPotentiometer >= potentiometerPauseTime) {
    previousMillisPotentiometer = currentMillis;
    //Serial.println("Potentiometer: ");
    Serial.println(analogRead(potentiometerPin));
    //Serial.print(",");
  }


  //if it's time determine if the switch is on or off
  
  if (currentMillis - previousMillisWheels >= timeBetweenRead) {

    previousMillisWheels = currentMillis;

    //if switch is flipped
    if (digitalRead(switchPin) == LOW) {

      //if distance from Ultrasonic sensor is less than 10 inches 
      //turn LED on and back up
      if (distance < 10) {

        LEDcolor(); //turns LED on

        //stops motors from turning
        if (currentMillis - previousMillisPause >= pause) {

          previousMillisPause = currentMillis;
   
          rightMotor(0);
          leftMotor(0);
        }

        //backs up
        if (currentMillis - previousMillisBackupTime >= backupTime) {

          previousMillisBackupTime = currentMillis;

          rightMotor(255);
          leftMotor(255);
        }

        //turns slightly to the right
        if (currentMillis - previousMillisTurnTime >= turnTime) {

          previousMillisTurnTime = currentMillis;

          rightMotor(255);
          leftMotor(-255);
        }

      //if nothing in the way, go straight
      } else {

        LEDoff();
        rightMotor(-255);
        leftMotor(-255);
      }

    //if switch isn't flipped then do not turn the motors
    } else {
      rightMotor(0);
      leftMotor(0);
    }
  }



}

//-------------Right Motor Control-------------//

//control of the right motor

void rightMotor(int motorSpeed) {

  //if motor is driving backwards
  if (motorSpeed > 0) {
    digitalWrite(ain1Pin, HIGH);  //pin 1 to high
    digitalWrite(ain2Pin, LOW); //pin 2 to low

  //if motor is driving forwards
  } else if (motorSpeed < 0) {
    digitalWrite(ain1Pin, LOW); //pin 1 to low
    digitalWrite(ain2Pin, HIGH);  //pin 2 to high

  //if motor stops
  } else {
    digitalWrite(ain1Pin, LOW); //pin 1 to low
    digitalWrite(ain2Pin, LOW); //pin 2 to high
  }
  
  //drive the motor at entered speed
  analogWrite(pwmAPin, abs(motorSpeed));

}


//-------------Left Motor Control-------------//

//control of left motor

void leftMotor(int motorSpeed) {

  //if motor is driving backwards
  if (motorSpeed > 0) {
    digitalWrite(bin1Pin, HIGH);  //pin 1 to high
    digitalWrite(bin2Pin, LOW); //pin 2 to low

  //if motor driving forwards
  } else if (motorSpeed < 0) {
    digitalWrite(bin1Pin, LOW); //pin 1 to low
    digitalWrite(bin2Pin, HIGH);  //pin 2 to high

  //if motor stops
  } else {
    digitalWrite(bin1Pin, LOW); //pin 1 to low
    digitalWrite(bin2Pin, LOW); //pin 2 to high
  }

  //drive motor at entered speed
  analogWrite(pwnBPin, abs(motorSpeed));
}

//-------------Calculate the Distance-------------//

float calcDistance() {

//calculates the distance from any object

  float duration; //duration of the sound waves sent and return
  float newDistance;  //newest distance the sensor receives
  float lastDistance; //last distance the sensor received

  //trigger pin high to send waves
  digitalWrite(triggerPin, HIGH);

  //turns low trigger pin
  digitalWrite(triggerPin, LOW);

  //calculates the time is took to receive the information
  duration = pulseIn(echoPin, HIGH);

  //distance calculated by the time it took and 148
  newDistance = duration / 148;

  //makes sure the sensor does not pick up noise
  if (abs (newDistance - lastDistance) > 20 ) {
  newDistance = lastDistance;
  }

  lastDistance = newDistance;

  //sends new distance to the call in loop()
  return newDistance;

}

//-------------LED Color-------------//

void LEDcolor() {
  
  //turns the RGB LED lights on to certain
  //brightness to create a certain color
  
  analogWrite(redPin, 199);
  analogWrite(greenPin, 80);
  analogWrite(bluePin, 107);
}

void LEDoff() {

  //turns the entire LED off
  
  analogWrite(redPin, 0);
  analogWrite(greenPin, 0);
  analogWrite(bluePin, 0);
}
