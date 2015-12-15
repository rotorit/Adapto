// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

// call including the smooth rod locking screw hole
// change to true to include this feature
zUpper(lockhole=false);


module zUpper(lockhole){
	smoothRodOffset=14;// how far the centre of the z smooth rods are from the frame

	difference(){

		union(){

			// back plate
			cube([80, thickness, 50]);

			// top plate(printed facing down)
			translate([0, -30, 0])
				cube([80, 30, thickness]);

			// smooth rod support
			hull(){
				translate([40-max(frameX, 20)/2, -smoothRodOffset, 0])
					cube([max(frameX, 20)+0*(smoothRod+2*thickness), smoothRod/2+smoothRodOffset, 17+thickness]);
				translate([40, -(smoothRodOffset), 0])
					polycyl(d=smoothRod+thickness*2, h=17+thickness);
				translate([40-max(frameX, 20)/2, -30, 0])
					cube([max(frameX, 20), 30, thickness]);
			}

		}// end union

		// holes on back plate
		translate([frameX/2, thickness+1, frameY/2])
			rotate([90,0,0])
			polyhole(d=M5, h=thickness+2);
		translate([80-frameX/2, thickness+1, frameY/2])
			rotate([90,0,0])
			polyhole(d=M5, h=thickness+2);
		translate([80/2, thickness+1, 50-frameX/2])
			rotate([90,0,0])
			polyhole(d=M5, h=thickness+2);

		// cut the corners of the back and top plates
		translate([0, 0, -1]) rotate([0, 0, -90-45])
			cube([99, 99, thickness+2]);
		translate([80, 0, -1]) rotate([0, 0, -90-45])
			cube([99, 99, thickness+2]);
		translate([30, -1, 50]) rotate([0, -90-45, 0])
			cube([99, thickness+2, 99]);
		translate([50, -1, 50]) rotate([0, 90-45, 0])
			cube([99, thickness+2, 99]);

		// hole for smooth rod
		translate([40, -smoothRodOffset, -1])
			polyhole(d=smoothRod, h=17+thickness+2);

		// smooth rod locking screw
		if (lockhole==true){
			translate([40, -(smoothRodOffset), thickness+M3])
				rotate([90,0,0])
				polyhole(d=M3, h=smoothRod+thickness*2);
		}

	}//end difference

}