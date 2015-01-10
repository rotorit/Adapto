// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

// Printing on its side will make the skin continuous over the hump and much stronger
rotate([0,90,0])
	yClamp_Flex();

module yClamp_Flex(){
width=frameX;

	difference(){

		union(){

			// center hump
			translate([-width/2, 0, smoothRod/2-.4])
				rotate([0,90,0]) 
				polycyl(d=smoothRod+thickness*2, h=width);

			// bolt flanges
			hull(){
				translate([0, width/2+thickness+M5/2, 0])
					polycyl(d=width, h=thickness);
				translate([0, -width/2-thickness-M5/2, 0])
					polycyl(d=width, h=thickness);
			}

		}// end union

		// remove remainder of center hump to create the arch for smooth rod
		translate([-1-width/2, 0, smoothRod/2-.4])
			rotate([0,90,0])
			polyhole(d=smoothRod, h=width+2);
		translate([-1-width/2, -smoothRod/2, -1])
			cube([width+2, smoothRod, smoothRod/2+1]);
		translate([0, 0, -smoothRod/2])
			cube([width*2, width*2, smoothRod], center=true);

		// holes
		translate([0, smoothRod+thickness+M5/2, -1])
			polyhole(d=M5, h=thickness+2);
		mirror([0,1,0])
			translate([0, smoothRod+thickness+M5/2, -1])
				polyhole(d=M5, h=thickness+2);

	}// end difference

}