// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

pulleyHeight=12; //overall height of hobbed pulley
jheadDiameter=16;


Extruder_RH();

module Extruder_RH(){

	difference(){

		union(){
			// primary extruder body
			rotate([0, 0, 45])
				primaryBody();

			// j-head mount
			translate([0, 31/2-2, 0])
				cube([31/2, 4+4.8+4.6, thickness*2+jheadDiameter]);

			// backer
			translate([31/2-2, -31/2, 0])
				cube([2, 31, thickness*2+jheadDiameter]);
			translate([0, -31/2, 0])
				cube([31/2, 2, thickness*2+jheadDiameter]);

		}// end union

		// filament path
		#translate([pullyDiameter/2, 50/2, (thickness*2+jheadDiameter)/2])
			rotate([90, 0, 0])
			polyhole(d=2, h=50);

		// nema base
		translate([0, 0, -1])
			polyhole(d=22, h=thickness-1);
		%polycyl(d=5, h=thickness+18);

		// idler pulley
		%translate([9/2+pullyDiameter/2-1, 0, (thickness*2+jheadDiameter)/2-2.5/2])
			polycyl(d=9, h=2.5);
		hull(){
			translate([9/2+pullyDiameter/2-1, 0, (thickness*2+jheadDiameter)/2-3/2])
				polycyl(d=9.5, h=3);
			translate([9+pullyDiameter, 0, (thickness*2+jheadDiameter)/2-3/2])
				polycyl(d=9.5, h=3);
		}
		%translate([9/2+pullyDiameter/2-1, 0, (thickness*2+jheadDiameter)/2-18.5/2])
			polycyl(d=4, h=18.5);
		hull(){
			translate([9/2+pullyDiameter/2-1, 0, (thickness*2+jheadDiameter)/2-18.5/2])
				polycyl(d=4, h=18.5);
			translate([9+pullyDiameter, 0, (thickness*2+jheadDiameter)/2-18.5/2])
				polycyl(d=4, h=18.5);
		}

		// idler pulley tension springs
		translate([9/2+pullyDiameter/2-1, 0, (thickness*2+jheadDiameter)/2-18.5/2+6/2])
			rotate([0, 90, 0])
			polyhole(d=5, h=15);
		translate([9/2+pullyDiameter/2-1, 0, (thickness*2+jheadDiameter)/2+18.5/2-6/2])
			rotate([0, 90, 0])
			polyhole(d=5, h=15);

		// hobbed pulley cutout
		hull(){
			translate([0, 0, -1])
				polyhole(d=pulleyHeight+.5, h=thickness*2+jheadDiameter+2);
			translate([-14, 0, -1])
				polyhole(d=pulleyHeight+3.2, h=thickness*2+jheadDiameter+2);
		}
		translate([-17, -20, -1])
			cube([20, 20, thickness*2+jheadDiameter+2]);

		// jhead body
		hull(){
			translate([pullyDiameter/2, 31/2, (thickness*2+jheadDiameter)/2])
				rotate([-90, 0, 0])
				polyhole(d=jheadDiameter, h=4.8);
			translate([-pullyDiameter/2, 31/2, (thickness*2+jheadDiameter)/2])
				rotate([-90, 0, 0])
				polyhole(d=jheadDiameter, h=4.8);
		}
		translate([pullyDiameter/2, 31/2+4.6, (thickness*2+jheadDiameter)/2])
			rotate([-90, 0, 0])
			polyhole(d=12, h=5);
		translate([-pullyDiameter/2, 31/2+4.6, (thickness*2+jheadDiameter)/2-5.5])
			cube([12, 5, 11]);
		hull(){
			translate([pullyDiameter/2, 31/2+4.8+4.6, (thickness*2+jheadDiameter)/2])
				rotate([-90, 0, 0])
				polyhole(d=jheadDiameter, h=30);
			translate([-pullyDiameter/2, 31/2+4.8+4.6, (thickness*2+jheadDiameter)/2])
				rotate([-90, 0, 0])
				polyhole(d=jheadDiameter, h=30);
		}

	}// end difference

}

module primaryBody(){

	difference(){

		union(){
			// primary extruder body
			polycyl(d=31, h=thickness*2+jheadDiameter);

			// nema flanges
			translate([31/2, 0, 0])
				polycyl(d=thickness+M3, h=thickness*2+jheadDiameter);
			translate([0, 31/2, 0])
				polycyl(d=thickness+M3, h=thickness*2+jheadDiameter);
			translate([-31/2, 0, 0])
				polycyl(d=thickness+M3, h=thickness*2+jheadDiameter);
			translate([0, -31/2, 0])
				polycyl(d=thickness+M3, h=thickness*2+jheadDiameter);

		}// end union

		// nema holes
		translate([31/2, 0, -1])
			polyhole(d=M3, h=thickness*2+jheadDiameter+2);
		translate([0, 31/2, -1])
			polyhole(d=M3, h=thickness*2+jheadDiameter+2);
		translate([-31/2, 0, -1])
			polyhole(d=M3, h=thickness*2+jheadDiameter+2);
		translate([0, -31/2, -1])
			polyhole(d=M3, h=thickness*2+jheadDiameter+2);

	}// end difference

}