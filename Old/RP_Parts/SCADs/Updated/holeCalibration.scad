// Copyright (C) 2012 t00tie
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <configuration.scad>

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
				cylinder(r=thickness+M8/2, h=thickness);
			translate([-thickness/2, -thickness/2-M8, 0])
				cube([thickness, thickness, thickness]);

			// M5
			translate([M8/2+1.25*thickness+M5/2, M5/2, 0])
				cylinder(r=thickness+M5/2, h=thickness);

			// M3
			translate([M8/2+1.25*thickness+M5/2+1.5*thickness+M3/2, M3, 0])
				cylinder(r=thickness+M3/2, h=thickness);

			// zRod
			translate([M8/2+1.5*thickness+M5/2+1.5*thickness+M3/2+1.25*thickness+zRod/2, 0,0])
				cylinder(r=thickness+zRod/2, h=thickness);

			// flat base
			hull(){
				translate([-thickness-M8/2, 0, 0])
					cube([thickness, thickness+M8/2, thickness]);
				translate([M8/2+1.5*thickness+M5/2+1.5*thickness+M3/2+1.25*thickness+zRod, 0, 0])
					cube([thickness, thickness+M8/2, thickness]);
			}

		}// end union

		// M8
		translate([0, 0, -1])
			cylinder(r=M8/2, h=thickness/2+2);
		translate([0, 0, thickness/2])
			cylinder(r=M8nut/2, h=thickness/2+2, $fn=6);

		// M5
		translate([M8/2+1.25*thickness+M5/2, M5/2, -1])
			cylinder(r=M5/2, h=thickness/2+2);
		translate([M8/2+1.25*thickness+M5/2, M5/2, thickness/2])
			cylinder(r=M5nut/2, h=thickness/2+2, $fn=6);

		// M3
		translate([M8/2+1.25*thickness+M5/2+1.5*thickness+M3/2, M3, -1])
			cylinder(r=M3/2, h=thickness/2+2);
		translate([M8/2+1.25*thickness+M5/2+1.5*thickness+M3/2, M3, thickness/2])
			cylinder(r=M3nut/2, h=thickness/2+2, $fn=6);

		// zRod
		translate([M8/2+1.5*thickness+M5/2+1.5*thickness+M3/2+1.25*thickness+zRod/2, 0, -1])
			cylinder(r=zRod/2, h=thickness/2+2);
		translate([M8/2+1.5*thickness+M5/2+1.5*thickness+M3/2+1.25*thickness+zRod/2, 0, thickness/2])
			cylinder(r=zRodnut/2, h=thickness/2+2, $fn=6);

		// flat base
		hull(){
			translate([-thickness-M8/2, thickness+M8/2, -1])
				cube([thickness, thickness, thickness+2]);
			translate([M8/2+1.5*thickness+M5/2+1.5*thickness+M3/2+1.25*thickness+zRod, thickness+M8/2, -1])
				cube([thickness, thickness, thickness+2]);
		}

	}// end difference

}