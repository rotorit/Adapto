// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

// This is rather quick'n'dirty but the upper and lower are so similar it's smart
use <./zUpper_x2.scad>

zLower();

module zLower(){

	difference() {
	
		union(){

			// import zUpper without the smooth rod lock screw
			zUpper(lockhole=false);

			// add bottom mounting tab
			translate([40-max(frameX, 20)/2, -40, 0])
				cube([max(frameX, 20), 20, thickness]);
			translate([40, -40, 0])
				polycyl(d=max(frameX*2, 40)/2, h=thickness);

			// cover upper tab mount hole so we can create a new one a little lower
			translate([40-max(frameX, 20)/2, 0, 35])
				cube([max(frameX, 20), thickness, 10]);

		}// end union

		// chop the sides off the zUpper model
		translate([-1, -50, -1])
			cube([1+40-max(frameX, 20)/2, 100,100]);
		translate([40+max(frameX, 20)/2, -50, -1])
			cube([31, 100,100]);

		// add bottom mounting tab hole
		translate([40, -40, -1])
			polyhole(d=M5, h=thickness+2);

		// add upper mounting tab hole
		translate([40, thickness+1, 32])
			rotate([90,0,0])
			polyhole(d=M5, h=thickness+2);

		// remove excess upper mounting tab material from zUpper
		translate([29, thickness+1, 32])
			rotate([90,0,0])
			mountCurve();

	}// end difference

}

// creates a half arc negative block to remove excess upper mounting tab material from zUpper
module mountCurve(){
	difference(){
		translate([0,0,0])
			cube([max(frameX, 20)+2, 20, thickness+2]);
		translate([max(frameX, 20)/2+1,0,-1])
			polycyl(d=max(frameX*2, 40)/2, h=thickness+4);
	}// end difference
}