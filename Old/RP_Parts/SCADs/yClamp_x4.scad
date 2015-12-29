// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

// Printing on its side will make the skin continuous over the hump and much stronger
rotate([0,90,0])
	yClamp();

// Original Design
// Change recess to true to recess the allen heads
//yRodClamp_Original(recess=false);

module yClamp(){
	width=frameX;

	difference(){

		union(){

			// center hump
			translate([-width/2, 0, smoothRod/2-.4])
				rotate([0,90,0]) 
				polycyl(d=smoothRod+thickness*2, h=width);

			// bolt flanges
			hull(){
				translate([0, width/2+thickness, 0])
					polycyl(d=width, h=thickness);
				translate([0, -width/2-thickness, 0])
					polycyl(d=width, h=thickness);
			}

		}// end union

		// remove remainder of center hump to create the arch for smooth rod
		translate([-1-width/2, 0, smoothRod/2-.4])
			rotate([0,90,0])
			polyhole(d=smoothRod, h=width+2);
		translate([-1-width/2, -smoothRod/2, -1])
			cube([width+2, smoothRod, smoothRod/2+1]);
		translate([0, 0, -smoothRod/2])
			cube([width*2, width*2, smoothRod], center=true);

		// holes
		translate([0, smoothRod+thickness, -1])
			polyhole(d=M5, h=thickness+2);
		mirror([0,1,0])
			translate([0, smoothRod+thickness, -1])
				polyhole(d=M5, h=thickness+2);

	}// end difference

}


module yRodClamp_Original(recess=false){
width=frameX;

	difference(){

		union(){

			translate([-width/2, 0, smoothRod/2])
				rotate([0,90,0])
				cylinder(r=thickness+smoothRod/2, h=width);
			hull(){
				translate([0, width/2, 0])
					cylinder(r=width/2, h=width/2);
				translate([0, -width/2, 0])
					cylinder(r=width/2, h=width/2);
			}

		}// end union

		translate([-1-width/2, 0, smoothRod/2])
			rotate([0,90,0])
			polyhole(d=smoothRod, h=width+2);
		translate([-1-width/2, -smoothRod/2, -1])
			cube([100+width+2, smoothRod, smoothRod/2+1]);

		// Recesses the holes for allen heads.
		// This makes weaker parts prone to splitting but is truer to the original
		if(recess==true){
			translate([0,  width-thickness-2, width/4])
				polyhole(d=M5nut, h=width);
			translate([0,  -width+thickness+2, width/4])
				polyhole(d=M5nut, h=width);
		}
		translate([0,  width-thickness-2, -1])
			polyhole(d=M5, h=width);
		translate([0,  -width+thickness+2, -1])
			polyhole(d=M5, h=width);
		translate([0, 0, -50])
			cube([100, 100, 100], center=true);

	}// end union

}