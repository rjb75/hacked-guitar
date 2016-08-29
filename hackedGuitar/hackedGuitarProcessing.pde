/* 
Arduino Drum Machine Processing

Created by Daniel Christopher 10/27/12
Public Domain

Modified by Robert Brown, M3LAB & University of Calgary
http://www.m3lab.org/

*/

import processing.serial.*; //import the Serial library
import processing.sound.*; //import the Sound Library

SoundFile s1; //set the name of the soundfile as "snare"
SoundFile s2; //set the name of the soundfile as "crash"
SoundFile s3; //set the name of the soundfile as "kick"
SoundFile s4; //set the name of the soundfile as "hiTom"

Serial myPort;  // The serial port, this is a new instance of the Serial class (an Object)

int end = 10;    // the number 10 is ASCII for linefeed (end of serial.println), later we will look for this to break up individual messages
String output;   // declare a new string called 'serial' . A string is a sequence of characters (data type know as "char")
char total = 'n';
final boolean debug = true;

void setup() {
  
  size(250,250);
  
  myPort = new Serial(this, "/dev/cu.usbmodemFD1221", 9600); // initializing the object by assigning a port and baud rate (must match that of Arduino)
  
  myPort.clear();  // function from serial library that throws out the first reading, in case we started reading in the middle of a string from Arduino
  output = myPort.readStringUntil(end); // function that reads the string from serial port until a println and then assigns string to our string variable (called 'serial')
  output = null; // initially, the string will be null (empty)
  s1 = new SoundFile(this, "DC120.wav"); //give the name of the sound file and its location in the data folder of the sketch
  s2 = new SoundFile(this, "BC120.wav"); //give the name of the sound file and its location in the data folder of the sketch
  s3 = new SoundFile(this, "EC120.wav"); //give the name of the sound file and its location in the data folder of the sketch
  s4 = new SoundFile(this, "AC120.wav"); //give the name of the sound file and its location in the data folder of the sketch
  
}

void draw() {

  total = 'n';
  while (myPort.available() > 0) { //as long as there is data coming from serial port, read it and store it 
    output = myPort.readStringUntil(end);
  }
    if (output != null) {  //if the string is not empty, print the following
    
    /*  Note: the split function used below is not necessary if sending only a single variable. However, it is useful for parsing (separating) messages when
        reading from multiple inputs in Arduino. Below is example code for an Arduino sketch
    */
    
      String[] a = split(output, ',');  //a new array (called 'a') that stores values into separate cells (separated by commas specified in your Arduino program)
      int total1 = Integer.parseInt(a[0]);
      int total2 = Integer.parseInt(a[1]);
      int total3 = Integer.parseInt(a[2]);
      int total4 = Integer.parseInt(a[3]);
      print(total1); //print total1
      print(",");
      print(total2); //print total2
      print(",");
      print(total3); //print total3
      print(",");
      print(total4); //print total4
      println(",");
      
      if (total1 > 8) {  //if total1 is activated make case a
         total = 'a'; 
      }
      if (total2 > 8) {  //if total2 is activated make case b
         total = 'b'; 
      }
      if (total3 > 8) {  //if total3 is activated make case c
         total = 'c'; 
      }
      if (total4 > 8) {  //if total4 is activated make case d
         total = 'd'; 
      }
      
      print("case"); 
      print(total);      //broadcast which case it is
      println(",");
      
      switch(total) {
         case 'a':      //if case a play s1
         s1.play();     //play s1
         s1.amp(0.095); //volume of s1
         delay(300);
         break;
         case 'b':      //if case b play s2
         s2.play();     //play s2
         s2.amp(6);     //volume of s2
         delay(275);
         break;
         case 'c':      //if case c play s3
         s3.play();     //play s3
         s3.amp(2.75);  //volume of s3
         delay(300);
         break;
         case 'd':      //if case c play s4
         s4.play();     //play s4
         s4.amp(1.75);  //volume of s4
         delay(300);
         break;
         case 'n':      //n is the default case if none of the sensors are activated
         break;         // if case is n do nothing
      }
    }
}