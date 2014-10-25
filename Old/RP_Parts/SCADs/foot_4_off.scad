// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/

h=80;// height
b=65;// breadth
t=5;// wall thickness

use <bolt.scad>;
include <configuration.scad>;

// foot() is a copy of rotorits original stl
// foot2() is a smaller version designed to save plastic and fit under the frame
// leave as is <foot();> if you want the original foot or type <foot2();> if you want the small plastic saver foot

foot();


module foot2(){
// This foot is intended to be underneath the frame
// The height is designed som standard 48mm tall Z motors will sit on the table
// 54mm over the table is half way up the side of the Y frame -> |X|
// ref. Z motor holder
$fn=99;
difference(){
	union(){
		cube([2*frameX, frameX, t]);
		cube([frameX, 2*frameX, t]);
		hull(){
			cube([2*frameX, t, t]);
			translate([0, 0, 54-t-frameY/2]) cube([frameX, t, t]);
		}
		hull(){
			cube([ t, 2*frameX,t]);
			translate([0, 0, 54-t-frameY/2]) cube([t, frameX, t]);
		}
	}
	// bolt holes
	translate([frameX/2, frameX/2, 0]) boltWasher("z-");
	translate([frameX/2, 3*frameX/2, 0]) boltWasher("z-");
	translate([3*frameX/2, frameX/2, 0]) boltWasher("z-");
}}


module foot(){
difference(){
	cube([b, b, t]);
	translate([b, 25, -t]) rotate([0, 0, 45]) cube([2*b, 2*b, 3*t]);
	translate([boltOffset+t, boltOffset+t, 0]) boltWasher("z-");
	translate([boltOffset+t, b-10, 0]) boltWasher("z-");
	translate([b-boltOffset, boltOffset+t, 0]) boltWasher("z-");
}

difference(){
	cube([b, t, 25]);
	translate([b-boltOffset, -t, boltOffset+t]) boltWasher("y-");
}
translate([0, 0, 25]) difference(){
	cube([b-10, t, h-25]);
	translate([15, -t, h-25]) rotate([0, 55, 0]) cube([h, 3*t, h]);
}

difference(){
	cube([t, b, 25]);
	translate([-t, b-boltOffset, boltOffset+t]) boltWasher("x-");
}
translate([0, 0, 25]) difference(){
	cube([t, b-boltOffset, h-25]);
	translate([-t, 15, h-25]) rotate([-55, 0, 0]) cube([3*t, h, h]);

}}