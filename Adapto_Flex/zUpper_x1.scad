// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

translate([-frameX/2-thickness/2, 0, 0])
	rotate([0, 0, 90])
	zUpper_Flex();

translate([frameX/2+thickness/2, 0, 0])
	rotate([0, 0, -90])
	mirror([1,0,0])
	zUpper_Flex();

module zUpper_Flex(){

	difference(){

		union(){

			// mounting surface to frame
			hull(){
				translate([0, -frameY/2, 0])
					cube([thickness, frameY, frameX]);
				translate([smoothRodOffset, 0, 0])
					polycyl(d=frameY, h=frameX);
			}

			hull(){
				translate([0, -frameY/2, 0])
					cube([thickness, frameY, 1]);
				translate([0, 0, frameX*1.5])
					rotate([0, 90, 0])
					polycyl(d=frameY, h=thickness);
			}
			hull(){
				translate([smoothRodOffset, frameY/2-1, 0])
					cube([1, 1, frameX]);
				translate([0, frameY/2, 0])
					cube([thickness, thickness, frameX]);
				translate([-frameX/2, frameY/2, frameX/2])
					rotate([-90, 90, 0])
					polycyl(d=frameX, h=thickness);
			}

		}// end union

		// keep frame clear
		translate([-frameX*2, -frameY/2, -1])
			cube([frameX*2, frameY, frameX*3]);

		// smooth rod hole
		translate([smoothRodOffset, 0, -1])
			polyhole(d=smoothRod, h=frameY+2);

		// holes to attach to the frame
		translate([-1, 0, frameX*1.5])
			rotate([0, 90, 0])
			polyhole(d=M5, h=thickness+2);
		translate([-frameX/2, frameY/2-1, frameX/2])
			rotate([-90, 90, 0])
			polyhole(d=M5, h=thickness+2);

	}// end difference

}