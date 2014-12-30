// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

yBearing();

module yBearing(){
	// set a defined mount plate bolt spacing(can handle up to lm12uu easily)
	length=M3nut*2+25+M3nut*2;

	difference(){
	
		union(){

			// create the mount plate and bearing trap
			cube([length, thickness, linearBearing[2]]);
			translate([length/2, -linearBearing[1]/2+2, 0])
				polycyl(d=linearBearing[1]+thickness*2, h=linearBearing[2]);

			// the linear bearing
			%translate([length/2, -linearBearing[1]/2+2, 0])
				polycyl(d=linearBearing[1], h=linearBearing[2]);
			// the smooth rod
			%translate([length/2, -linearBearing[1]/2+2, -35])
				polycyl(d=smoothRod, h=100);
	
		}// end union
	
		// linear bearing channel
		translate([length/2, -linearBearing[1]/2+2, -1])
			polyhole(d=linearBearing[1]-.2, h=linearBearing[2]+2);
	
		// flatten mounting surface
		translate([-1, thickness, -1])
			cube([length+2, thickness, linearBearing[2]+2]);
	
		// bolt holes
		translate([4, -1, linearBearing[2]/2])
			rotate([-90, 0, 0])
			polyhole(d=M3, h=thickness+2);
		translate([length-4, -1, linearBearing[2]/2])
			rotate([-90, 0, 0])
			polyhole(d=M3, h=thickness+2);
	
		// nut traps
		translate([4, -1, linearBearing[2]/2])
			rotate([-90, 90, 0])
			polynut(d=M3nut, h=2+1);
		translate([length-4, -1, linearBearing[2]/2])
			rotate([-90, 90, 0])
			polynut(d=M3nut, h=2+1);
	
		// split to allow bearings to press in nicely.
		translate([length/2-1, -2*linearBearing[1], -1])
			cube([2, 2*linearBearing[1], linearBearing[2]+2]);
	
	}// end difference

}