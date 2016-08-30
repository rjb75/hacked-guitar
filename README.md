![Materials Needed]
(http://i.imgur.com/8x1fw64m.jpg)
# About the Project
Engage in a new musical compositional experience using capacitive touch sensors to trigger pre-recorded loops. This contains our open-source arduino code, processing sketch, and some pre-recorded wav files for such a project.

The hacked guitar is a project aimed at bringing code to life. As part of M3Lab we are actively participating and designing new pedagogies and experiences for engaging learners in meaningful, public, and open-source coding opportunities. We utilize art, as defined by Dewey (1934) as “A process of doing or making” (p. 48), to engage and enrich real-life learning opportunities. This specific project was part of a larger interactive musical performance initiative, which employed and demonstrated various forms of coding (like the hacked guitar), live musicians, computer simulations, and public feedback that took place at the University of Calgary. Stay tuned for more ideas from the future.

For more information check out our [Instructables Guide](http://www.instructables.com/id/Hacked-Guitar/)

# Getting Started
Once you have downloaded the Arduino IDE and Processing, open the Example files from Github.

1. Open the Arduino IDE and open the Arduino_Sketch.ino file in the Arduino_Sketch folder
2. In your browser go to https://github.com/arduino-libraries/CapacitiveSensor/zipball/master and download the Capacitive Sensor library.
3. Back in the IDE select Sketch in the toolbar then Include Library then Add .ZIP Library… and locate the zip file that you downloaded
4. Next find the IDE’s toolbar and select the tools dropdown, then port and find the Arduino Board
5. Once you have found the board write down the port and select it
6. You can now upload the sketch to the Arduino using the Upload button

Once the sketch is uploaded close the Arduino IDE and open up Processing

1. Open the hackedGuitarProcessing.pde file in the hackedGuitarProcessing folder
2. Take the port that you had written down before and put it into the programing inside the Port Name Here brackets
  `myPort = new Serial(this, "Port Name Here", 9600);`
3. Run the Program

After you have completed the setup steps, save the Processing code so you don’t need to do anymore editing.

#Advanced Steps
Check out our Wiki for other tutorials for this project

* [Adding/ Changing Sounds](http://github.com/rjb75/hacked-guitar/wiki/Changing-the-Sounds)
