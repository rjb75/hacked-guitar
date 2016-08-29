#include <CapacitiveSensor.h>

/*
/*
 * hackedGuitarArduinoSketch
 * Robert Brown, M3Lab & University of Calgary
 * http://www.m3lab.org/
 * 
 * Requires CapacitiveSensor Library by Paul Badger - http://playground.arduino.cc/Main/CapacitiveSensor
 * 
 * Brief Instructions (Find More Online)
 * 
 * Connect Jumper from pin 2 to Positive Power terminal on Breadboard
 * Add 1m 5% resistors between the Positive Power and a horizontal breadboard row
 * Next in line on the row with the resistor add a jumper (this will be your sensor for now)
 * After the jumper add another jumper back to the Arduino (use pins 6,6,8,10)
 * Change the Serial Port in the Processing Code
 * Run the program
 * 
 * You can add other conductive materials to your jumper to make a bigger sensor
 * 
 */


CapacitiveSensor   cs_2_4 = CapacitiveSensor(2,4);        // button 1 - output is total1
CapacitiveSensor   cs_2_6 = CapacitiveSensor(2,6);        // button 2 - output is total2
CapacitiveSensor   cs_2_8 = CapacitiveSensor(2,8);        // button 3 - output is total3
CapacitiveSensor   cs_2_10 = CapacitiveSensor(2,10);      // button4 - output is total4
void setup()                    
{
   Serial.begin(9600);
}

void loop()                    
{
    long total1 =  cs_2_4.capacitiveSensor(1);
    long total2 =  cs_2_6.capacitiveSensor(1);
    long total3 =  cs_2_8.capacitiveSensor(1);
    long total4 =  cs_2_10.capacitiveSensor(1);

    Serial.print(total1, DEC);  // print value of total1 in serial for processing to read
    Serial.print(",");
    Serial.print(total2, DEC);  // print value of total2 in serial for processing to read
    Serial.print(",");
    Serial.print(total3, DEC);  // print value of total3 in serial for processing to read
    Serial.print(","); 
    Serial.print(total4, DEC);  // print value of total4 in serial for processing to read
    Serial.println(",");
}
