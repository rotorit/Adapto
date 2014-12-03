include <configuration.scad>;

xBacker();

module xBacker(){
	difference(){
		union(){
			// channel for the Z linear bearings
			translate([-linearBearing[2]-3/2*thickness, -thickness-linearBearing[1]/2, 0])
				cube([linearBearing[2]*2+thickness*3, 2*thickness+linearBearing[1], linearBearing[1]/2+thickness]);

			// x smooth rod base block
			translate([-88/2, 40, 0])
				cube([88, 24, 20+thickness]);

			// radius block between z block connection and x smooth rod base
			//translate([-44, 30, 9+thickness])
			//	cube([88, 10, 5+thickness]);

			// connection between z block and smooth rod base
			hull(){
				translate([-linearBearing[2]-3/2*thickness, thickness+linearBearing[1]/2, 0])
					cube([linearBearing[2]*2+thickness*3, 1, linearBearing[1]/2+thickness]);
				translate([-88/2, 40, 0])
					cube([88, 1, linearBearing[1]/2+thickness]);				
			}

			// smooth rod holders
			translate([xRodDistance/2-0*(thickness+linearBearing[1]/2)/2, 40, 27+thickness+linearBearing[1]/2])
				rotate([-90, 0, 0])
				cylinder(r=thickness+linearBearing[1]/2, h=24);
			translate([-xRodDistance/2-(thickness+linearBearing[1]/2), 40, 0])
				cube([2*thickness+linearBearing[1], 24, 27+thickness+linearBearing[1]/2]);
			translate([-xRodDistance/2+0*(thickness+linearBearing[1]/2)/2, 40, 27+thickness+linearBearing[1]/2])
				rotate([-90, 0, 0])
				cylinder(r=thickness+linearBearing[1]/2, h=24);
			translate([xRodDistance/2-2*(thickness+linearBearing[1]/2)/2, 40, 0])
				cube([2*thickness+linearBearing[1], 24, 27+thickness+linearBearing[1]/2]);
			
			// the linear bearings
			%translate([-linearBearing[2]-1/2*thickness, 0, thickness+linearBearing[1]/2])
				rotate([0, 90, 0])
				cylinder(r=linearBearing[1]/2, h=linearBearing[2]);
			%translate([0*linearBearing[2]+1/2*thickness, 0, thickness+linearBearing[1]/2])
				rotate([0, 90, 0])
				cylinder(r=linearBearing[1]/2, h=linearBearing[2]);
			// the X smooth rods
			%translate([xRodDistance/2-0*(thickness+linearBearing[1]/2)/2, 65, 27+thickness+linearBearing[1]/2])
				rotate([90, 0, 0])
				cylinder(r=smoothRod/2, h=300);
			%translate([-xRodDistance/2+0*(thickness+linearBearing[1]/2)/2, 65, 27+thickness+linearBearing[1]/2])
				rotate([90, 0, 0])
				cylinder(r=smoothRod/2, h=300);
			// The Z smooth rod
			%translate([-300/2, 0, thickness+linearBearing[1]/2])
				rotate([0, 90, 0])
				cylinder(r=smoothRod/2, h=300);
		}// end union

		// remove stuff
		// x smooth rod holes
		translate([xRodDistance/2-0*(thickness+linearBearing[1]/2)/2, 65, 27+thickness+linearBearing[1]/2])
			rotate([90, 0, 0])
			cylinder(r=smoothRod/2, h=300);
		translate([-xRodDistance/2+0*(thickness+linearBearing[1]/2)/2, 65, 27+thickness+linearBearing[1]/2])
			rotate([90, 0, 0])
			cylinder(r=smoothRod/2, h=300);

		// channel for linear bearings
		translate([-linearBearing[2]-1/2*thickness, 0, thickness+linearBearing[1]/2])
			rotate([0, 90, 0])
			cylinder(r=linearBearing[1]/2, h=linearBearing[2]*2+thickness);
		translate([-50, 0, thickness+linearBearing[1]/2])
			rotate([0, 90, 0])
			cylinder(r=smoothRod/2, h=100);

		// zip tie holes
		translate([-2*thickness, (thickness+linearBearing[1]/2)/2+1, -1])
			cube([thickness, 2, linearBearing[1]/2+thickness+2]);
		translate([thickness, (thickness+linearBearing[1]/2)/2+1, -1])
			cube([thickness, 2, linearBearing[1]/2+thickness+2]);
		translate([-linearBearing[2], (thickness+linearBearing[1]/2)/2+1, -1])
			cube([thickness, 2, linearBearing[1]/2+thickness+2]);
		translate([linearBearing[2]-thickness, (thickness+linearBearing[1]/2)/2+1, -1])
			cube([thickness, 2, linearBearing[1]/2+thickness+2]);

		// centre hole to save plastic
		hull(){
			translate([-linearBearing[2]/2, linearBearing[1]/2+thickness, -1])
				cube([linearBearing[2], 1, linearBearing[1]/2+thickness+2]);
			translate([-linearBearing[2]+linearBearing[2]/2/2, 39, -1])
				cube([linearBearing[2]+linearBearing[2]/2, 1, linearBearing[1]/2+thickness+2]);				
		}

		// The curve http://www.wolframalpha.com/input/?i=circle+that+intersects+%2844%2C0%29+and+%2862%2C19%29+and+%2862%2C-19%29 or something similar
		translate([0, 33/2+27+thickness+linearBearing[1]/2+20, -1])
			cylinder(r=685/27, h=30);

		// trim the sides
		translate([88/2, 0, -1])
			cube([100,100,100]);
		translate([-88/2-100, 0, -1])
			cube([100,100,100]);

		// The Z nut trap and hole for Z threaded rod
		translate([-88/2-1, 39+linearBearing[1]/2+screwR, thickness+(zRod+1)/2])
			rotate([0, 90, 0])
			cylinder(r=(zRod+1)/2, h=90);
		translate([-4, 39+linearBearing[1]/2+screwR, thickness+(zRod+1)/2])
			rotate([90, 0, 0])
			rotate([0, 90, 0])
			cylinder(r=zRodnut/2, h=zRodnutThickness+2, $fn=6);

		// nuts traps for M3 nuts and screws to hold the x smooth rods in place
		translate([-xRodDistance/2, linearBearing[1]/2+50, -1])
			cylinder(r=6/2, h=27);
		translate([xRodDistance/2, linearBearing[1]/2+50, -1])
			cylinder(r=6/2, h=27);
		translate([-xRodDistance/2, linearBearing[1]/2+50, -1])
			cylinder(r=M3/2, h=27+thickness+linearBearing[1]/2);
		translate([xRodDistance/2, linearBearing[1]/2+50, -1])
			cylinder(r=M3/2, h=27+thickness+linearBearing[1]/2);
		translate([-xRodDistance/2, linearBearing[1]/2+50, 27+thickness+linearBearing[1]/2-M8/2-4])
			cylinder(r=M3nut/2, h=8, $fn=6);
		translate([xRodDistance/2, linearBearing[1]/2+50, 27+thickness+linearBearing[1]/2-M8/2-4])
			cylinder(r=M3nut/2, h=8, $fn=6);

	}// end difference
}