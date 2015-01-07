// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/


// This is rather quick'n'dirty but the upper and lower are so similar it's smart
use <Z_Smooth_Rod_Holder_Upper_2_Off.scad>;

include <configuration.scad>;
use <bolt.scad>;
thickness=6;

difference() {
	union(){
		ZUpper();
		translate([40-max(frameX, 20)/2, -50, 0]) cube([max(frameX, 20), 50, thickness]);
		translate([40-0*max(frameX, 20)/2, -50, 0]) cylinder(r=max(frameX, 20)/2, h=thickness);
	}
	translate([-1, -50, -1]) cube([1+40-max(frameX, 20)/2, 100,100]);
	translate([40+max(frameX, 20)/2, -50, -1]) cube([31, 100,100]);
	translate([40-0*max(frameX, 20)/2, -50, thickness]) boltWasher("z+");
}

