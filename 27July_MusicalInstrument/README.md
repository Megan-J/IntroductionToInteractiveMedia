# Musical Instrument with Arduino

## Project Description

I created a sound machine using several buttons, a photoresistor, a piezo buzzer, and a servo motor. The blue, red, and green buttons all signal the piezo buzzer to play their specific melodies when pressed. The photoresistor will signal the piezo buzzer to play two different melodies depending on the different values it senses. If the photoresistor is covered by a post-it note and it reads low numbers, the piezo buzzer will play that specific melody. When the user shines a flashlight on the photoresistor, the piezo buzzer then plays a different melody. If the yellow button is pressed, the servo motor will move its arm in a certain way. The servo motor is taped down to the desk so that the arm will move by itself. I created the arm out of cardstock and masking tape. When the arm is on top of the piezo buzzer, the volume of the piezo buzzer seems louder. When the arm is away from the piezo buzzer, the volume of the piezo buzzer is quieter. By pressing the buttons and playing with the photoresistor, anyone can create a fun tune with my sound machine!

The code for the melodies triggered by the green button and photoresistor is inspired by [Professor Shiloh's Tone Melody and Blink without Display tutorial](https://github.com/michaelshiloh/toneMelodyAndBlinkWithoutDelay/blob/master/toneMelodyAndBlinkWithoutDelay.ino) and [Bill Earl's Multi-tasking the Arduino - Part 1](https://learn.adafruit.com/multi-tasking-the-arduino-part-1?view=all).

![](https://github.com/Megan-J/IntroductionToInteractiveMedia/blob/master/27July_MusicalInstrument/instrument.JPG)

## Clever and Tricky

At first, I did not know how to incorporate the servo motor within the sound machine. I did not want to use the item in a percussive way because that segment would end when another button was pressed. When playing with the piezo buzzer, I noticed that the volume of the buzzer seemed to be louder if I covered the hole at the top. Since the servo motor can move back and forth, I decided to use the servo motor as a volume adjuster. The original attachments for the servo motor were too small to effectively cover the hole at the top. I had to create an extension of the original attachments. I needed something strong enough but small enough to fit within that small area of the breadboard. I took a piece of cardstock and cut it similar to a popsicle stick. When I taped the cardstock creation to the attachment for the servo motor, the cardstock was able to reach the piezo buzzer but not heavy enough to properly cover the hole. I cut two more similar looking cardstock pieces and taped it to the end of the original piece. The weight of the masking tape and extra pieces of cardstock helped weigh down the extension and made the piezo buzzer louder. I reinforced the middle of the attachment so the extension would not bend in the middle by adding more masking tape. 

I also had to move some of the wires around to create space for the arm of the servo motor. I used two black wires in order to have GND be on both sides of the breadboard. The servo motor's wires are attached to pin number 9 and the right side of the breadboard. I used a blue wire to connect the piezo buzzer to the Arduino pin so that I would not become confused about which wire connected to the piezo buzzer. 

The red and blue buttons will both play through all the notes in their melodies before moving on to another button. The green button will only play the notes depending on how long the user presses on the button. Once the user releases the button and presses on it again, the melody will start from the first note. This allows the user to only play that note if they press and release quickly. The same can be done for the photoresistor when blocking out most of the light. When the photoresistor recieves a lot of light, it will play the melody. When the light moves away from the photoresistor (ending the melody) and moves back to the photoresistor (starting the melody again), the melody will play the next note in the sequence rather than starting over like the green button and the photoresistor receiving little to no light. 

## Interesting Notes about Problems

For my idea with the servo motor acting as volume control, an issue I originally had was the height difference. The breadboard is flat and the servo motor was taller than the breadboard when both were on the desk. I decided that I needed a base for the breadboard but was unsure of the exact height I needed. I looked around my desk to see what could act as a possible base. Then I remembered that I had stacks of used flashcards in my desk. Flashcards worked the best because I could add more or take away some to make the piezo buzzer flush with the arm of the servo motor. 

I ran out of red wires to connect the buttons to the 5V charged area of the breadboard. I ended up using two white wires instead because the yellow wires were used to connect the buttons to the pins.

I also wanted to use classes for the melodies of different buttons. However, after searching the [Arduino forum](https://forum.arduino.cc/index.php?topic=324374.0#:~:text=If%20you%20have%20two%20arrays,an%20array%20to%20another%20array.), this would mean I needed to copy each item individually from one array to the other. I decided that writing the code for the different melodies and button separately was better. I also understood what each line of code exactly did when differing some actions of buttons from others.


## Schematic

I used the Arduino tutorials page to learn how to draw the [piezo buzzer](https://www.arduino.cc/en/Tutorial/ToneMelody) and the [servo motor](https://www.arduino.cc/en/Tutorial/Knob).

![](https://github.com/Megan-J/IntroductionToInteractiveMedia/blob/master/27July_MusicalInstrument/schematic%20-%20instrument.png)

## Video Links

Because Github can only accept files of a certain size, I had to split up the video into two short video clips. Here is the [first one](https://github.com/Megan-J/IntroductionToInteractiveMedia/blob/master/27July_MusicalInstrument/instrumentVid-Part1.mp4) and this is the [second one](https://github.com/Megan-J/IntroductionToInteractiveMedia/blob/master/27July_MusicalInstrument/instrumentVid-Part2.mp4).

## Close Up of Electronics

![](https://github.com/Megan-J/IntroductionToInteractiveMedia/blob/master/27July_MusicalInstrument/instrument%20-%20top.JPG) 

![](https://github.com/Megan-J/IntroductionToInteractiveMedia/blob/master/27July_MusicalInstrument/instrument%20-%20front.JPG)
