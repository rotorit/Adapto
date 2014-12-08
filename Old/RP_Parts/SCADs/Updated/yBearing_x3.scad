// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <configuration.scad>

length=thickness+M3nut+linearBearing[1]+M3nut+thickness;

yBearing();

module yBearing(){

	difference(){
	
		union(){
	
			cube([length, thickness, linearBearing[2]]);
			translate([length/2, -linearBearing[1]/2-0*thickness+2, 0])
				cylinder(r=linearBearing[1]/2+thickness, h=linearBearing[2]);
	
		}// end union
	
		// linear bearing
		translate([length/2, -linearBearing[1]/2-0*thickness+2, -1])
			cylinder(r=linearBearing[1]/2, h=linearBearing[2]+2);
	
		// flatten mounting surface
		translate([-1, thickness, -1])
			cube([length+2, thickness, linearBearing[2]+2]);
	
		// bolt holes
		translate([4, -1, linearBearing[2]/2])
			rotate([-90, 0, 0])
			cylinder(r=M3/2, h=thickness+2);
		translate([length-4, -1, linearBearing[2]/2])
			rotate([-90, 0, 0])
			cylinder(r=M3/2, h=thickness+2);
	
		// nut traps
		translate([4, -1, linearBearing[2]/2])
			rotate([-90, 90, 0])
			cylinder(r=M3nut/2, h=2+1, $fn=6);
		translate([length-4, -1, linearBearing[2]/2])
			rotate([-90, 90, 0])
			cylinder(r=M3nut/2, h=2+1, $fn=6);
	
		// split to allow bearings to press in nicely.
		translate([length/2-1, -2*linearBearing[1], -1])
			cube([2, 2*linearBearing[1], linearBearing[2]+2]);
	
	}// end difference

}