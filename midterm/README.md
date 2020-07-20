
# Creating a Game with Sound and Video!

**Inspiration** 

My inspiration for this game was a mixture of [Fireboy and Watergirl](https://www.coolmathgames.com/0-fireboy-watergirl-5-elements) and the background image on my phone. Fireboy and Watergirl include two characters jumping around the screen while helping each other escape from the room. I remember from my last project that I wanted to incorporate elements from this computer game but could not figure out how. After viewing how some of my classmates were able to incorporate moving with gravity within their games during class, I knew that there was a solution to my previous issue. I could create a game that included a character that could travel across the screen while implementing real life values such as gravity. My phone’s lock screen is an image of an art installation at the San Francisco Museum of Modern Art called [Far Out](https://www.sfmoma.org/exhibition/far-out-suits-habs-and-labs-for-outer-space/). Since the exhibit included many astronaut suits and artists’ depictions of them, I wanted to incorporate astronauts and space within my game. 

In my game, the character that represents the player is a tiny astronaut. He or she has to face the strange creatures of the foreign planet such as zombie alien astronauts and UFOs. Not only are there strange creatures, but there are also falling asteroids. The player must protect their area of the screen by touching the asteroids, zombie alien astronauts, and UFOs. If the player lets one pass them onto the other edge of the screen, then the game ends and offers for the player to try again by clicking the screen. 

I got further inspiration for my drawings by doing a quick Google search. I used these three images to help me design my own sprites!

![](https://github.com/Megan-J/IntroductionToInteractiveMedia/blob/master/midterm/Sprite%20Alien.jpg)

![](Sprite Astro.png)

![](Sprite UFO.png)

**Rules**

* I wanted to use classes. Previously, I used functions to organize everything in the main tab. The issue with this method is that the main tab can get very long and I lose track of what I want to change. For this project, I created multiple classes for the player, background objects, asteroids, zombie aliens, UFOs, and score. I was able to know where everything in the program was based on the class names and the function that I was looking for. Another way to find specific names or functions is typing <CMD> or <CTRL> f and I can type what I’m looking for in that feature. Processing will find words that match what I typed exactly and will lead me to its location.

* Video and sound must be both included. I wanted to see how video and sound could be incorporated within a game like mine in Processing. Since the draw loop continues to loop, I was first confused about where I could put a video in. I eventually decided that I wanted to incorporate the video at the end of the game, during the game over screen. I created my own stop motion video with drawings and it worked! Calling it during the game over screen covered the previous screen of the game and I coded text on top of it. I had to make sure that the sound from the player moving did not play during the video so I used the Processing resources page to figure out how to stop sound for a while. The pause() function really helped. 

*There must be a scoring system that is controlled by the player’s interaction with other objects. I had to account for the collision of the player’s character and the character of the zombie alien, UFO, or asteroid. It was really difficult to do. I pulled out a notebook and started sketching what an interaction between the two would look like. I began with inequalities and transferred what I wrote in my notebook to the code. I used an if statement and included my inequalities within the condition. If the player was in the vicinity of the enemy character, then the score increased by one and the enemy character moved off the screen. 

**Difficulties**

In the beginning, I was trying to respawn the enemies off the screen once the player touched the enemy. The character would touch the enemy and the enemy would be gone, but it would not come back. I was confused at first. I printed the x-coordinate of the enemy to see where it had gone. The x-coordinate would decrease a little (to move across the screen) but then it increased! I was stuck. I posted my problem within the Slack channel for this class and continued to stare at my code. I realized that the boolean never changed back to its original value. Because the function that changed the enemy’s x-value depended on the boolean, the x-value continued to be set at the x-value that was indicated within the function. 

I also could not determine the correct scale ratio for my images. I would keep guessing and checking but the numbers would never make the image look like how I drew them. I discovered that my computer had a built in photo resizing feature that allowed me to see the aspect ratio. I typed the number of pixels I wanted the width to be and the feature showed me what the height of my drawing would be. 

**Interesting Notes**

I discovered that looking at the downloaded Libraries and examples in Processing is incredibly helpful. Almost always, they are well commented on and are easy to understand. I used the examples to help me understand what was happening with the audio and video files. 

I used [soundbible.com](http://soundbible.com/) for all my noises in the game. I used “Bleep Sound” and “Mario Jumping Sound” by Mike Koenig and “Jump Sound” by snottyboy. The font I used within the game is called 222 03 from 1001.fonts.com

![](midterm-pic.png)
