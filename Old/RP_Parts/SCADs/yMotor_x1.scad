// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

yMotor();

module yMotor(){

	difference(){

		union(){
			// frame mount tab
			translate([-frameX, 13, 0])
				cube([frameX+thickness, thickness, 48+thickness]);

			// nema mount
			cube([thickness+42, thickness+9, thickness]);
			cube([thickness+10, thickness+42, thickness]);
			hull(){
				translate([thickness+9, thickness+8, 0])
					cube([12, 1, thickness]);
				translate([thickness+9, thickness+8, 0])
					cube([1, 12, thickness]);
			}

			// triangle braces
			hull(){
				cube([thickness+1, thickness, 48+thickness]);
				cube([thickness+42, thickness, thickness]);
			}
			hull(){
				cube([thickness+1, thickness+13+frameY, 48+thickness]);
				cube([thickness+1, thickness+42, thickness]);
			}			
			hull(){
				translate([-frameX, 13, 0])
					cube([frameX+thickness, thickness, thickness]);
				cube([thickness, thickness+13, thickness]);
			}
			hull(){
				translate([-frameX/4, 13, 0])
					cube([frameX/4+thickness, thickness, thickness+M5*2]);
				cube([thickness, thickness+13, thickness+M5*2]);
			}

		}// end union

		// frame mount holes
		translate([-frameX/2, thickness+14, thickness+M5])
			rotate([90,0,0])
			polyhole(d=M5, h=thickness+2);
		translate([-frameX/2, thickness+14, 48+thickness-M5])
			rotate([90,0,0])
			polyhole(d=M5, h=thickness+2);

		// inset frame mount hole
		translate([-1, thickness+13+frameY/2, 48/2+thickness])
			rotate([0,90,0])
			polyhole(d=M5, h=thickness+2);
		translate([thickness/2, thickness+13+frameY/2, 48/2+thickness])
			rotate([0,90,0])
			polyhole(d=M5nut*2, h=thickness);

		// nema holes
		translate([thickness+6.5,thickness+5.5,-1])
			polyhole(d=M3, h=thickness+2);
		translate([thickness+6.5+31,thickness+5.5,-1])
			polyhole(d=M3, h=thickness+2);
		translate([thickness+6.5,thickness+5.5+31,-1])
			polyhole(d=M3, h=thickness+2);
		// radius around nema axle
		translate([thickness+6.5+31/2,thickness+5.5+31/2,-1])
			polycyl(d=24, h=thickness+2);

	}// end difference

}