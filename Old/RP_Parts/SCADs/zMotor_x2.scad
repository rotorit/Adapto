// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>
use <./inc/nemaMount.scad>

// A motor holder for a nema17 stepper motor
// these are 1.7 inches (ugh) square, any length and have 4 M3 holes in a 31mm square centre-centre
// based on https://github.com/rotorit/Adapto/blob/master/RP_Parts/STLs/Z_Motor_Holder_2_Off.stl
// The 17HS8401 is 48mm tall from base to screw mounting holes. 
// These holes are 4.8mm deep so a thickness of 5-6mm is good for M3x10 mounting screws
// Plain M3 washers are .4-.6mm thick

zMotor_Original();
//zMotor_t00tie();

// based on original
module zMotor_Original(){
width=thickness+M5+thickness*2+45+thickness*2+M5+thickness;

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
					cube([thickness, thickness+M5+thickness*2, thickness]);
				translate([thickness+9+56, -thickness-45/2, 0])
					cube([1, thickness, thickness]);
			}
			mirror([0,1,0])
				hull(){
					translate([thickness, -45/2, 0])
						rotate([0,0,180])
						cube([thickness, thickness+M5+thickness*2, thickness]);
					translate([thickness+9+56, -thickness-45/2, 0])
						cube([1, thickness, thickness]);
				};

		}// end union

		// holes to attach to the frame
		translate([-1, width/2-M5-thickness, frameY/2])
			rotate([0,90,0])
			polyhole(d=M5,h=thickness+2);
		mirror([0,1,0])
			translate([-1, width/2-M5-thickness, frameY/2])
				rotate([0,90,0])
				polyhole(d=M5,h=thickness+2);

	}// end difference

}


// alternative minimal Z motor mount
// Designed by t00tie
// NOTE! I have not checked whether this is compatible with the existing X ends, use at your own risk (test and report back please!)
// You could make an even smaller version by only fixing the motor with 2 screws
// You want this to fit so that the feet and the Z motor are both touching the table at the same time
module zMotor_t00tie(){
width=45;
twoscrew=false;

	difference(){
	
		union(){

			// frame mounting and 2 screw design
			translate([0, -width/2-2*thickness, 0])
				cube([thickness, width+thickness*4, 12]);
			translate([0, -31/2-M3/2-thickness, 0])
				cube([6+thickness, 31+M3+thickness*2, thickness]);
			translate([6+thickness, 31/2, 0])
				polycyl(d=M3+thickness*2, h=thickness);
			translate([6+thickness, -31/2, 0])
				polycyl(d=M3+thickness*2, h=thickness);

			// add the 3rd screw mount if twoscrew = false
			if(twoscrew==false){
				translate([6+thickness, 31/2-M3/2, 0])
					cube([31, M3+thickness, thickness]);
				translate([6+thickness+31, 31/2, 0])
					polycyl(d=M3+thickness*2, h=thickness);
			}
		}// end union
	
		// holes for the motor screws along frame
		translate([6+thickness, 31/2, -1])
			polyhole(d=M3, h=thickness+2);
		translate([6+thickness, -31/2, -1])
			polyhole(d=M3, h=thickness+2);

		// add hole for 3rd screw mount if twoscrew = false
		if(twoscrew==false){
			translate([6+thickness+31, 31/2, -1])
				polyhole(d=M3, h=thickness+2);
		}

		// holes to attach to the frame. These are centered 6mm above the motor => 
		// 6+48=54mm over the table is half way up the side of the Y frame -> [X]
		translate([-1, width/2+thickness, 6])
			rotate([0, 90, 0])
			polyhole(d=M5, h=thickness+2);
		translate([-1, -width/2-thickness, 6])
			rotate([0, 90, 0])
			polyhole(d=M5, h=thickness+2);
	}// end difference
}