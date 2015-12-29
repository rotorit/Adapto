// Copyright (C) 2012 t00tie
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

// hole size calibration object
// M8 has a block on top of the arch
// Order goes from block on top of M8, M5, M3, zRod
echo("M3=", M3);
echo("M5=", M5);
echo("M8=", M8);
echo("zRod=", zRod);
echo("M3nut=", M3nut);
echo("M5nut=", M5nut);
echo("M8nut=", M8nut);
echo("zRodnut=", zRodnut);

holes();
translate([0, 2*thickness+M8, thickness+M8/2]) rotate([-90, 0, 0]) holes();

module holes(){

	difference(){

		union(){
			// the arches
			// M8+block
			translate([0, 0, 0])
				polycyl(d=M8+thickness*2, h=thickness);
			translate([-thickness/2, -thickness/2-M8, 0])
				cube([thickness, thickness, thickness]);

			// M5
			translate([M8/2+1.5*thickness+M5/2, M5/2, 0])
				polycyl(d=M5+thickness*2, h=thickness);

			// M3
			translate([M8/2+1.5*thickness+M5/2+2*thickness+M3/2, M3, 0])
				polycyl(d=M3+thickness*2, h=thickness);

			// zRod
			translate([M8/2+1.5*thickness+M5/2+2*thickness+M3/2+2*thickness+(zRod+2)/2, 0,0])
				polycyl(d=zRod+2+thickness*2, h=thickness);

			// flat base
			hull(){
				translate([-thickness-M8/2, 0, 0])
					cube([thickness, thickness+M8/2, thickness]);
				translate([M8/2+1.5*thickness+M5/2+2*thickness+M3/2+2*thickness+zRod+2, 0, 0])
					cube([thickness, thickness+M8/2, thickness]);
			}

		}// end union

		// the holes and nut traps
		// M8
		translate([0, 0, -1])
			polyhole(d=M8, h=thickness/2+2);
		translate([0, 0, thickness/2])
			polynut(d=M8nut, h=thickness/2+2);

		// M5
		translate([M8/2+1.5*thickness+M5/2, M5/2, -1])
			polyhole(d=M5, h=thickness/2+2);
		translate([M8/2+1.5*thickness+M5/2, M5/2, thickness/2])
			polynut(d=M5nut, h=thickness/2+2);

		// M3
		translate([M8/2+1.5*thickness+M5/2+2*thickness+M3/2, M3, -1])
			polyhole(d=M3, h=thickness/2+2);
		translate([M8/2+1.5*thickness+M5/2+2*thickness+M3/2, M3, thickness/2])
			polynut(d=M3nut, h=thickness/2+2);

		// zRod
		translate([M8/2+1.5*thickness+M5/2+2*thickness+M3/2+2*thickness+(zRod+2)/2, 0, -1])
			polyhole(d=zRod, h=thickness/2+2);
		translate([M8/2+1.5*thickness+M5/2+2*thickness+M3/2+2*thickness+(zRod+2)/2, 0, thickness/2])
			polynut(d=zRodnut, h=thickness/2+2);

		// the flat base
		hull(){
			translate([-thickness-M8/2, thickness+M8/2, -1])
				cube([thickness, thickness, thickness+2]);
			translate([M8/2+1.5*thickness+M5/2+2*thickness+M3/2+2*thickness+zRod+2, thickness+M8/2, -1])
				cube([thickness, thickness, thickness+2]);
		}

	}// end difference

}