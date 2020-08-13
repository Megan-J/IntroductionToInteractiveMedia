## Creative Collaboration

![](https://github.com/Megan-J/IntroductionToInteractiveMedia/blob/master/finalProjectSummer2020/Title%20photo.JPG)

Have you ever wanted to create something in collaboration with an autonomous robot? This project allows you to control the look and feel of the overall art piece while working with the always roaming robot! Flip the switch, change the lighting, turn the potentiometer or knob, or yell near the computer's microphone to change anything about the piece. Make sure to save it and show all your friends!

### Clever and Tricky

Coming up with a viable idea was probably the most challenging task of this entire project. The input from the Arduino limited the amount of things that I wanted to create with the robot and Processing. When we were first presenting in class our initial ideas, my professor mentioned the project could be viewed as a collaboration between the robot and I. This statement changed my entire mindset of what I could create for this project. I decided to make the robot have the ability to move without user input so the user could feel like he or she would be truly working with another being. 

Originally, I wanted the robot's path to be tracked and drawn on the Processing window. However, thinking about the tools and options I had, I could not truly track the position of the robot at every second. I decided to have a LED turn on every time the robot turned to the right. Even though I thought this was the solution to my problem, it wasn't. I was using a RGB LED, which means that the LEDs would be on and that Processing could not receive the information if the LEDs's values since they would all be on. I decided to look at things from another angle. The robot would reverse if the Ultrasonic sensor read a value that was 10 or less. The reversing and turning happened in the same section so I could just input that same code within processing. The Ultrasonic sensor would send its reading to Processing. I wrote a simple loop to determine if the information from the Ultrasonic sensor was less than 10 then the circles movement would reverse. This would mean when the robot reverses, the circles would too. If the robot moved forward, the circles would move the same way it did. 

Since I was working with unfamiliar code such as sound frequency and a visual output, I was very confused at first. The examples within Processing about creating waves to represent volume and bars to represent FFT helped but I was still confused how to alter them to fit my needs. I found that writing the code in my notebook and trying to describe what the code was doing allowed me to understand the code and alter it to fit my project needs. For this project, I found myself sketching visuals and writing notes kept me on track. I made several checklists and bug checklists to prioritize what parts of my project I needed to complete. 

!()[https://github.com/Megan-J/IntroductionToInteractiveMedia/blob/master/finalProjectSummer2020/Screen%20Shot%202020-08-12%20at%204.06.04%20PM.png]

### Problems

For all my problems, I found that keeping note of them on paper encouraged me to keep working until they were solved. 

A large issue was trying to figure out how to connect the Arduino to Processing. I knew that I had to print the information in the serial monitor, but I did not know how to split the information up into different variables for different. I finally figured it out by looking at an example in the Arduino built-in example tab. Once I solved this issue, I realized that NaN (not a number) showed up in the array and disrupted the intended values of the variables. I opened the serial monitor in Arduino to figure out what was happening. It turns out that I did not use println (print the information in a new line) in the correct line of code, which made Arduino send the information in the wrong format. 

### Schematic

![](https://github.com/Megan-J/IntroductionToInteractiveMedia/blob/master/finalProjectSummer2020/finalSchematic.jpg)

The small text next to the device connected to pin A3 is potentiometer.

### Close Up of Electronics

![](https://github.com/Megan-J/IntroductionToInteractiveMedia/blob/master/finalProjectSummer2020/close%20up.JPG)

![](https://github.com/Megan-J/IntroductionToInteractiveMedia/blob/master/finalProjectSummer2020/close%20up%202.JPG)

![](https://github.com/Megan-J/IntroductionToInteractiveMedia/blob/master/finalProjectSummer2020/angle.JPG)

![](https://github.com/Megan-J/IntroductionToInteractiveMedia/blob/master/finalProjectSummer2020/angle%202.JPG)

![](https://github.com/Megan-J/IntroductionToInteractiveMedia/blob/master/finalProjectSummer2020/wires.JPG)

![](https://github.com/Megan-J/IntroductionToInteractiveMedia/blob/master/finalProjectSummer2020/bottom.JPG)

I used almost all the wires in my kit except one! That's why there are so many different colors. I placed black or red tape over the wires that connected to GND or 5V respectively. I also used zip ties to hold the wires corresponding to the same sensor together so they would go all over the breadboard.

### Link to Video

https://youtu.be/4ARizJJMio0

