// Copyright (C) 2013 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/

// These Z couplers are designed to fit on the Z motor shaft and drive lock nuts on the Z threaded rod
// Use an M3 lock nut and a short (8-15mm?) M3 screw or grub screw or set screw to 
// fix the coupler to the motor shaft. This works best if the motor shaft has a flat (eg. D-shaped, not round)
// The advantage of this design over tubing (see below) is that the X axis should lift out of the
// couplers if the head crashes avoiding things like
// http://www.smidgeindustriesltd.com/reprap/fomox_Z_springs_are_bad_mkay.jpg
//
// For M5 Z threaded rod you can also try using aquarium air tubing instead (typical ID 4mm OD 6mm)
// Held on with zip ties.

include <configuration.scad>;

motorShaft=min(5, M5);// Diameter of Z motor shaft in mm. We could use =M5 from 
						  // configuration.scad but we want a slightly tighter fit here
height=20;// height of the whole coupler

// The next two values should be all you need to change if you want to use M8 (or other) threaded on Z instead of M5
nutTrap=M5nut;// Change this to M8nut if your Z uses M8 threaded rod. Use hole_calibration.scad to fit
nutThickness=M5nutThickness;// or M8nutThickness

$fn=111;// wild guess

// render the part
zCoupler();


module zCoupler(){
	difference(){
		union(){
			cylinder(r=nutTrap/2+thickness, h=height);
		}
		translate([0, 0, height-nutThickness]) cylinder(r=nutTrap/2, h=111, $fn=6);
		hull(){
			translate([motorShaft/2+1.5, 0, M3nut]) rotate([0, 90, 0]) cylinder(r=M3nut/2, h=M3nutThickness, $fn=6);
			translate([motorShaft/2+1.5, 0, -M3nut]) rotate([0, 90, 0]) cylinder(r=M3nut/2, h=M3nutThickness, $fn=6);
		}
		translate([0, 0, M3nut]) rotate([0, 90, 0]) cylinder(r=M3/2, h=nutTrap/2+thickness+1);
		translate([0, 0, -1]) cylinder(r=motorShaft/2, h=height+2);

	}
}