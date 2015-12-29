// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./configuration.scad>
use <./polyarc.scad>

slotWidth=18-2*M3;	// width of slots for holes

// This model is only parametric for the thickness value. The rest is constant.
// This helps with importing to other models, and helps define a guaranteed area for the nema17
// not including the depth of the motor as that can vary.
nemaMount();

module nemaMount(){
	width=45;	// y axis
	height=56;	// x axis
	mcenter=22;	// diameter of nema17 axle bearing raised surface
	motorcc=31;	// center-center of the motor screw holes for nema17

	difference(){

		// create nema mount
		cube([height, width, thickness]);
		
		// cut opening for nema17 axle
		hull(){
			translate([height/2-slotWidth/2, width/2, -1])
				polyhole(d=mcenter+.1, h=thickness+2);
			translate([height/2+slotWidth/2, width/2, -1])
				polyhole(d=mcenter+.1, h=thickness+2);
		}

		// position slots for nema17
		translate([height/2-motorcc/2+thickness, width/2-motorcc/2, -1])
			rotate([0,0,180])
			boltSlot();
		translate([height/2-motorcc/2+thickness, width/2+motorcc/2, -1])
			rotate([0,0,180])
			boltSlot();
		translate([height/2+motorcc/2-thickness, width/2-motorcc/2, -1])
			boltSlot();
		translate([height/2+motorcc/2-thickness, width/2+motorcc/2, -1])
			boltSlot();

	}// end difference

}

// slot for nema bolt mount
module boltSlot(){
	hull(){
		polyhole(d=M3, h=thickness+2);
		translate([slotWidth, 0, 0])
			polyhole(d=M3, h=thickness+2);
	}
}