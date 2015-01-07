// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./configuration.scad>
use <./polyarc.scad>

xBacker_Flex();

module xBacker_Flex(){
xRodDistance=70;

	difference(){

		union(){

			// channel for the Z linear bearings
			translate([-linearBearing[2]-thickness/2, 0, linearBearing[1]/2+thickness])
				rotate([0,90,0])
				polycyl(d=linearBearing[1]+thickness*2, h=linearBearing[2]*2+thickness);

			// connection between z block and smooth rods
			hull(){
				translate([-linearBearing[2]-thickness/2, 0, 0])
					cube([linearBearing[2]*2+thickness, 1, linearBearing[1]+thickness*2]);
				translate([-44, 30-24/2, 0])
					cube([88, 24, linearBearing[1]+thickness*2]);				
			}

			// smooth rod holders
			translate([xRodDistance/2, 30-24/2, thickness*2+linearBearing[1]+thickness*2+2+smoothRod/2])
				rotate([-90, 0, 0])
				polycyl(d=linearBearing[1]+thickness*2, h=24);
			translate([xRodDistance/2-2*(thickness+linearBearing[1]/2)/2, 30-24/2, 0])
				cube([linearBearing[1]+thickness*2, 24, thickness*2+linearBearing[1]+thickness*2+2+smoothRod/2]);
			mirror([1,0,0])
				translate([xRodDistance/2, 30-24/2, thickness*2+linearBearing[1]+thickness*2+2+smoothRod/2])
					rotate([-90, 0, 0])
					polycyl(d=linearBearing[1]+thickness*2, h=24);
			mirror([1,0,0])
				translate([xRodDistance/2-2*(thickness+linearBearing[1]/2)/2, 30-24/2, 0])
					cube([linearBearing[1]+thickness*2, 24, thickness*2+linearBearing[1]+thickness*2+2+smoothRod/2]);

			// the linear bearings
			%translate([1/2*thickness, 0, thickness+linearBearing[1]/2])
				rotate([0, 90, 0])
				polycyl(d=linearBearing[1], h=linearBearing[2]);
			mirror([1,0,0])
				%translate([1/2*thickness, 0, thickness+linearBearing[1]/2])
					rotate([0, 90, 0])
					polycyl(d=linearBearing[1], h=linearBearing[2]);

			// the X smooth rods
			%translate([xRodDistance/2, 65, thickness*2+linearBearing[1]+thickness*2+2+smoothRod/2])
				rotate([90, 0, 0])
				polycyl(d=smoothRod, h=300);
			mirror([1,0,0])
				%translate([xRodDistance/2, 65, thickness*2+linearBearing[1]+thickness*2+2+smoothRod/2])
					rotate([90, 0, 0])
					polycyl(d=smoothRod, h=300);

			// The Z smooth rod
			%translate([-150, 0, thickness+linearBearing[1]/2])
				rotate([0, 90, 0])
				polycyl(d=smoothRod, h=300);

		}// end union

		// x smooth rod holes
		translate([xRodDistance/2, 65, thickness*2+linearBearing[1]+thickness*2+2+smoothRod/2])
			rotate([90, 0, 0])
			polyhole(d=smoothRod+.1, h=300);
		mirror([1,0,0])
				translate([xRodDistance/2, 65, thickness*2+linearBearing[1]+thickness*2+2+smoothRod/2])
					rotate([90, 0, 0])
					polyhole(d=smoothRod+.1, h=300);

		// channel for linear bearings
		translate([-300/2, 0, thickness+linearBearing[1]/2])
			rotate([0, 90, 0])
			polyhole(d=linearBearing[1], h=300);

		// cutout to prevent carriage from hitting smooth rod keepers
		translate([1/2*thickness+linearBearing[2], 0, thickness+linearBearing[1]/2])
			rotate([0, 90, 0])
			polyhole(d=smoothRod+thickness*2+2, h=20);
		mirror([1,0,0])
			translate([1/2*thickness+linearBearing[2], 0, thickness+linearBearing[1]/2])
				rotate([0, 90, 0])
				polyhole(d=smoothRod+thickness*2+2, h=20);

		// z bearing channel split
		translate([-linearBearing[2]-thickness/2-1,-1, thickness+linearBearing[1]-1])
			cube([linearBearing[2]*2+thickness+2 , 2, thickness+2]);

		// zip tie holes
		difference(){
			translate([thickness/2+linearBearing[2]/2, 0, thickness+linearBearing[1]/2])
				rotate([0,90,0])
				polycyl(d=linearBearing[1]+thickness*2+2, h=thickness);
			translate([thickness/2+linearBearing[2]/2, 0, thickness+linearBearing[1]/2])
				rotate([0,90,0])
				polycyl(d=linearBearing[1]+thickness*2-2, h=thickness);
		}
		mirror([1,0,0])
			difference(){
				translate([thickness/2+linearBearing[2]/2, 0, thickness+linearBearing[1]/2])
					rotate([0,90,0])
					polycyl(d=linearBearing[1]+thickness*2+2, h=thickness);
				translate([thickness/2+linearBearing[2]/2, 0, thickness+linearBearing[1]/2])
					rotate([0,90,0])
					polycyl(d=linearBearing[1]+thickness*2-2, h=thickness);
			}


		// curve to expose Z nut trap
		translate([0, 30+50/2, -1])
			polyhole(d=48, h=linearBearing[1]+thickness*2+2);

		// trim the sides
		translate([44, 0, -1])
			cube([100,100,100]);
		mirror([1,0,0])
			translate([44, 0, -1])
				cube([100,100,100]);

		// The Z nut trap and hole for Z threaded rod
		translate([-45, 30, linearBearing[1]/2+thickness])
			rotate([0, 90, 0])
			polyhole(d=zRod+1, h=90);
		translate([-ceil(zRodnutThickness+1)/2, 30, linearBearing[1]/2+thickness])
			rotate([90, 0, 0])
			rotate([0, 90, 0])
			polynut(d=zRodnut+.1, h=ceil(zRodnutThickness+1));

		// nuts traps for M3 nuts and screws to hold the x smooth rods in place
		translate([xRodDistance/2, 38, -1])
			polyhole(d=M3nut, h=thickness*2+linearBearing[1]+thickness);
		mirror([1,0,0])
			translate([xRodDistance/2, 38, -1])
				polyhole(d=M3nut, h=thickness*2+linearBearing[1]+thickness);
		translate([xRodDistance/2, 38, thickness*2+linearBearing[1]+thickness])
			polyhole(d=M3, h=thickness+2+smoothRod/2);
		mirror([1,0,0])
			translate([xRodDistance/2, 38, thickness*2+linearBearing[1]+thickness])
				polyhole(d=M3, h=thickness+2+smoothRod/2);
		translate([xRodDistance/2, 38, thickness*2+linearBearing[1]+thickness*2-M3nutThickness])
			polynut(d=M3nut, h=M3nutThickness*2+2);
		mirror([1,0,0])
			translate([xRodDistance/2, 38, thickness*2+linearBearing[1]+thickness*2-M3nutThickness])
				polynut(d=M3nut, h=M3nutThickness*2+2);

	}// end difference

}// end module