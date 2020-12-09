# DecimalToBinaryGame
Game Design for Basys3 board


Uploading the bitstream to your Basys3 board will allow you to play a game

<li><h2>Instructions</h2>
<ul>- The game is played by inputting a binary number to match the random decimal number on the 7 segment display. </ul>
<ul>- The decimal number is pseudo random (clock based) that ranges from 0 to 99, so the “Answer” input goes up to 6 bits.</ul> 
<ul>- To input the answer, one must press the indicated button to confirm the positions of the switches. </ul> 
<ul>- The scoreboard starts by lighting the 0th LED, then counts in a unary way to light up 6 LEDs; there are 5 rounds in total. </ul> 
<ul>- To get to the next round, the corrected answer must be submitted. </ul> 
<ul>- If an incorrect answer is submitted, the displayed number changes, but the game progress isn’t lost (i.e. if you are on round 3, you stay on round 3, even if your answer is wrong). </ul> 
<ul>- After getting to the end, LEDs 6, 7, and 8 start to blink, as a congratulatory message. </ul> 
<ul>- There is also a reset switch that returns the player to round 0. The reset can be used during any point of the game to return to round 0 / the initial state.</ul>  </li>

<li> <h2> Controls </h2>
<ul>- Reset Switch is number 15</ul> 
<ul>- Switches 5 (MSB) to 0 (LSB) are used to input answer</ul> 
<ul>- Center Button is used to submit answer (BTNC [U18]) </ul> </li>
