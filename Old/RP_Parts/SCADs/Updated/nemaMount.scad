// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <configuration.scad>

// This model is only parametric for the thickness value. The rest is constant.
// This helps with importing to other models, and helps define a guaranteed area for the nema17
// not including the depth of the motor as that can vary.

// module specific constants
width=45;	// y axis
height=56;	// x axis
centerr=22/2;	// radius of nema axle bearing raised surface
motorcc=31;	// center-center of the motor screw holes for nema17
slotWidth=18-2*M3;	// width of slots for holes

nemaMount();

module nemaMount(){
	difference(){
		// create nema mount
		cube([height, width, thickness]);
		
		// cut opening for nema17 axle
		hull(){
			translate([height/2-slotWidth/2, width/2, -1])
				cylinder(r=centerr+.5, h=thickness+2);
			translate([height/2+slotWidth/2, width/2, -1])
				cylinder(r=centerr+.5, h=thickness+2);
		}
		// position slots for nema17
		translate([height/2-motorcc/2+thickness, width/2-motorcc/2, -1])
			rotate([0,0,180])
			oval();
		translate([height/2-motorcc/2+thickness, width/2+motorcc/2, -1])
			rotate([0,0,180])
			oval();
		translate([height/2+motorcc/2-thickness, width/2-motorcc/2, -1])
			oval();
		translate([height/2+motorcc/2-thickness, width/2+motorcc/2, -1])
			oval();
	}// end difference
}

// slot for nema bolt mount
module oval(){
	hull(){
		cylinder(r=M3/2, h=thickness+2);
		translate([slotWidth, 0, 0])
			cylinder(r=M3/2, h=thickness+2);
	}
}