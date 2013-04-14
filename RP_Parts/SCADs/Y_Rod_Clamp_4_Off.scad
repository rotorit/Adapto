// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/

include <configuration.scad>;
use <bolt.scad>;

$fn=99;
thickness=5;
width=frameX;

// render the parts
yRodClamp(recess=false);
//translate([2*width, 0, 0]) yRodClamp(recess=false);
//translate([2*width, 3*width, 0]) yRodClamp(recess=false);
//translate([0, 3*width, 0]) yRodClamp(recess=false);

module yRodClamp(recess=false){
difference(){
	union(){
		translate([-width/2, 0, smoothRod/2]) rotate([0,90,0]) cylinder(r=thickness+smoothRod/2, h=width);
		hull(){
			translate([0, width/2, 0]) cylinder(r=width/2, h=width/2);
			translate([0, -width/2, 0]) cylinder(r=width/2, h=width/2);
		}
	}
	translate([-1-width/2, 0, smoothRod/2]) rotate([0,90,0]) cylinder(r=smoothRod/2, h=width+2);
	translate([-1-width/2, -smoothRod/2, -1]) cube([100+width+2, smoothRod, smoothRod/2+1]);
	if(recess==true){// recesses the holes for washers. This makes weaker parts prone to splitting but is truer to the original
		translate([0,  width-thickness-2, thickness]) boltWasher("z+");
		translate([0,  -width+thickness+2, thickness]) boltWasher("z+");
	} else {
		translate([0,  width-thickness-2, width/2]) boltWasher("z+");
		translate([0,  -width+thickness+2, width/2]) boltWasher("z+");
	} 
	translate([0, 0, -50]) cube([100, 100, 100], center=true);
}
}