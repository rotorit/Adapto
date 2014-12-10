// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <configuration.scad>

// Printing on its side will make the skin continuous over the hump and much stronger
rotate([0,90,0])
	yRodClamp();

module yRodClamp(){
	width=frameX;

	difference(){

		union(){

			// center hump
			translate([-width/2, 0, smoothRod/2])
				rotate([0,90,0]) 
				cylinder(r=thickness+smoothRod/2, h=width);

			// bolt flanges
			hull(){
				translate([0, width/2+thickness, 0])
					cylinder(r=width/2, h=thickness);
				translate([0, -width/2-thickness, 0])
					cylinder(r=width/2, h=thickness);
			}

		}// end union

		// remove remainder of center hump to create the arch for smooth rod
		translate([-1-width/2, 0, smoothRod/2])
			rotate([0,90,0])
			cylinder(r=smoothRod/2, h=width+2);
		translate([-1-width/2, -smoothRod/2, -1])
			cube([width+2, smoothRod, smoothRod/2+1]);
		translate([0, 0, -smoothRod/2])
			cube([width*2, width*2, smoothRod], center=true);

		// holes
		translate([0, smoothRod+thickness, -1])
			cylinder(r=screwR, h=thickness+2);
		mirror([0,1,0])
			translate([0, smoothRod+thickness, -1])
				cylinder(r=screwR, h=thickness+2);

	}// end difference

}