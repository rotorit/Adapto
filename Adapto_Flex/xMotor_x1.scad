// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>
use <./inc/xBacker.scad>

xMotor_Flex();

module xMotor_Flex(){
xRodDistance=70;

	difference(){

		union(){

			xBacker_Flex();// import the base x backing model

			// nema mounting
			hull(){
				translate([-88/2, 30-18/2-6,  thickness*2+linearBearing[1]])
					cube([88, 1, 1]);
				translate([-88/2, 30+18/2-1,  thickness*2+linearBearing[1]])
					cube([88, 1, thickness+1]);

				translate([0, 30+zRodnut/2+thickness+M3, thickness*2+linearBearing[1]])
					polycyl(d=M3+thickness*2, h=thickness+1);

				translate([1.41*31/2, 30+zRodnut/2+thickness+M3+1.41*31/2, thickness*2+linearBearing[1]])
					polycyl(d=M3+thickness*2, h=thickness+1);
				translate([-1.41*31/2, 30+zRodnut/2+thickness+M3+1.41*31/2, thickness*2+linearBearing[1]])
					polycyl(d=M3+thickness*2, h=thickness+1);
			}

		}// end union

		translate([0, 30+zRodnut/2+thickness+M3, thickness*2+linearBearing[1]-1])
			polyhole(d=M3, h=thickness+3);
		translate([1.41*31/2, 30+zRodnut/2+thickness+M3+1.41*31/2, thickness*2+linearBearing[1]-1])
			polyhole(d=M3, h=thickness+3);
		translate([-1.41*31/2, 30+zRodnut/2+thickness+M3+1.41*31/2, thickness*2+linearBearing[1]-1])
			polyhole(d=M3, h=thickness+3);

		// nema center axle cutout
		hull(){
			translate([0, 30+zRodnut/2+thickness+M3+1.41*31/2, thickness*2+linearBearing[1]-1])
				polyhole(d=22, h=thickness+3);
			translate([0, 30+zRodnut/2+thickness+M3+1.41*31/2, thickness*2+linearBearing[1]-1])
				rotate([0, 0, 45])
				cube([31*2, 31*2, thickness+3]);
		}

		// nema motor shaft and pulley
		%translate([0, 30+zRodnut/2+thickness+M3+1.41*31/2, thickness*2+linearBearing[1]])
			polyhole(d=5, h=thickness+18);
		%translate([0, 30+zRodnut/2+thickness+M3+1.41*31/2, thickness*2+linearBearing[1]+thickness*2+7])
			polyhole(d=15, h=1);
		%translate([0, 30+zRodnut/2+thickness+M3+1.41*31/2, thickness*2+linearBearing[1]+thickness*2])
			polyhole(d=pullyDiameter, h=7);
		%translate([0, 30+zRodnut/2+thickness+M3+1.41*31/2, thickness*2+linearBearing[1]+thickness*2-5])
			polyhole(d=15, h=5);
		%translate([0, 30+zRodnut/2, -45+thickness*2+linearBearing[1]])
			rotate([0, 0, 45])
			cube([45, 45, 45]);

		// make sure the holes for the screws to hold the x smooth rods in place remain clear
		translate([xRodDistance/2, 30-18/2, -1])
			polyhole(d=M3nut, h=thickness*2+linearBearing[1]+thickness+1);
		mirror([1,0,0])
			translate([xRodDistance/2, 30-18/2, -1])
				polyhole(d=M3nut, h=thickness*2+linearBearing[1]+thickness+1);//
		translate([xRodDistance/2, 30-18/2, thickness*2+linearBearing[1]+thickness-1])
			polyhole(d=M3, h=thickness+2+smoothRod/2);
		mirror([1,0,0])
			translate([xRodDistance/2, 30-18/2, thickness*2+linearBearing[1]+thickness-1])
				polyhole(d=M3, h=thickness+2+smoothRod/2);

	}// end difference

}