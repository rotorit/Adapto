// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <configuration.scad>
use <xBacker.scad>

xMotor();

module xMotor(){
	difference(){
		union(){
			xBacker();
			// create nema mount
			translate([44-thickness, 64, 0])
				cube([thickness, 46, 62]);
			hull(){
				translate([20, 63, 0])
					cube([24, 1, thickness]);
				translate([44-thickness, 109, 0])
					cube([thickness, 1, thickness]);
			}
			hull(){
				translate([44-thickness-linearBearing[1]/2, 40, 27+thickness+linearBearing[1]])
					cube([thickness+linearBearing[1]/2, 24, 2]);
				#translate([44-thickness, 63, 27+thickness+linearBearing[1]])
					cube([thickness, 1, 11]);
			}
		}//end union

		// cut opening for nema17 axle
		hull(){
			translate([36, 110-M3-M3/2-thickness-centerr, 62-thickness-(18-2*M3)/2-centerr])
				rotate([0, 90, 0])
				cylinder(r=centerr, h=10);
			translate([36, 110-M3-M3/2-thickness-centerr, 62-thickness-(18-2*M3)-(18-2*M3)/2-centerr])
				rotate([0, 90, 0])
				cylinder(r=centerr, h=10);
		}
		// position slots for nema17
		translate([36, 110-M3/2-thickness, 62-M3/2-(18-M3*2)-thickness])
			oval();
		translate([36, 110-M3/2-thickness-motorcc, 62-M3/2-(18-M3*2)-thickness])
			oval();
		translate([36, 110-M3/2-thickness, 62-M3/2-(18-M3*2)-thickness-motorcc])
			oval();
		translate([36, 110-M3/2-thickness-motorcc, 62-M3/2-(18-M3*2)-thickness-motorcc])
			oval();
	}// end difference
}

// slot for nema bolt mount
module oval(){
	hull(){
		rotate([0, 90, 0])
			cylinder(r=M3/2, h=10);
		translate([0, 0, 18-2*M3])
			rotate([0, 90, 0])
			cylinder(r=M3/2, h=10);
	}
}