// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/

// A motor holder for a nema17 stepper motor
// these are 1.7 inches (ugh) square, any length and have 4 M3 holes in a 31mm square centre-centre
// based on https://github.com/rotorit/Adapto/blob/master/RP_Parts/STLs/Z_Motor_Holder_2_Off.stl

include <configuration.scad>;
use <bolt.scad>;

$fn=99;
thickness=7;// thickness of wall parts
width=31+3+thickness*2;

zMotor();

module zMotor(){
difference(){
	union(){
		translate([0, -width/2, 0]) cube([70, width, thickness]);
		translate([0, -width/2, 0]) cube([thickness, width, 3*thickness]);
	}
	// 4 holes for the motor screws
	screwHole();
	translate([31, 0, 0]) screwHole();
	translate([31, -31, 0]) screwHole();
	translate([0, -31, 0]) screwHole();
	// holes to attach to the frame
	translate([thickness, width/2-thickness, 2*thickness]) boltWasher("x+");
	translate([thickness, -width/2+thickness, 2*thickness]) boltWasher("x+");
	// hole for the motor shaft and z coupler
	translate([12+thickness+12, 0, -1]) cylinder(r=12, h=thickness+2);
	translate([12+thickness+12+31-12-3/2, 0, -1]) cylinder(r=12, h=thickness+2);
	translate([12+thickness+12, -12, -1]) cube([31-12-3/2, 24, thickness+2]);
}}

module screwHole(){
	translate([12+thickness, 31/2, -1]) cylinder(r=3/2, h=thickness+2);
	translate([12+thickness+11, 31/2, -1]) cylinder(r=3/2, h=thickness+2);
	translate([12+thickness, 31/2-3/2, -1]) cube([11, 3, thickness+2]);
}
