// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>
use <./inc/xBacker.scad>
use <./inc/nemaMount.scad>

xMotor();

module xMotor(){

	difference(){

		union(){

			xBacker();

			// create nema mount
			translate([44, 66, thickness+2])
				rotate([0, -90, 0])
				nemaMount();

			// y spacer between xBacker and nemaMount
			translate([44-thickness, 63, thickness+2])
				cube([thickness, 4, 56-thickness/2]);

			// x spacer between nemaMount and support arm
			translate([44-thickness, 63, thickness-1])
				cube([thickness, 48, thickness]);

			// block for adjustable z height endstop screw
			translate([-44+thickness, 40-ceil(M3nut+M3nut/2), linearBearing[1]/2+thickness])
				cube([thickness, ceil(M3nut+M3nut/2), ceil(M3nut+M3nut/2)]);

			// support arm from xBacker to nemaMount
			hull(){
				translate([21, 63, 0])
					cube([23, 1, thickness+1]);
				translate([44-thickness, 110, 0])
					cube([thickness, 1, thickness+1]);
			}

			// additional support from xBacker to nemaMount
			hull(){
				translate([44-thickness-linearBearing[1]/2, 44, 27+thickness+linearBearing[1]])
					cube([thickness+linearBearing[1]/2, 20, 2]);
				translate([44-thickness, 64, 56])
					cube([thickness, 3, thickness+2]);
			}

		}// end union

		// nut trap for z height screw
		translate([-44+thickness+M3nutThickness, 40-ceil(M3nut-M3/2), linearBearing[1]/2+thickness+M3nut-M3/2])
			rotate([0,90,0])
			polynut(d=M3nut, h=ceil(M3nutThickness));

		// hole for z height screw
		translate([-44+thickness-1, 40-ceil(M3nut-M3/2), linearBearing[1]/2+thickness+M3nut-M3/2])
			rotate([0,90,0])
			polycyl(d=M3, h=ceil(thickness+2));

		// make sure we keep the x rod opening clear
		translate([xRodDistance/2, 65, 27+thickness+linearBearing[1]/2])
			rotate([90, 0, 0])
			polycyl(d=smoothRod+.1, h=10);

	}// end difference

}