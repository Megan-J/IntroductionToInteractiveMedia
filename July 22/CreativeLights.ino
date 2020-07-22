/* Megan Ju
 * July 21, 2020
 * DES INV 23
 * 
 * First ever project using Arduino. I liked seeing a tangible result in the programming and the LEDs.
 * When using Processing, everything is through a screen and it feels like a separation from my creation.
 * However, when working with Arduino, there is a tangible result.
 */

//----------------------Variables----------------------//

//green LED variables

const int greenLedPin =  12;  //pin number of the green LED
int greenLedState = LOW;  //represents the LED being off or on, LED begins off
unsigned long previousMillis = 0; //previous milliseconds the LED has been in its LEDState
const int interval = 200; //the interval of the green LED turning off and on while the button
                          //isn't pressed
long onInterval = 1000; //the time the LED is on while the button is pressed
long offInterval = 300; //the time the LED is off while the button is pressed


//blue LED variables

const int blueLedPin = 9; //pin number of blue LED
int brightness = 0; //the amount of brightness


//----------------------Set Up----------------------//

void setup() {
  
  pinMode(greenLedPin, OUTPUT); //greenLED's pin is an output
  pinMode(blueLedPin, OUTPUT);  //blueLED's pin is an output
  pinMode(A0, INPUT); //the A0 pin is an input (switch)
  pinMode(A2, INPUT); //the A2 is an input (photoresistor)
  Serial.begin(9600); //the speed of serial communication (bits/second)
  
}


//----------------------Loop----------------------//

void loop() {

//----------------------Variables----------------------//

  unsigned long currentMillis = millis(); //the current number of milliseconds

  int switchPosition = digitalRead(A0); //the switch is located from A0 pin

//----------------------Reads Analog Numbers from Photoresistor----------------------//

  int sensorValue = analogRead(A2); //the number recieved from the pin A2 from the photoresistor
  Serial.println(sensorValue);  //prints the number it recieved
  delay(1);

//----------------------Green LED Control----------------------//

//changes the blinking rate of the green LED
 
  if (switchPosition == HIGH) { //if the switch is pressed
    
    if (currentMillis - previousMillis >= interval) { //is the difference between 
                                                      //the current milliseconds and the last
                                                      //number of milliseconds greater than or equal 
                                                      //to the interval

      previousMillis = currentMillis; //stores the last time the LED changed

      if (greenLedState == LOW) { //if LED is off turn on
        greenLedState = HIGH;
      } else {  //if LED is on turn off
        greenLedState = LOW;
      }

      digitalWrite(greenLedPin, greenLedState); //set the LED with the state of the variable 
                                                //(if off or on)
    }
    
  } else { //if switch is not pressed

    //is it time to turn off the LED based on if the difference is greater than the onInterval 
    //variable and if it is currently on
    if ((currentMillis - previousMillis >= onInterval) && (greenLedState == HIGH)) {

      greenLedState = LOW; //turn it off
      previousMillis = currentMillis; //store the time
      digitalWrite(greenLedPin, greenLedState); //change LED to state of variable
      
    } else 

    //is it time to turn on the LED
    if ((currentMillis - previousMillis >= offInterval) && (greenLedState == LOW)) {
     
      greenLedState = HIGH; //turn on
      previousMillis = currentMillis; //store time
      digitalWrite(greenLedPin, greenLedState); //change LED to state of variable
      
    }
  }

//----------------------Blue LED Control----------------------//

//changes the brightness of blue LED based on surroundings

  if (sensorValue < 400 && sensorValue > 0) {//if the photoresistor gives a value in between
                                             //0 and 400 change the brightness to 10
    brightness = 10;
    analogWrite(blueLedPin, brightness);  //change LED to state of brightness
  }
  
  if (sensorValue < 550 && sensorValue > 400) {//if the photoresistor gives a value in between
                                             //400 and 550 change the brightness to 70
    brightness = 70;
    analogWrite(blueLedPin, brightness);  //change LED to state of brightness
  }
  
  if (sensorValue < 780 && sensorValue > 550) {//if the photoresistor gives a value in between
                                             //550 and 780 change the brightness to 160
    brightness = 160;
    analogWrite(blueLedPin, brightness); //change LED to state of brightness
  }
  
  if (sensorValue < 900 && sensorValue > 780) {//if the photoresistor gives a value in between
                                             //780 and 900 change the brightness to 220
    brightness = 220;
    analogWrite(blueLedPin, brightness);  //change LED to state of brightness
  }
}
