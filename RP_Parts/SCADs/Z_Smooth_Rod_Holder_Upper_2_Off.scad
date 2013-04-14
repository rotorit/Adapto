// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/

include <configuration.scad>;
use <bolt.scad>;

$fn=99;
thickness=6;// thickness of single wall parts
smoothRodOffset=14;// how far the centre of the z smooth rods are from the frame

ZUpper();

module ZUpper(){
	difference(){
		union(){
			cube([80, thickness, 50]);
			translate([0, -30, 0]) cube([80, 30, thickness]);
			//translate([40-max(frameX, 20)/2, 0, 0]) cube([max(frameX, 20), thickness, 80]);
			hull(){
				translate([40-max(frameX, 20)/2, -smoothRodOffset, 0]) cube([max(frameX, 20)+0*(smoothRod+2*thickness), smoothRod/2+smoothRodOffset, 17+thickness]);
				translate([40, -(smoothRodOffset), 0]) cylinder(r=smoothRod/2+thickness, h=17+thickness);
				translate([40-max(frameX, 20)/2, -30, 0]) cube([max(frameX, 20), 30, thickness]);
			}
		}
		translate([frameX/2, 0, thickness+frameY/2]) boltWasher("y-");
		translate([80-frameX/2, 0, thickness+frameY/2]) boltWasher("y-");
		translate([80/2, 0, 50-frameX/2]) boltWasher("y-");
		//translate([80/2, 0, 80-frameX/2]) boltWasher("y-");

		translate([0, 0, -1]) rotate([0, 0, -90-45]) cube([99, 99, thickness+2]);
		translate([80, 0, -1]) rotate([0, 0, -90-45]) cube([99, 99, thickness+2]);
		translate([30, -1, 50]) rotate([0, -90-45, 0]) cube([99, thickness+2, 99]);
		translate([50, -1, 50]) rotate([0, 90-45, 0]) cube([99, thickness+2, 99]);

		translate([40, -smoothRodOffset, -1]) cylinder(r=smoothRod/2, h=17+thickness+2);
	}
}