//  Box for Pedal Pause
//  Holds an arduino micro and a 1/4" jack
//
//  Box
//  feet
//  lid
//  reset switch access hole
//  micro usb access hold
//  1/4" jack hole
//  



$fn=80;

A = 55.0;  // width
B = 30.0;  // height
D =  3.0;  // wall thickness

E = 48.5;  // length of Arduino Micro
F = 18.5;  // width of Arduino Micro
G =  1.5;  // lip for support
H = 10.0;  // height of supports
I =  1.5;  // height of connector from bottom of board
J =  3.5;  // height of micro USB connector
K =  9.0;  // width of micro USB connector

L =  9.6;  // diameter of 1/4 jack mount
M =  1.9;  // thickness of Arduino Micro PC board

C = E+2*D;  // depth

union() {
  difference() {
    cube([A, C, B]); // solid box
    translate([D, D, D]) { cube([A-2*D, C-2*D, B]); } // hollow out box
    translate([D + (F-K)/2, C-2*D, H+D+I]) { cube([K, 3*D, J]); } // usb hole
    translate([D, C-D, H+D]) { cube([F, I, M]); } // notch for pc into side wall
    translate([0.70*A, 2*D, B/2]) { rotate([90, 0, 0]) { cylinder(h=3*D, r = L/2); }} // hole for jack
    translate([D/2, D/2, B-D]) { cube([A-D, C, D/2]); } // groove for lid
    translate([D, C-2*D, B-D]) { cube([A-2*D, 3*D, D]); } // remove back of groove
  }

  translate([F+D, 0, D])   { cube([D, C, G+H]); } // divider
  translate([D, C-D-G, D]) { cube([F, G, H]); } // support 1
  translate([D, D, D])     { cube([F, G, H]); } // support 2


}


