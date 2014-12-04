// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <configuration.scad>


width=round(thickness+M3/2+motorcc+M3/2+thickness);
length=round(thickness+(18-M3)+motorcc+thickness);
// Uncomment echo to check rounding values
//echo("Width: ", thickness+M3/2+motorcc+M3/2+thickness);
//echo("Rounded Width: ", width);
//echo("Length: ", thickness+(18-M3)+motorcc+thickness);
//echo("Rounded Length: ",length);

nemaMount();

module nemaMount(){
	difference(){
		// create nema mount
		cube([length, width, thickness]);
		
		// cut opening for nema17 axle
		hull(){
			translate([thickness+centerr+(18-2*M3)/2, thickness+M3/2+motorcc/2, -1])
				cylinder(r=centerr, h=10);
			translate([thickness+centerr+(18-2*M3)/2+(18-2*M3), thickness+M3/2+motorcc/2, -1])
				cylinder(r=centerr, h=10);
		}
		// position slots for nema17
		translate([M3/2+thickness, M3/2+thickness, -1])
			oval();
		translate([M3/2+thickness, M3/2+thickness+motorcc, -1])
			oval();
		translate([M3/2+thickness+motorcc, M3/2+thickness, -1])
			oval();
		translate([M3/2+thickness+motorcc, M3/2+thickness+motorcc, -1])
			oval();
	}// end difference
}

// slot for nema bolt mount
module oval(){
	hull(){
		cylinder(r=M3/2, h=10);
		translate([18-2*M3, 0, 0])
			cylinder(r=M3/2, h=10);
	}
}