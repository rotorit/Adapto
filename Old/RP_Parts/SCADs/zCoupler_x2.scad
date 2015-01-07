// Copyright (C) 2013 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>;
use <./inc/polyarc.scad>;

// These Z couplers are designed to fit on the Z motor shaft and drive lock nuts on the Z threaded rod
// Use an M3 lock nut and a short (8-15mm?) M3 screw or grub screw or set screw to 
// fix the coupler to the motor shaft. This works best if the motor shaft has a flat (eg. D-shaped, not round)
// The advantage of this design over tubing (see below) is that the X axis should lift out of the
// couplers if the head crashes avoiding things like
// http://www.smidgeindustriesltd.com/reprap/fomox_Z_springs_are_bad_mkay.jpg
//
// For M5 Z threaded rod you can also try using aquarium air tubing instead (typical ID 4mm OD 6mm)
// Held on with zip ties.


// Diameter of Z motor shaft in mm. We could use =M5 from 
// configuration.scad but we want a slightly tighter fit here
// so we will take the smaller of the two.
motorShaft=min(5, M5);
// height of the whole coupler
height=20;


// render the part
zCoupler();


module zCoupler(){

	difference(){

		union(){

			cylinder(r=zRodnut/2+thickness, h=height);

		}// end union

		translate([0, 0, height-zRodnutThickness])
			polynut(d=zRodnut, h=111);
		hull(){
			translate([motorShaft/2+1.5, 0, M3nut])
				rotate([0, 90, 0])
				polynut(d=M3nut, h=M3nutThickness);
			translate([motorShaft/2+1.5, 0, -M3nut])
				rotate([0, 90, 0])
				polynut(d=M3nut, h=M3nutThickness);
		}
		translate([0, 0, M3nut])
			rotate([0, 90, 0])
			polyhole(d=M3, h=zRodnut/2+thickness+1);
		translate([0, 0, -1])
			polyhole(d=motorShaft, h=height+2);

	}// end difference
}