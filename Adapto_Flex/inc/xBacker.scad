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
			translate([-88/2, 0, linearBearing[1]/2+thickness])
				rotate([0,90,0])
				polycyl(d=linearBearing[1]+thickness*2, h=88);

			// connection between z block and smooth rods
				translate([-88/2, 0, 0])
					cube([88, 30+18/2, linearBearing[1]+thickness*2]);				

			// smooth rod holders
			translate([xRodDistance/2, 30+18/2, thickness*2+linearBearing[1]+thickness*2+2+smoothRod/2])
				rotate([90, 0, 0])
				polycyl(d=linearBearing[1]+thickness*2, h=24);
			mirror([1,0,0])
				translate([xRodDistance/2, 30+18/2, thickness*2+linearBearing[1]+thickness*2+2+smoothRod/2])
					rotate([90, 0, 0])
					polycyl(d=linearBearing[1]+thickness*2, h=24);
			translate([-88/2, 30-18/2-6, 0])
				cube([88, 24, thickness*2+linearBearing[1]+thickness*2+2+smoothRod/2+1]);
			
			// the linear bearings
			%translate([88/2-linearBearing[2], 0, thickness+linearBearing[1]/2])
				rotate([0, 90, 0])
				polycyl(d=linearBearing[1], h=linearBearing[2]);
			mirror([1,0,0])
				%translate([88/2-linearBearing[2], 0, thickness+linearBearing[1]/2])
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

		// z bearing channel split
		translate([-90/2, -thickness-linearBearing[1]/2-1, thickness+linearBearing[1]/2-1])
			cube([90 , thickness+2, 2]);

		// zip tie holes
		difference(){
			translate([88/2-linearBearing[2]/2, 0, thickness+linearBearing[1]/2])
				rotate([0,90,0])
				polycyl(d=linearBearing[1]+thickness*2+5, h=thickness);
			translate([88/2-linearBearing[2]/2, 0, thickness+linearBearing[1]/2])
				rotate([0,90,0])
				polycyl(d=linearBearing[1]+thickness*2, h=thickness);
		}
		mirror([1,0,0])
			difference(){
				translate([88/2-linearBearing[2]/2, 0, thickness+linearBearing[1]/2])
					rotate([0,90,0])
					polycyl(d=linearBearing[1]+thickness*2+5, h=thickness);
				translate([88/2-linearBearing[2]/2, 0, thickness+linearBearing[1]/2])
					rotate([0,90,0])
					polycyl(d=linearBearing[1]+thickness*2, h=thickness);
			}
		difference(){
			translate([-thickness/2, 0, thickness+linearBearing[1]/2])
				rotate([0,90,0])
				polycyl(d=linearBearing[1]+thickness*2+5, h=thickness);
			translate([-thickness/2, 0, thickness+linearBearing[1]/2])
				rotate([0,90,0])
				polycyl(d=linearBearing[1]+thickness*2, h=thickness);
		}


		// curve to expose Z nut trap
		translate([0, 30+50/2, -1])
			polyhole(d=48, h=thickness*2+linearBearing[1]+thickness*2+2+smoothRod);

		// curve to expose Z nut trap
		translate([0, 30-24/2-thickness, thickness*2+linearBearing[1]+thickness*2+2+smoothRod-1.25])
			rotate([-90, 0, 0])
			polyhole(d=41.25, h=linearBearing[2]+thickness*2);

		// trim the sides
		translate([44, -40, -1])
			cube([100,100,100]);
		mirror([1,0,0])
			translate([44, -40, -1])
				cube([100,100,100]);

		// The Z nut trap and hole for Z threaded rod
		translate([ceil(zRodnutThickness+1)/2+.3, 30, linearBearing[1]/2+thickness])
			rotate([0, 90, 0])
			polyhole(d=zRod+1, h=50);
		translate([-ceil(zRodnutThickness+1)/2-.3, 30, linearBearing[1]/2+thickness])
			rotate([0, -90, 0])
			polyhole(d=zRod+1, h=50);
		translate([-ceil(zRodnutThickness+1)/2, 30, linearBearing[1]/2+thickness])
			rotate([90, 0, 0])
			rotate([0, 90, 0])
			polynut(d=zRodnut+.1, h=ceil(zRodnutThickness+1));

		// nuts traps for M3 nuts and screws to hold the x smooth rods in place
		translate([xRodDistance/2, 30-18/2, -1])
			polyhole(d=M3nut, h=thickness*2+linearBearing[1]+thickness+1);
		mirror([1,0,0])
			translate([xRodDistance/2, 30-18/2, -1])
				polyhole(d=M3nut, h=thickness*2+linearBearing[1]+thickness+1);
		translate([xRodDistance/2, 30-18/2, thickness*2+linearBearing[1]+thickness-1])
			polyhole(d=M3, h=thickness+2+smoothRod/2);
		mirror([1,0,0])
			translate([xRodDistance/2, 30-18/2, thickness*2+linearBearing[1]+thickness-1])
				polyhole(d=M3, h=thickness+2+smoothRod/2);
		translate([xRodDistance/2, 30-18/2, thickness*2+linearBearing[1]+thickness*2-M3nutThickness])
			polynut(d=M3nut, h=M3nutThickness*2+2);
		mirror([1,0,0])
			translate([xRodDistance/2, 30-18/2, thickness*2+linearBearing[1]+thickness*2-M3nutThickness])
				polynut(d=M3nut, h=M3nutThickness*2+2);

	}// end difference

}// end module