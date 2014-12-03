// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <configuration.scad>
include <xBacker.scad>

xidler();

module xidler(){
	difference(){
		union(){
			hull(){
				translate([-88/2, 40+22/2, 27+thickness+linearBearing[1]/2+thickness+M8/2])
					rotate([0, 90, 0])
					cylinder(r=thickness+.8+M8/2, h=22);
				translate([-88/2, 40+22/2, 27+thickness+linearBearing[1]/2+thickness+M8/2+16])
					rotate([0, 90, 0])
					cylinder(r=thickness+.8+M8/2, h=22);
				translate([-88/2, 40, 0])
					cube([22, 22, 27+thickness+linearBearing[1]/2]);
			}	
		}// end union
		
		// idler hole
		#hull(){
			translate([-88/2-1, 40+22/2, 27+thickness+linearBearing[1]/2+thickness+M8/2])
				rotate([0, 90, 0])
				cylinder(r=M8/2, h=88/2);
			translate([-88/2-1, 40+22/2, 27+thickness+linearBearing[1]/2+thickness+M8/2+16])
				rotate([0, 90, 0])
				cylinder(r=M8/2, h=88/2);
		}
		#translate([-88/2+22, 40+22/2, 27+thickness+linearBearing[1]/2+thickness+M8/2])
			rotate([0, 90, 0])
			cylinder(r=M8, h=22);
	
	}// end difference
}