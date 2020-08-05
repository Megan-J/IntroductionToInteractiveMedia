## Updated Project Idea

### Project Description

After watching everyone presentations, I was inspired to make an interactive art piece using Processing and Arduino. I would create a robot that responds to stimuli using the Arduino. Any alteration to the robot would alter the type of art piece that is displayed on the Processing window. I was inspired by [Aaron Sherwood's Mandala 0.4.2](http://aaron-sherwood.com/works/mandala/) to have a shape follow the movement of the robot. I would encase the robot within a box that is scaled to be similar to the Processing canvas. This idea was inspired by [Zach Lieberman's Reflection Studies](https://www.instagram.com/p/BK_RCqihXxv/). Users could interact with the piece by adding more walls or shinning flashlights. I want the robot to have the same features of an animal in which it will not hit any walls, make noises, and possibly flash lights. 

If able, I also want the user to be able to control where the robot moves. I would create another Processing canvas to be the control center. The user could click if they wanted the robot to move autonomously or based off of controls from them.

### Materials

* Sparkfun board
* Arduino and breadboard
* Hobby Gearmotors
* Ultrasonic Sensor
* Motor Driver
* Wheels
* Photoresistor
* Piezo buzzer
* Trimpot
* Battery holder
* Cardboard
* Plastic
* LEDs

### Riskiest Part

I think the riskiest part is having the Arduino transfer its location to Processing. I'm not entirely sure how to solve this problem yet or if it can be done. I'm thinking of using the robot's Ultrasonic senor to input how many centimeters it is away from one wall and give Processing that value for the beginning x-coordinate or y-coordinate. However, this solution does not tell Processing from which wall the robot is facing. I may just have to randomize from which direction the user would begin with. I will try to tackle this task first because this will determine what the art piece could look like and allow me to see what changes I could make to the overall project early on in the process.
