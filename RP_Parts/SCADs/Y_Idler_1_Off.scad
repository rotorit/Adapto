// Copyright (C) 2013 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/

include <configuration.scad>;
use <bolt.scad>;

$fn=99;
thickness=6;// thickness of wall parts
width=frameX;// should we just use frameX directly?

mirror([ 0, 1, 0 ]) yIdler();
translate([0, width, 0]) yIdler();

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
