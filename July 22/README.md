# Creative Lights

## **Inspiration**

My inspiration for this project mainly came from an article by [Bill Earl](https://learn.adafruit.com/multi-tasking-the-arduino-part-1?view=all). He described how to run multiple LEDs at once using Arduino. Since I wanted to use two different LEDs in my breadboard, looking at his instructions and code was very helpful. I was also inspired by the [different examples from Arduino](https://www.arduino.cc/en/Tutorial/BuiltInExamples) that came with the instillation. I was very unsure what I could do with this new program and these tools. Loading different examples and running them to see what they would do on my Arduino Uno helped me understand the differences between Arduino and Processing. 

Other inspiration came from my own organization system. I like to color code folders and documents to separate them from each other. Because the Arduino Uno has so many different wires and LEDs, I chose to differing colors to signify different uses. The red wires all connect to 5V, the black wires connect to GND, the yellow wires connect from the analog pins to the breadboard and the white wires connect the digital pins to the breadboard. I chose two different colored LEDs to remember which LED performed which action. 

![](https://github.com/Megan-J/IntroductionToInteractiveMedia/blob/master/July%2022/Birds-eye%20view.JPG)

## **Rules**

* Have two LEDs. The project did not require two LEDs, only a single LED and the LED light on the Arduino Uno. However, I wanted to try my hand at something challenging. I divided my breadboard across the middle, horizontally, and put one green LED on a side and the blue LED on the other. I really liked how my circuit turned out and how it is very obvious to see what happens to each light depending on the switch or photoresistor. 

* See what the photoresistor is doing with the LED. When the photoresistor was introduced in class, I became very curious about it. A small device that senses movement by reading how much light shines on it. I coded the photoresistor to print the numbers of the light that it currently collected. I uploaded the program and started to place my finger over the photoresistor. I wanted to know the full range that the device printed. When my finger was over the device, the number was about 390. The highest the photoresistor printed was 900 when I shined a flashlight on it. I divided the range between four sections and used that to change the amount of brightness the LED had. 

## **Difficulties**

* Understanding the circuit. When I worked closer with the Arduino Uno, I was confused how people knew where to place certain items and why it worked. I understood once I read about breadboard and how everything underneath the surface can have a charge if a wire is connected to it in a certain direction. Thinking about the layout of the metal strips within the breadboard was definity helpful when working with the Arduino. 

* A similar dificulty to the one mentioned above is setting up the circuit. Sometimes, I did not know if what I had coded worked because of a coding error or a circuit setup error. When looking closer at my breadboard, I often lined up the wires wrong and so the connection between the LED and wire attached to the Arduino was never established. A way to get around this issue is by looking at the LED in the Arduino. However this method does not work for both LEDs in my breadboard, only the one with the pin closest to 13. 

## **Interesting Notes**

I really do like working with the Arduino because it is a tangible object rather than something behind a screen. However, I found that some resistors can fit by pressing on the middle bit and others work better by pushing the ends in separately. Also, while loops only work well if the circuit only has one LED. When working with the programming window in Arduino, I realized that the loop would always stop at the while loop and never get to my other code for the other LED.  
