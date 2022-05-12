//  lid for Pedal Pause
//
//  lid
//  


$fn=80;

A = 55.0;  // width
B = 30.0;  // height
D =  3.0;  // wall thickness

E = 48.5;  // length of Arduino Micro
C = E+2*D;  // depth

union() {
  cube([A-(D), C-D/2, 0.70*D/2]); // solid box
}


