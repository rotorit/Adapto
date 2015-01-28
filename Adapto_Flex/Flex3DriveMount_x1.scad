// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>		

Flex3Drive_Mount();

module Flex3Drive_Mount(){

    difference(){

	union(){
//	    translate([5, 70/2-20-12-2, 26.5])
//		rotate([90,-90,0])
//		import("./Flex3DriveBase.stl");
//	    translate([5.25, 70/2-20-12-2-18, 24])
//		rotate([90,-90,0])
//		import("./Flex3DriveTop.stl");
	    // Flex3Drive mount
	    translate([-25.5, 70/2-20-12, 0])
		cube([61, thickness, thickness+32]);
//	    translate([-29, 70/2-20-12, 0])
//		cube([66, thickness+2, thickness]);
    
	    // carriage mount wings
	    hull(){
		translate([100/2-5, -70/2+15, 0])
		    polycyl(d=M5*2, h=thickness);
		translate([61-25.5, 70/2-20-12, 0])
		    cube([1, thickness, thickness+32]);
	    }
	    hull(){
		translate([100/2-5, 70/2-20, 0])
		    polycyl(d=M5*2, h=thickness);
		translate([61-25.5, 70/2-20-12, 0])
		    cube([1, thickness, thickness+32]);
	    }
	    hull(){
		translate([-100/2+5, -70/2+15, 0])
		    polycyl(d=M5*2, h=thickness);
		translate([-25.5-1, 70/2-20-12, 0])
		    cube([1, thickness, thickness+32]);
	    }
	    hull(){
		translate([-100/2+5, 70/2-20, 0])
		    polycyl(d=M5*2, h=thickness);
		translate([-25.5-1, 70/2-20-12, 0])
		    cube([1, thickness, thickness+32]);
	    }

	}// end union

	// jhead hole
	translate([0, 70/2-33, 14.6])
	    rotate([-90, 0, 0])
	    polyhole(d=17, h=thickness+2);
    
	// Flex3Drive mount holes
	translate([0, 70/2-33, 13.5])
	    rotate([-90, 0, 0])
	    polyhole(d=M5, h=thickness+2);
	translate([30, 70/2-33, 19.6])
	    rotate([-90, 0, 0])
	    polyhole(d=M5, h=thickness+2);
	translate([-20, 70/2-33, 19.6])
	    rotate([-90, 0, 0])
	    polyhole(d=M5, h=thickness+2);
    
	// carriage mount holes
	translate([100/2-5, 70/2-20, -1])
	    polyhole(d=M5, h=thickness*2);
	translate([-100/2+5, 70/2-20, -1])
	    polyhole(d=M5, h=thickness*2);
	translate([100/2-5, -70/2+15, -1])
	    polyhole(d=M5, h=thickness*2);
	translate([-100/2+5, -70/2+15, -1])
	    polyhole(d=M5, h=thickness*2);
    
	// carriage mount flats
	translate([100/2-5, 70/2-20, thickness])
	    polyhole(d=M5*2, h=thickness+30);
	translate([-100/2+5, 70/2-20, thickness])
	    polyhole(d=M5*2, h=thickness+30);
	translate([100/2-5, -70/2+15, thickness])
	    polyhole(d=M5*2, h=thickness+30);
	translate([-100/2+5, -70/2+15, thickness])
	    polyhole(d=M5*2, h=thickness+30);

    }// end difference

}