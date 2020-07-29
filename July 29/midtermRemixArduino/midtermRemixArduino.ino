//------------------Variables------------------//

//pin numbers for the 
const int triggerPin = 8;  
const int echoPin = 11;

//time is takes for the sound waves to 
travel and return
long duration = 0;

//centimeter distance away from the Ultrasonic
//sensor
long distance = 0;

//previous milliseconds the Ultrasonic sensor
//returned information
unsigned long previousMillis = 0;

//the interval to wait between each outputted value
const int interval = 1000;


//------------------Set Up------------------//

void setup() {

  //trigger pin is the one sending the sound waves out
  pinMode(triggerPin, OUTPUT);

  //trigger pin is currently off
  digitalWrite(triggerPin, LOW);

  //echo pin receiving the sound waves return
  pinMode(echoPin, INPUT);

  //printing in the serial moniter at 9600 speed
  Serial.begin(9600);
}


//------------------Loop------------------//

void loop() {

  //current milliseconds that have passed and if it is 
  //time to recieve the information
  unsigned long currentMillis = millis();

  //trigger pin telling the Ultrasonic sensor
  //to send out the sound waves
  digitalWrite(triggerPin, HIGH);


  if (currentMillis - previousMillis  >= interval) {

    //turning of the output of sound waves
    digitalWrite(triggerPin, LOW);

    //duration is set to the time from the echoPin LOW
    //to echoPin HIGH
    duration = pulseIn(echoPin, HIGH);

    //the distance is set to the time divided by 58 to get
    //the distance in centimeters
    distance = duration / 58;

    //prints the values in the serial moniter
    Serial.println(distance);
  }

}
