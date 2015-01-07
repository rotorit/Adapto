// Copyright (C) 2013 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/

include <configuration.scad>;
use <bolt.scad>;

$fn=99;
thickness=6;// thickness of wall parts
width=frameX;// should we just use frameX directly?
// 608 bearing: 8mm ID, 22mm OD, width 7mm
// 624 bearing: Inner Diameter: 4mm Outer Diameter: 13mm Width: 5mm
// M8 washers are up to 2mm thick
inner=2*7+2*2;// 2 608+2 washers

// original (2 lines)
//mirror([ 0, 1, 0 ]) yIdler();
//translate([0, width, 0]) yIdler();

// t00ties new version,
yIdlerBlock();
translate([-33, 0, 0]) yIdlerHolder();// this is printed upside down

module yIdler(){
difference(){
	union(){
		cube([width/2, width, thickness]);
		translate([-thickness, 0, 0]) cube([thickness, width, width]);
		translate([-width, 0, 0]) cube([width, thickness, width]);
		translate([width/2, width/2, 0]) cylinder(r=width/2, h=thickness);
	}
	translate([width/2, width/2, -1]) cylinder(r=smoothRod/2, h=thickness+2);
	// holes to attach to the frame
	translate([0, width/2+thickness, 3*width/4]) boltWasher("x+");
	translate([-width/2-thickness, 0, width/2]) boltWasher("y-");
}}

module yIdlerHolder(){
length=22/2+6;// half a 608 plus room for screw head and belt
difference(){
	union(){
		translate([0, inner/2, 0]) cube([length+thickness, 1*thickness, 2*thickness]);
		translate([0, -inner/2-1*thickness, 0]) cube([length+thickness, 1*thickness, 2*thickness]);
		translate([length, -inner/2-1*thickness, 0]) cube([1*thickness, inner+2*thickness, 2*thickness]);
		translate([length, 0, thickness]) rotate([0, 90, 0]) cylinder(r=5/2+thickness/2, h=1*thickness);
		translate([0, inner/2, thickness]) rotate([-90, 0, 0]) cylinder(r=8/2+thickness, h=1*thickness);
		translate([0, -inner/2, thickness]) rotate([90, 0, 0]) cylinder(r=8/2+thickness, h=1*thickness);
		%translate([0, 0, thickness]) rotate([-90, 0, 0]) cylinder(r=22/2, h=7);// 608zz
		%translate([0, 0, thickness]) rotate([90, 0, 0]) cylinder(r=22/2, h=7);// 608zz
		//translate([length, -inner/2, 0]) cube([2*thickness, inner, frameX/2+2*thickness]);
	}
	//translate([width/2, width/2, -1]) cylinder(r=smoothRod/2, h=thickness+2);
	translate([length-1, 0, thickness]) rotate([0, 90, 0]) cylinder(r=5/2, h=thickness+2);
	translate([length-1, 0, thickness]) rotate([0, 90, 0]) cylinder(r=9.2/2, h=thickness/2, $fn=6);//M5 nut trap
	translate([0, inner/2-1, thickness]) rotate([-90, 0, 0]) cylinder(r=8/2, h=2*thickness+2);
	translate([0, -inner/2+1, thickness]) rotate([90, 0, 0]) cylinder(r=8/2, h=2*thickness+2);
	translate([-100, -100, -100]) cube([200, 200, 100]);
	translate([-100, -100, 2*thickness]) cube([200, 200, 100]);
	// holes to attach to the frame
//	translate([0, width/2+thickness, 3*width/4]) boltWasher("x+");
//	translate([-width/2-thickness, 0, width/2]) boltWasher("y-");
}}

module yIdlerBlock(){
difference(){
	union(){
		hull(){
			translate([0, -inner/2-3*thickness, 0]) cube([frameX/2, inner+6*thickness, 2*thickness]);
			translate([0, -inner/2, 0]) cube([thickness+frameX/2, inner, 2*thickness]);
		}
		//translate([0, -inner/2, 0]) cube([frameX+thickness, inner, 2*thickness]);
		hull(){
			translate([frameX/2, -inner/2, 0]) cube([thickness, inner, 2*thickness]);
			translate([frameX/2, 0, frameX/2+2*thickness]) rotate([0, 90, 0]) cylinder(r=(5+thickness)/2, h=thickness);
		}
		translate([0, inner/2+2.5*thickness-5/2, 0]) cylinder(r=5/2+thickness/2, h=2*thickness);
		translate([0, -inner/2-2.5*thickness+5/2, 0]) cylinder(r=5/2+thickness/2, h=2*thickness);
	}
	translate([-1, 0, thickness]) rotate([0, 90, 0]) cylinder(r=5/2, h=frameX+thickness+2);
	translate([-1, -inner/2-2*thickness+5, -1]) cube([frameX/2-0.5*thickness+1, inner+4*thickness-2*5, 2*thickness+2]);
	//translate([width/2, width/2, -1]) cylinder(r=smoothRod/2, h=thickness+2);
	// holes to attach to the frame
	translate([frameX/2-1, 0, frameX/2+2*thickness]) rotate([0, 90, 0]) cylinder(r=5/2, h=thickness+2);
	translate([0, inner/2+2.5*thickness-5/2, -1]) cylinder(r=5/2, h=2*thickness+2);
	translate([0, -inner/2-2.5*thickness+5/2, -1]) cylinder(r=5/2, h=2*thickness+2);
}}
