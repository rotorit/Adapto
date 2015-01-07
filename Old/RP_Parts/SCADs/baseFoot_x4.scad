// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

// foot_Original is a copy of rotorits original stl
// foot_t00tie is a smaller version designed to save plastic and fit under the frame

// Original Design
//foot_Original();

// t00tie's Plastic Saver Design
foot_t00tie();

module foot_t00tie(){
// This foot is intended to be underneath the frame
// The height is designed so standard 48mm tall Z motors will sit on the table
// 54mm over the table is half way up the side of the Y frame
// ref. Z motor holder
height=54;

	difference(){

		union(){
			cube([frameX*2, frameX, thickness]);
			cube([frameX, frameX*2, thickness]);
			hull(){
				cube([2*frameX, thickness, thickness]);
				translate([0, 0, height-thickness-frameY/2])
					cube([frameX, thickness, thickness]);
			}
			hull(){
				cube([thickness, 2*frameX, thickness]);
				translate([0, 0, height-thickness-frameY/2])
					cube([thickness, frameX, thickness]);
			}

		}// end union

		// bolt holes
		translate([frameX/2, frameX/2, 0])
			polyhole(d=M5, h=thickness+2);
		translate([frameX/2, 3*frameX/2, 0])
			polyhole(d=M5, h=thickness+2);
		translate([3*frameX/2, frameX/2, 0])
			polyhole(d=M5, h=thickness+2);

	}// end difference

}


module foot_Original(){
h=80;// height
b=65;// breadth

	difference(){

		union(){

			cube([b, b, thickness]);
			cube([b, thickness, 25]);
			cube([b-frameX/2, thickness, h]);
			cube([thickness, b, 25]);
			cube([thickness, b-frameX/2, h]);

		}// end union

		// intersecting blocks to cut off corners
		translate([b, 25, -thickness])
			rotate([0, 0, 45])
			cube([2*b, 2*b, 3*thickness]);
		translate([15, -thickness, h+15])
			rotate([0, 55, 0])
			cube([h, 3*thickness, h]);
		translate([-thickness, 15, h+15])
			rotate([-55, 0, 0])
			cube([3*thickness, h, h]);

		// top holes
		translate([frameX/2+thickness, frameX/2+thickness, -1])
			polyhole(d=M5, h=thickness+2);
		translate([frameX/2+thickness, b-10, -1])
			polyhole(d=M5, h=thickness+2);
		translate([b-frameX/2, frameX/2+thickness, -1])
			polyhole(d=M5, h=thickness+2);

		// side holes
		translate([b-frameX, -1, frameX/2+thickness])
			rotate([-90, 0, 0])
			polyhole(d=M5, h=thickness+2);
		translate([-1, b-frameX, frameX/2+thickness])
			rotate([0, 90, 0])
			polyhole(d=M5, h=thickness+2);

	}// end difference

}