# Midterm Remix with Arduino

### Project Description

I modified my midterm project to combine the code of that project with an Arduino Uno. I knew from the beginning of this project that I wanted to use the Ultrasonic Sensor but I did not know how the sensor worked. I learned all about the sensor and its functions from [Jeremy S. Cook's article](https://www.arrow.com/en/research-and-events/articles/ultrasonic-sensors-how-they-work-and-how-to-use-them-with-arduino#:~:text=Ultrasonic%20sensors%20work%20by%20emitting,return%20after%20hitting%20an%20object.) and a [post on Arduino's Project Hub](https://create.arduino.cc/projecthub/MisterBotBreak/how-to-use-an-ultrasonic-sensor-181cee). Originally, I wanted to use the Ardunio Uno to control how the player moved across the screen. Once everything was set up, the noise that played when the character moved layered on top of each other and sounded bad. I finally decided that I wanted the player, for my midterm game, to be able to choose a certain type of difficulty. The amount of difficulty is determined by how close the player is to the Ultrasonic Sensor. To test this part of the project out, I used a flashlight and binderpaper. I moved the flashlight around on the binderpaper to determine how close the object needed to be to the sensor to change the difficulty. When I decided which distances determined the change in difficulty, I drew boxes to remind myself how far the object needed to be from the Ultrasonic Sensor. 

The code for the Ultrasonic Sensor is based off of the [post on Arduino's Project Hub](https://create.arduino.cc/projecthub/MisterBotBreak/how-to-use-an-ultrasonic-sensor-181cee).

![](https://github.com/Megan-J/IntroductionToInteractiveMedia/blob/master/July%2029/MidtermRemix1.JPG)

### Clever and Tricky

The trickiest part of this project was receiving stables values from the sensor. Because I am using a solderless breadboard, not all of the connections are the best or are stable. The values the sensor outputted mostly gave me two consecutive numbers depending on how far an object was from the sensor. However, a random zero or number lower than the true distrance from the sensor was outputted. I accounted for these random values in my code by setting the easist mode from values 0-6, hardest mode from 7-14, and extreme mode from 15-20. This way even if zero or a smaller value was outputted then the difficulty would change for a split second before returning to the desired difficulty. 

When transferring to Processing once I completed the Arduino code, I kept getting lost in my code. My midterm code is very long due to all the events that need to happen during a game. I solved this issue by coding the program in another Processing file. This way I could run my code and check for any bugs. The simplicity of having the additional code in a blank file helped me understand what was going on. When I knew the code was good and would act in the way I wanted, I transfered it from the new file into the midtermRemix file. 

### Schematic

![](https://github.com/Megan-J/IntroductionToInteractiveMedia/blob/master/July%2029/Schematic.jpg)

### Close Up of Electronics

![](https://github.com/Megan-J/IntroductionToInteractiveMedia/blob/master/July%2029/MidtermRemix2.JPG)

![](https://github.com/Megan-J/IntroductionToInteractiveMedia/blob/master/July%2029/MidtermRemix3.jpg)
