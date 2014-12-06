// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <configuration.scad>;
use <nemaMount.scad>

//determine total width for mounting surface
width=thickness+screwR+thickness*2+45+thickness*2+screwR+thickness;

zMotor();

module zMotor(){

	difference(){

		union(){

			// mounting surface to frame
			translate([0, -width/2, 0])
				cube([thickness, width, frameY]);

			// spacer between mounting surface and nemaMount
			translate([0, -45/2, 0])
				cube([thickness+11, 45, thickness]);

			// nemaMount
			translate([thickness+10, -45/2, 0])
				nemaMount();

			// vertical support arms
			hull(){
				translate([thickness-1, -thickness-45/2, 0])
					cube([1, thickness, frameY]);
				translate([thickness+9+56, -thickness-45/2, 0])
					cube([1, thickness, thickness]);
			}
			mirror([0,1,0])
				hull(){
					translate([thickness-1, -thickness-45/2, 0])
						cube([1, thickness, frameY]);
					translate([thickness+9+56, -thickness-45/2, 0])
						cube([1, thickness, thickness]);
				};
			// horizontal support arms
			hull(){
				translate([thickness, -45/2, 0])
					rotate([0,0,180])
					cube([thickness, thickness+screwR+thickness*2, thickness]);
				translate([thickness+9+56, -thickness-45/2, 0])
					cube([1, thickness, thickness]);
			}
			mirror([0,1,0])
				hull(){
					translate([thickness, -45/2, 0])
						rotate([0,0,180])
						cube([thickness, thickness+screwR+thickness*2, thickness]);
					translate([thickness+9+56, -thickness-45/2, 0])
						cube([1, thickness, thickness]);
				};

		}// end union

		// holes to attach to the frame
		translate([-1, width/2-screwR-thickness, boltOffset])
			rotate([0,90,0])
			cylinder(r=screwR,h=thickness+2);
		mirror([0,1,0])
			translate([-1, width/2-screwR-thickness, boltOffset])
				rotate([0,90,0])
				cylinder(r=screwR,h=thickness+2);

	}// end difference

}