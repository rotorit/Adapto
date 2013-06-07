// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/

// A motor holder for a nema17 stepper motor
// these are 1.7 inches (ugh) square, any length and have 4 M3 holes in a 31mm square centre-centre
// based on https://github.com/rotorit/Adapto/blob/master/RP_Parts/STLs/Z_Motor_Holder_2_Off.stl
// The 17HS8401 is 48mm tall from base to screw mounting holes. 
// These holes are 4.8mm deep so a thickness of 6-7mm is good for M3x10 mounting screws
// Plain M3 washers are .4-.6mm thick (?)

include <configuration.scad>;
use <bolt.scad>;

$fn=99;
thickness=6;// thickness of wall parts
width=31+3+thickness*2;

// zMotor2();
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

// alternative minimal Z motor mount
// Designed by t00tie
// NOTE! I have not checked whether this is compatible with the existing X ends, use at your own risk (test and report back please!)
// You could make an even smaller version by only fixing the motor with 2 screws
// You want this to fit so that the feet and the Z motor are both touching the table at the same time
module zMotor2(){
difference(){
	union(){
		//translate([0, -width/2, 0]) cube([70, width, thickness]);
		translate([0, -width/2-2*thickness, 0]) cube([thickness, width+4*thickness, 2*thickness]);
		translate([0, -width/2, 0]) cube([6+thickness, width, thickness]);
		translate([6+thickness, 31/2-3/2-0*thickness, 0]) cube([31, 3+1*thickness, thickness]);
		translate([6+thickness, 31/2, 0]) cylinder(r=3/2+thickness, h=thickness);
		translate([6+thickness+31, 31/2, 0]) cylinder(r=3/2+thickness, h=thickness);
		translate([6+thickness, -31/2, 0]) cylinder(r=3/2+thickness, h=thickness);
	}
	// holes for the motor screws
	translate([6+thickness, 31/2, -1]) cylinder(r=3/2, h=thickness+2);
	translate([6+thickness+31, 31/2, -1]) cylinder(r=3/2, h=thickness+2);
	translate([6+thickness, -31/2, -1]) cylinder(r=3/2, h=thickness+2);
	// holes to attach to the frame. These are centered 6mm above the motor => 
	// 6+48=54mm over the table is half way up the side of the Y frame -> |X|
	translate([-1, 31/2+2*thickness, thickness]) rotate([0, 90, 0]) cylinder(r=5/2, h=thickness+2);
	translate([-1, -31/2-2*thickness, thickness]) rotate([0, 90, 0]) cylinder(r=5/2, h=thickness+2);
}}

module screwHole(){
	translate([12+thickness, 31/2, -1]) cylinder(r=3/2, h=thickness+2);
	translate([12+thickness+11, 31/2, -1]) cylinder(r=3/2, h=thickness+2);
	translate([12+thickness, 31/2-3/2, -1]) cube([11, 3, thickness+2]);
}
