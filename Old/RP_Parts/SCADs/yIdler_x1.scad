// Copyright (C) 2013 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

// t00ties new version (3 lines)
yIdlerBlock();
translate([-33, 0, thickness/2])
	yIdlerHolder(); //bottom side has thicker edges around bolt holes and nut trap

// Original Design (2 lines)
//mirror([ 0, 1, 0 ]) yIdler_Original();
//translate([0, frameX, 0]) yIdler_Original();

// original module
module yIdler_Original(){

	difference(){

		union(){

			// frame mounting plates
			translate([-thickness, 0, 0])
				cube([thickness, frameX+thickness, frameX]);
			translate([-frameX, 0, 0])
				cube([frameX, thickness, frameX]);

			// bearing support flange
			hull(){
				cube([frameX/2, frameX+thickness, thickness]);
				translate([frameX/2, frameX/2, 0])
					polycyl(d=frameX, h=thickness);
			}
			// support brace
			hull(){
				translate([-thickness, frameX, 0])
					cube([thickness, thickness, frameX]);
				translate([0, frameX, 0])
					cube([frameX/2, thickness, thickness]);
			}

		}// end union

		// bearing bolt hole
		translate([frameX/2, frameX/2, -1])
			polyhole(d=M8, h=thickness+2);

		// holes to attach to the frame
		translate([-thickness-1, frameX/2+thickness, frameX/2+M5/2])
			rotate([0,90,0])
			polyhole(d=M5, h=thickness+2);
		translate([-frameX/2-thickness, thickness+1, frameX/2])
			rotate([90,0,0])
			polyhole(d=M5, h=thickness+2);

	}// end difference

}

// t00ties modules
module yIdlerHolder(){
	inner=2*rotaryBearing[2]+2*2;// 2 rotary bearings +2 washers
	length=rotaryBearing[1]/2+thickness+M5nutThickness/2;

	difference(){

		union(){

			// bearing tensioner base
			translate([length, -inner/2-thickness, -thickness/2])
				cube([thickness, inner+2*thickness, thickness*2+M5]);

			// bearing tensioner arms
			translate([0, inner/2, -thickness/2])
				cube([length+thickness, thickness, thickness*2+M5]);
			mirror([0,1,0])
				translate([0, inner/2, -thickness/2])
				cube([length+thickness, thickness, thickness*2+M5]);

			// tensioner arms curved ends
			translate([0, inner/2, thickness/2+M5/2])
				rotate([-90, 0, 0])
				polycyl(d=M8+thickness*2, h=thickness);
			mirror([0,1,0])
				translate([0, inner/2, thickness/2+M5/2])
				rotate([-90, 0, 0])
				polycyl(d=M8+thickness*2, h=thickness);

			// rotary bearings for reference
			%translate([0, 0, thickness/2+M5/2])
				rotate([-90, 0, 0])
				polycyl(d=rotaryBearing[1], h=rotaryBearing[2]);
			mirror([0,1,0])
				%translate([0, 0, thickness/2+M5/2])
				rotate([-90, 0, 0])
				polycyl(d=rotaryBearing[1], h=rotaryBearing[2]);

		}// end union

		// tensioning bolt hole
		translate([length-1, 0, thickness/2+M5/2])
			rotate([0, 90, 0])
			polyhole(d=M5, h=thickness+2);

		// tensioner arm M5 nut trap
		translate([length-M5nutThickness/2, 0, thickness/2+M5/2])
			rotate([90, 0, 0])
			rotate([0, 90, 0])
			polynut(d=M5nut, h=M5nutThickness);

		// bearing bolt holes
		translate([0, inner/2-1, thickness/2+M5/2])
			rotate([-90, 0, 0])
			polyhole(d=M8, h=2*thickness+2);
		mirror([0,1,0])
			translate([0, inner/2-1, thickness/2+M5/2])
			rotate([-90, 0, 0])
			polyhole(d=M8, h=2*thickness+2);

		// cut the humps off the tensioner curved ends
		translate([-25, -25, -50-thickness/2])
			cube([50, 50, 50]);
		translate([-25, -25, thickness/2*2+M5])
			cube([50, 50, 50]);

	}// end difference

}

module yIdlerBlock(){
	inner=2*rotaryBearing[2]+2*2;// 2 rotary bearings +2 washers

	difference(){

		union(){

			// base block
			hull(){
				translate([0, -inner/2-thickness*2-M5-.5, 0])
					cube([frameX/2, inner+thickness*4+M5*2+1, 2*thickness]);
				translate([0, -inner/2, 0])
					cube([thickness+frameX/2, inner, 2*thickness]);
			}

			// upper tab
			hull(){
				translate([frameX/2, -inner/2, 0])
					cube([thickness, inner, 2*thickness]);
				translate([frameX/2, 0, frameX/2+2*thickness])
					rotate([0, 90, 0])
					polycyl(d=M5+thickness*2, h=thickness);
			}

			//base block curved arm ends
			translate([0, inner/2+thickness*1.5+M5/2+.5, 0])
				polycyl(d=M5+thickness, h=2*thickness);
			mirror([0,1,0])
				translate([0, inner/2+thickness*1.5+M5/2+.5, 0])
				polycyl(d=M5+thickness, h=2*thickness);
			
		}// end union

		// tensioner hole
		translate([-1, 0, thickness])
			rotate([0, 90, 0])
			polyhole(d=M5, h=frameX+thickness+2);

		// create tensioner cavity
		translate([-1, -inner/2-thickness-.5, -1])
			cube([frameX/2-0.5*thickness+1, inner+2*thickness+1, 2*thickness+2]);

		// holes to attach to the frame
		translate([frameX/2-1, 0, frameX/2+2*thickness])
			rotate([0, 90, 0])
			polyhole(d=M5, h=thickness+2);
		translate([0, inner/2+thickness*1.5+M5/2+.5, -1])
			polyhole(d=M5, h=2*thickness+2);
		mirror([0,1,0])
			translate([0, inner/2+thickness*1.5+M5/2+.5, -1])
			polyhole(d=M5, h=2*thickness+2);

	}// end difference

}
