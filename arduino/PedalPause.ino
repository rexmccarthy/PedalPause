// -----------------------------------------------------------------------------------------------
// Copyright (c) 2014, 2022 Rex John McCarthy
//
//
//
// This software reads a foot switch and generates a pause key press using the
// USB Keyboard and Mouse Library
// ------------------------------------------------------------------------------------------------

#include <Keyboard.h>
const int enablePin = 5;
const int pedalPin = 7;
const int tipPin = 6;
const int gndPin = 4;

void setup() {
  
  pinMode(gndPin, OUTPUT);
  digitalWrite(gndPin, LOW);
  pinMode(enablePin, INPUT_PULLUP);
  pinMode(pedalPin, INPUT_PULLUP);
  pinMode(tipPin, INPUT_PULLUP);

  if (isEnabled()) {
    Keyboard.begin();
  } else {
    Serial.begin(9600);
    while (!Serial) {}
    Serial.println("PedalPause V1.0");
  }
}

static bool isEnabled() {
  return digitalRead(enablePin) == LOW;
}

void loop() {
  delay(100);
  static int pedalState = digitalRead(pedalPin);
  
  int newPedalState = digitalRead(pedalPin);
  if (pedalState != newPedalState) {
    if (pedalState == LOW) {
      if (isEnabled()) {
        Keyboard.press(0x81);  // KEY_LEFT_SHIFT
 //       Keyboard.press(0x83);  // KEY_LEFT_GUI
 //       Keyboard.press('2');
        Keyboard.press(0xCD);  // F12
        delay(100);
        Keyboard.releaseAll();
      } else {
        Serial.println("pressed");
      }
    } else {
      if (isEnabled()) {
      } else {
        Serial.println("released");
      }
    }
  }  

  pedalState = newPedalState;

}
