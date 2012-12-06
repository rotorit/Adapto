// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/

include <configuration.scad>;

$fn=99;// wild guess
thickness=6; // wall thickness
length=40;
height=24;// length of linear bearing
lmuuDiameter=15;// outer diameter of linear bearing, lm8uu is 8x15x24mm, lm10uu is 10x19x29mm

difference(){
	union(){
		cube([length, thickness, height]);
		translate([length/2, -lmuuDiameter/2-0*thickness+2, 0]) cylinder(r=lmuuDiameter/2+thickness, h=height);
	}
	translate([length/2, -lmuuDiameter/2-0*thickness+2, -1]) cylinder(r=lmuuDiameter/2, h=height+2);
	translate([-1, thickness, -1]) cube([length+2, thickness, height+2]);
	translate([4, -1, height/2]) rotate([-90, 0, 0]) cylinder(r=3/2, h=thickness+2);
	translate([length-4, -1, height/2]) rotate([-90, 0, 0]) cylinder(r=3/2, h=thickness+2);
	translate([4, -1, height/2]) rotate([-90, 0, 0]) cylinder(r=m3_nut_diameter_bigger/2, h=2+1, $fn=6);
	translate([length-4, -1, height/2]) rotate([-90, 0, 0]) cylinder(r=m3_nut_diameter_bigger/2, h=2+1, $fn=6);
	translate([length/2-1, -2*lmuuDiameter, -1]) cube([2, 2*lmuuDiameter, height+2]);
}