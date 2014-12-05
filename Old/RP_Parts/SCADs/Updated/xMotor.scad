// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <configuration.scad>
use <xBacker.scad>
use <nemaMount.scad>

xMotor();

module xMotor(){
	union(){
		xBacker();
		// create nema mount
		translate([44, 66, thickness+2])
			rotate([0, -90, 0])
			nemaMount();
		translate([44-thickness, 63, thickness+2])
			cube([thickness, 4, 56-thickness/2]);
		translate([44-thickness, 63, thickness-1])
			cube([thickness, 48, thickness]);

		hull(){
			translate([20, 63, 0])
				cube([24, 1, thickness+1]);
			translate([44-thickness, 110, 0])
				cube([thickness, 1, thickness+1]);
		}
		hull(){
			translate([44-thickness-linearBearing[1]/2, 44, 27+thickness+linearBearing[1]])
				cube([thickness+linearBearing[1]/2, 20, 2]);
			translate([44-thickness, 64, 56])
				cube([thickness, 3, thickness+2]);
		}
	}//end union
}