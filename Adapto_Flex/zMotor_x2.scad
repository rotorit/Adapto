// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

zMotor_Flex();

module zMotor_Flex(){
width=thickness+M5+thickness*2+45+thickness*2+M5+thickness; // over all part width
mcenter=22;	// diameter of nema17 axle bearing raised surface
motorcc=31;	// center-center of the motor screw holes for nema17

	difference(){

		union(){

			// mounting surface to frame
			translate([0, -width/2, 0])
				cube([frameY, width, thickness]);
			hull(){
				translate([-frameY, -frameX/2, 0])
					cube([frameY, frameX, thickness]);
				translate([-frameY, 0, smoothRodOffset])
					rotate([0, 90, 0])
					polycyl(d=frameX, h=frameY);
			}
			translate([-frameY-M5*1.5, -frameX/2, 0])
				cube([frameY, frameX, thickness]);
			translate([-frameY-M5*1.5, 0, 0])
				polycyl(d=frameX, h=thickness);

			// spacer between mounting surface and nemaMount
			translate([0, -45/2, 0])
				cube([thickness, 45, smoothRodOffset+30+motorcc/2+M3]);

			// vertical support arms
			hull(){
				translate([0, -thickness-45/2, 0])
					cube([frameY, thickness, thickness]);
				translate([0, -thickness-45/2, smoothRodOffset+30+motorcc/2+M3-1])
					cube([thickness, thickness, 1]);
			}
			mirror([0,1,0])
				hull(){
					translate([0, -thickness-45/2, 0])
						cube([frameY, thickness, thickness]);
					translate([0, -thickness-45/2, smoothRodOffset+30+motorcc/2+M3-1])
						cube([thickness, thickness, 1]);
				};
			// horizontal support arms
			hull(){
				translate([thickness, -45/2, 0])
					rotate([0,0,180])
					cube([thickness, thickness+M5+thickness*2, thickness]);
				translate([0, -thickness-45/2, smoothRodOffset+30+motorcc/2+M3-1])
					cube([thickness, thickness, 1]);
			}
			mirror([0,1,0])
				hull(){
					translate([thickness, -45/2, 0])
						rotate([0,0,180])
						cube([thickness, thickness+M5+thickness*2, thickness]);
					translate([0, -thickness-45/2, smoothRodOffset+30+motorcc/2+M3-1])
						cube([thickness, thickness, 1]);
				};

		}// end union

		// smooth rod hole
		translate([-frameY-1, 0, smoothRodOffset])
			rotate([0, 90, 0])
			polyhole(d=smoothRod, h=frameY+1);

		// nema center hole
		translate([-1, 0, smoothRodOffset+30])
			rotate([0, 90, 0])
			polyhole(d=mcenter, h=thickness+2);
		// nema bolt holes
		translate([-1, motorcc/2, smoothRodOffset+30-motorcc/2])
			rotate([0, 90, 0])
			polyhole(d=M3, h=thickness+2);
		mirror([0,1,0])
			translate([-1, motorcc/2, smoothRodOffset+30-motorcc/2])
				rotate([0, 90, 0])
				polyhole(d=M3, h=thickness+2);
		translate([-1, motorcc/2, smoothRodOffset+30+motorcc/2])
			rotate([0, 90, 0])
			polyhole(d=M3, h=thickness+2);
		mirror([0,1,0])
			translate([-1, motorcc/2, smoothRodOffset+30+motorcc/2])
				rotate([0, 90, 0])
				polyhole(d=M3, h=thickness+2);

		// holes to attach to the frame
		translate([frameY/2, width/2-M5-thickness, -1])
			polyhole(d=M5,h=thickness+2);
		mirror([0,1,0])
			translate([frameY/2, width/2-M5-thickness, -1])
				polyhole(d=M5,h=thickness+2);
		translate([-frameY-M5*1.5, 0, -1])
			polyhole(d=M5, h=thickness+2);

	}// end difference

}