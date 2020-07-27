/*Megan Ju
   July 27, 2020
   DES INV 23
   Professor Michael Shiloh
   Create an instrument

   
*/

//---------------------------Variables---------------------------//

#include "pitches.h" //includes the values from the pitches.h document
#include <Servo.h>  //includes the servo library

unsigned long previousMillis = 0; //previous milliseconds that have passed since the 
                                 // user has interacted with the breadboard switches


//set up the variables for the buttons and later see if they have been pressed or not
int greenButtonPressed = 0;
int blueButtonPressed = 0;
int redButtonPressed = 0;
int yellowButtonPressed = 0;


//button and item connecting pins of the Arduino Uno
const int greenButtonPin = A1;
const int yellowButtonPin = A5;
const int blueButtonPin = A4;
const int redButtonPin = A3;
const int piezoBuzzPin = 12;
const int photoresistorPin = A0;


//variables for the green button's tune
int greenButtonMelody[] = { //different notes that are played in the tune
  NOTE_CS5, 0, NOTE_E5, NOTE_E5, NOTE_CS5, NOTE_CS5, NOTE_FS5, NOTE_CS5 
};
int noteDurations[] = { //the length of time each note plays for
  4, 4, 4, 8, 8, 4, 4, 4
};
unsigned long greenCurrentNoteStarted = 0;  //When was the current note played
int greenThisNote = 0;  //The note being played in the array 
int greenMillisToNextNote = 0;  //The amount of milliseconds until the next note should be played


//variables for the blue button's tune
int blueButtonInterval = 125; //Time that the note will play before next note
int blueButtonMelody[] = {  //different notes included in the melody
  NOTE_A3, NOTE_E4, NOTE_CS4, NOTE_B3, NOTE_A3
};
float blueButtonWait = 0; //time that the note will play for
const int blueMaxRepeats = 5; //how many notes are in the melody


//variables for the red button's tune
int redButtonInterval = 250;  //Time that the note will play for next note
int redButtonMelody[] = { //the notes that are in the melody
  NOTE_A2, NOTE_B2, NOTE_D3, NOTE_CS3, NOTE_A2
};
float redButtonWait = 0;    //time that the note will play for
const int redMaxRepeats = 5;  //how many notes are in the melody


//variables for the photoresistor's melodies

//variables for the photoresistor's melody with flashlight
int photoresistorHighMelody[] = {
  NOTE_CS6, NOTE_E6, NOTE_E6, NOTE_B6 //notes in the melody
};
int photoresistorHighDuration[] = { //duration of each note
  4, 8, 4, 4
};
unsigned long photoresistorHighCurrentNoteStarted = 0;  //When was the current note played
int photoresistorHighThisNote = 0;  //The note being played in the array
int photoresistorHighMillisToNextNote = 0;  //the amount of milliseconds until 
                                            //the next note should be played

//variables for the photoresistor's melody when covered
int photoresistorLowMelody[] = {
  NOTE_A5, NOTE_E6, NOTE_CS6, NOTE_A5, NOTE_FS5 //notes in the melody
};
int photoresistorLowDuration[] = {  //duration of each note
  2, 3, 2, 3, 3
};
unsigned long photoresistorLowCurrentNote = 0;  //When was the current note played
int photoresistorLowThisNote = 0; //the note being played in the array
int photoresistorLowMillisToNextNote = 0; //the amound of time until the next note should be played


//---------------------------Class ~ Melodies---------------------------//
/*I tried to create a class for several of my melodies when I realized that the 
 * code was similar for the red and blue buttons. However, I found out that
 * you cannot transfer an array into another array without coding for each individual item
 * in the array. 
 */
/*class Melodies {
    int duration;
    int piezoBuzzPin = 8;
    int buttonPin;
    int repeats;
    int playLength;
    int melodyList[];

  public:
    Melody(int pin, float interval, int noteArray, int numberOfNotes) {
      repeats = numberOfNotes;
      buttonPin = pin;
      pinMode(pin, INPUT);
      duration = interval * 1.30;
      playLength = interval;
      previousMillis = 0;
      melodyList[] = noteArray;
    }

    void Update() {
      int i = 0;
      while (i < repeats) {
        unsigned long currentMillis = millis();
        if (currentMillis - previousMillis > playLength) {
          previousMillis = currentMillis;
          tone(piezoBuzzPin, melodyList[i], duration);
          i++;
        }
      }
    }
  };*/

//---------------------------Class ~ Servo Volume---------------------------//

class Volume {  //the class for the servo's actions. Since I used the servo motor
                //to act as a change in volume with the piezo button, I titled
                //the class as such. 
    
    Servo servo;  //creates a servo object to control the servo
    int pos = 0;  //variable to store the position of the servo
    int increment = 0;  //amount the servo will move each time
    int updateInterval = 0; //the amount of time between the updates
    unsigned long lastUpdate = 0; //the last known position of the last update

  public:
    Volume(int interval) {  //how to initialize the class
      updateInterval = interval;  //the updateInterval will be set 
                                  //to the interval amount
      increment = 1;  //the increment of change will be one
    }

    void Attach(int pin) {  //where the servo is attached to
      servo.attach(pin);
    }

    void Update() { //function to update the position of the servo
      
      if ((millis() - lastUpdate) > updateInterval) { //is it time to update?
        
        lastUpdate = millis();  //the time will be set to lastUpdate variable
        
        pos += increment; //the position increases by the increment
        
        servo.write(pos); //change the servo's position
        
        if ((pos >= 25) || (pos <= 0)) {  //changes the direction of movement if 
                                          //the servo reached the end of 
                                          //the movement
          increment = -increment;
        }
      }
    }
};

Volume volume(15);  //calls the volume() function ~ similar to set up



//---------------------------Set-Up---------------------------//

void setup() {
  
  //sets up the pin modes for the buttons, photoresistor, and piezo buzzer
  pinMode(greenButtonPin, INPUT);
  pinMode(blueButtonPin, INPUT);
  pinMode(redButtonPin, INPUT);
  pinMode(yellowButtonPin, INPUT);
  pinMode(photoresistorPin, INPUT);
  pinMode(piezoBuzzPin, OUTPUT);

  //calls the attach function from the volume class to detect where the servo
  //motor's pin
  volume.Attach(9);
  
  //Serial.begin(9600); I used this to determine what sections of the photo-
  //resistor's values I wanted to use
                      
}


//---------------------------Main Code---------------------------//
void loop() {

  //digital reads of all the pins the buttons are connected to so 
  //the Arduino can detect if they have been presed or not
  greenButtonPressed = digitalRead(greenButtonPin);
  blueButtonPressed = digitalRead(blueButtonPin);
  redButtonPressed = digitalRead(redButtonPin);
  yellowButtonPressed = digitalRead(yellowButtonPin);

  unsigned long currentMillis = millis(); //what is the time at the moment

  int sensorValue = analogRead(A0); //sensorValue from the pin from the photoresistor
  //Serial.println(sensorValue);  I used this code to tell which group of values I should use to 
                                  //control the melody from the photoresistor
  //delay(1);


//------------------Yellow Button------------------//
 
 if (yellowButtonPressed == HIGH) { //if the yellow button is pressed then the
                                    //servo motor's position will be updated
    volume.Update();
  }


//------------------Photoresistor------------------//

//Low values

  if (sensorValue >= 0 && sensorValue <= 400) { //if the photoresistor reads values in between 0 and 400 
                                                //then the piezo buzzer will play the melody

    //determines if it is time to play the next note in the melody
    if (currentMillis - photoresistorLowCurrentNote >= photoresistorLowMillisToNextNote) {

      previousMillis = currentMillis; //stores the last time the note played

      //determines how long the note should play for
      int photoresistorLowNoteWait = 1000 / photoresistorLowDuration[photoresistorLowThisNote];

      //plays the melody through the piezo buzzer for the duration determined in the line above
      tone(piezoBuzzPin, photoresistorLowMelody[photoresistorLowThisNote], photoresistorLowNoteWait);

      //Calculates the time to wait before the next note is played
      photoresistorLowMillisToNextNote = photoresistorLowNoteWait * 1.30;

      //Stores the time when the note started
      photoresistorLowCurrentNote = currentMillis;

      //moves to the next note in the array
      photoresistorLowThisNote++;

      if (photoresistorLowThisNote > 4) { //starts the melody over when it reaches the end of the array
        photoresistorLowThisNote = 0;
      }
    }

  } else {
    photoresistorLowThisNote = 0; //restart the melody even if sensor detects numbers outside
                                  //0 and 400
  }



//High Values

  if (sensorValue >= 890 && sensorValue <= 1050) {  //if the photoresistor reads values in between 890 and 1000
                                                    //then the piezo buzzer will play the melody

    //determines if it is time to play the next note in the melody
    if (currentMillis - photoresistorHighCurrentNoteStarted >= photoresistorHighMillisToNextNote) {

      previousMillis = currentMillis; //stores the last time the note played

      //determines how long the note should play for
      int photoresistorHighNoteDuration = 1000 / photoresistorHighDuration[photoresistorHighThisNote]; 

      //plays the melody through the piezo buzzer for the duration determined in the line above
      tone(piezoBuzzPin, photoresistorHighMelody[photoresistorHighThisNote], photoresistorHighNoteDuration);

      //Calculates the time to wait before the next note is played
      photoresistorHighMillisToNextNote = photoresistorHighNoteDuration * 1.30;

      //Stores the time when the note started
      photoresistorHighCurrentNoteStarted = currentMillis;

      //moves to the next note in the array
      photoresistorHighThisNote++;

      if (photoresistorHighThisNote > 3) { //starts the melody over when it reaches the end of the array
        photoresistorHighThisNote = 0;
      }
    }
  } else {
  }


//------------------Green Button------------------//

  if (greenButtonPressed == HIGH) { //if the green button is pressed then the piezo buzzer will play
                                    //this melody

     //calculates if it is time to play the next note in the melody
    if (currentMillis - greenCurrentNoteStarted >= greenMillisToNextNote) {

      previousMillis = currentMillis; //stores last time note is played

      //calculates how long the note should be played for
      int noteDuration = 1000 / noteDurations[greenThisNote];

      //plays the melody through the piezo buzzer for the duration determined in the line above
      tone(piezoBuzzPin, greenButtonMelody[greenThisNote], noteDuration);

      //Calculates the time to wait before the next note is played
      greenMillisToNextNote = noteDuration * 1.30;

      //Stores the time when the note started
      greenCurrentNoteStarted = currentMillis;

      //moves to the next note in the array
      greenThisNote++;

      if (greenThisNote > 7) {  //starts the melody over when it reaches the end of the array

        greenThisNote = 0;
      }
    }
  } else {

    greenThisNote = 0;  //restart the melody even if button is not pressed

  }



//------------------Blue Button------------------//

  if (blueButtonPressed == HIGH) {  //if the blue button is pressed then the 
                                    //piezo buzzer will play this melody

    int i = 0;  //start at 0

    while (i < blueMaxRepeats) {  //how many times to play through the notes in the array

      unsigned long currentMillis = millis();   //stores the time at that moment

      if (currentMillis - previousMillis > blueButtonInterval) {  //should it play the notes

        //stores the last time the note is played
        previousMillis = currentMillis;

        //how long to play the note
        blueButtonWait = blueButtonInterval * 1.30;

        //plays the note through the piezo buzzer
        tone(piezoBuzzPin, blueButtonMelody[i], blueButtonWait);

        //moves on to next note in the array
        i++;
      }
    }
  }


//------------------Red Button------------------//

  if (redButtonPressed == HIGH) { //if the red button is pressed then the piezo buzzer will
                                  //play this melody
    int i = 0;  //start at 0

    while (i < redMaxRepeats) { //how many times to play through the notes in the array

      unsigned long currentMillis = millis(); //stores the time at that moment

      if (currentMillis - previousMillis > redButtonInterval) { //should it play the notes

        //stores the last time the note is played
        previousMillis = currentMillis;

        //how long to play the note
        redButtonWait = redButtonInterval * 1.30;

        //plays the note through the piezo buzzer
        tone(piezoBuzzPin, redButtonMelody[i], redButtonWait);

        //moves on to next note in the array
        i++;
      }
    }
  }

}
