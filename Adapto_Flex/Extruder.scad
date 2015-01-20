// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

Extruder_RH();

module Extruder_RH(){
pulleyHeight=12; //overall height of hobbed pulley
hobbHeight=rotaryBearing[2]/2; //distance from center of hobb to NEAREST edge of hobbed pulley

	difference(){

		union(){
			// primary extruder body
			polycyl(d=31, h=thickness+pulleyHeight);

			// nema flanges
			translate([31/2, 0, 0])
				polycyl(d=thickness+M3, h=thickness+pulleyHeight);
			translate([0, 31/2, 0])
				polycyl(d=thickness+M3, h=thickness+pulleyHeight);
			translate([-31/2, 0, 0])
				polycyl(d=thickness+M3, h=thickness+pulleyHeight);
			translate([0, -31/2, 0])
				polycyl(d=thickness+M3, h=thickness+pulleyHeight);

			// j-head mount
			#cube([16+thickness, 10,thickness+pulleyHeight]);

		}// end union

		// nema holes
		translate([31/2, 0, -1])
			polyhole(d=M3, h=thickness+pulleyHeight+2);
		translate([0, 31/2, -1])
			polyhole(d=M3, h=thickness+pulleyHeight+2);
		translate([-31/2, 0, -1])
			polyhole(d=M3, h=thickness+pulleyHeight+2);
		translate([0, -31/2, -1])
			polyhole(d=M3, h=thickness+pulleyHeight+2);

		// filament path
		rotate([90, 0, 45])
			translate([pullyDiameter/2, thickness+hobbHeight, -50/2])
			polyhole(d=2, h=50);

		// nema base
		translate([0, 0, -1])
			polyhole(d=22, h=thickness-1);

		// hobbed pulley cutout
		polyhole(d=pulleyHeight+.5, h=thickness+pulleyHeight+2);

	}// end difference

}

