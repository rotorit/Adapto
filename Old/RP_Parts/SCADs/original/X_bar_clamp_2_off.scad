// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/

l=32;// length
b=16;// breadth
t=4;// wall thickness

use <bolt.scad>;
include <configuration.scad>;

module xBarClamp(){
	difference(){
		union(){
			translate([-t-smoothRod/2, 0, 0]) cube([l, b, b]);
			cylinder(r=t+smoothRod/2, h=b);
		}
		translate ([0,0,-1]) {
			cylinder(r=smoothRod/2, h=b+2);
			translate([-3/2, 0, 0]) cube([3, b+1, b+2]);
		}
		translate([-t-smoothRod/2, b-(b-smoothRod/2)/2, b/2]) boltWasher("x-");
	}
}

xBarClamp();