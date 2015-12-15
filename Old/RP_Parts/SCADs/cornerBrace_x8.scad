// Copyright (C) 2012 t00tie
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

// Reinforced design (2 lines)
// Rotated to improve skin strength
rotate([90, 0, 0])
	cornerBrace();

// Original Design
//cornerBrace_Original();

module cornerBrace(){

	difference(){

		hull(){
			cube([frameY*2, frameX, thickness]);
			cube([thickness, frameX, frameY*2]);
		}

		// M5 holes
		translate([frameY+M5, frameX/2, -1])
			polyhole(d=M5, h=frameX);
		translate([-1, frameX/2, frameY+M5])
			rotate([0,90,0])
			polyhole(d=M5, h=frameX);
		// M5 allen recess
		translate([frameY+M5, frameX/2, thickness+2])
			polyhole(d=M5nut, h=frameX);
		translate([thickness+2, frameX/2, frameY+M5])
			rotate([0,90,0])
			polyhole(d=M5nut, h=frameX);

	}// end difference

}


module cornerBrace_Original(){
l=37;

	difference(){

		union(){

			cube([l, frameX, thickness]);
			cube([thickness, frameX, l]);
			intersection(){
				rotate([-90,0,0])
					cylinder(r=l-M5/2-frameX/2, h=frameX);
				cube([l,frameX,l]);
			}

		}// end union

		translate([l-M5, frameX/2, -1])
			polyhole(d=M5, h=thickness+2);
		translate([-1, frameX/2, l-M5])
			rotate([0,90,0])
			polyhole(d=M5, h=thickness+2);

	}// end difference

}
