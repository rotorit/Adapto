// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

zUpper_Flex();

module zUpper_Flex(){

	difference(){

		union(){

			// mounting surface to frame
			hull(){
				translate([0, -frameX/2, 0])
					cube([frameY, frameX, thickness]);
				translate([0, 0, smoothRodOffset])
					rotate([0, 90, 0])
					polycyl(d=frameX, h=frameY);
			}

			hull(){
				translate([0, -frameX/2, 0])
					cube([1, frameX, thickness]);
				translate([frameY+M5*1.5, 0, 0])
					polycyl(d=frameX, h=thickness);
			}

			hull(){
				translate([0, -frameX/2, 0])
					cube([thickness, frameX, 1]);
				translate([0, 0, smoothRodOffset+smoothRod+M5*1.5])
					rotate([0, 90, 0])
					polycyl(d=frameX, h=thickness);
			}

		}// end union

		// smooth rod hole
		translate([-1, 0, smoothRodOffset])
			rotate([0, 90, 0])
			polyhole(d=smoothRod, h=frameY+2);

		// holes to attach to the frame
		translate([frameY+M5*1.5, 0, -1])
			polyhole(d=M5, h=thickness+2);
		translate([-1, 0, smoothRodOffset+smoothRod+M5*1.5])
			rotate([0, 90, 0])
			polyhole(d=M5, h=thickness+2);

	}// end difference

}