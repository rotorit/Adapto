// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>
use <./inc/xBacker.scad>

xIdler();

module xIdler(){

	difference(){

		union(){

			xBacker();// import the base x backing model

			// idler mount tab
			hull(){
				translate([-44, 40, 24+thickness+linearBearing[1]/2+thickness+M8/2])
					rotate([0, 90, 0])
					cube([1, (thickness+.8+M8/2)*2+4, 22]);
				translate([-44, 52, 27+thickness+linearBearing[1]/2+thickness+M8/2+16])
					rotate([0, 90, 0])
					polycyl(d=M8+thickness*2, h=22);
			}

		}// end union
		
		// idler slot hole
		hull(){
			translate([-45, 52, 27+thickness+linearBearing[1]/2+thickness+M8])
				rotate([0, 90, 0])
				polycyl(d=M8, h=34);
			translate([-45, 52, 27+thickness+linearBearing[1]/2+thickness+M8/2+16])
				rotate([0, 90, 0])
				polycyl(d=M8, h=34);
		}

		// carve washer space at base of idler slot
		translate([-22, 52, 27+thickness+linearBearing[1]/2+thickness+M8])
			rotate([0, 90, 0])
			polycyl(d=18, h=11);
	
	}// end difference

}

