// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

xCarriage_Flex();

module xCarriage_Flex(){
xRodDistance=70;

	difference(){

		union(){

			// poorly implemented support for the belt channel
			// dont use unless your slicer is having a bad time working it out on its own
			//support();

			// base plate
			translate([-100/2, -xRodDistance/2, 0])
				cube([100, xRodDistance, thickness]);

			// belt block
			hull(){
				translate([-50/2, xRodDistance/2, linearBearing[1]/2+thickness/2])
					cube([50, 30, thickness]);
				translate([-33, xRodDistance/2, linearBearing[1]/2+thickness/2])
					cube([1, linearBearing[1]/2+thickness-1, thickness]);
				#translate([32, xRodDistance/2, linearBearing[1]/2+thickness/2])
					cube([1, linearBearing[1]/2+thickness-1, thickness]);
			}

			// linear bearing traps
			translate([100/2-linearBearing[2], xRodDistance/2, thickness+linearBearing[1]/2])
				rotate([0, 90, 0])
				polycyl(d=linearBearing[1]+thickness*2, h=linearBearing[2]);
			translate([-100/2, xRodDistance/2, thickness+linearBearing[1]/2])
				rotate([0, 90, 0])
				polycyl(d=linearBearing[1]+thickness*2, h=linearBearing[2]);
			translate([-linearBearing[2]/2, -xRodDistance/2, thickness+linearBearing[1]/2])
				rotate([0, 90, 0])
				polycyl(d=linearBearing[1]+thickness*2, h=linearBearing[2]);

			// back plate bearing trap reinforcements
			translate([linearBearing[2]/2-thickness, -xRodDistance/2, 0])
				cube([thickness*3, xRodDistance, linearBearing[0]]);
			translate([-linearBearing[2]/2-thickness*2, -xRodDistance/2, 0])
				cube([thickness*3, xRodDistance, linearBearing[0]]);

			// bolt head raised traps
			translate([100/2-5, xRodDistance/2-20, thickness])
				polycyl(d=M5nut*2, h=M5nutThickness);
			translate([-100/2+5, xRodDistance/2-20, thickness])
				polycyl(d=M5nut*2, h=M5nutThickness);
			translate([100/2-5, -xRodDistance/2+15, thickness])
				polycyl(d=M5nut*2, h=M5nutThickness);
			translate([-100/2+5, -xRodDistance/2+15, thickness])
				polycyl(d=M5nut*2, h=M5nutThickness);

			// the X smooth rods
			%translate([-300/2, xRodDistance/2, thickness+linearBearing[1]/2])
				rotate([90, 0, 90])
				polycyl(d=smoothRod, h=300);
			%translate([-300/2, -xRodDistance/2, thickness+linearBearing[1]/2])
				rotate([90, 0, 90])
				polycyl(d=smoothRod, h=300);

			// the linear bearings
			%translate([100/2-linearBearing[2], xRodDistance/2, thickness+linearBearing[1]/2])
				rotate([0, 90, 0])
				polycyl(d=linearBearing[1], h=linearBearing[2]);
			%translate([-100/2, xRodDistance/2, thickness+linearBearing[1]/2])
				rotate([0, 90, 0])
				polycyl(d=linearBearing[1], h=linearBearing[2]);

			%translate([-linearBearing[2]/2, -xRodDistance/2, thickness+linearBearing[1]/2])
				rotate([0, 90, 0])
				polycyl(d=linearBearing[1], h=linearBearing[2]);

		}// end union

		// belt channel
		translate([-25/2, xRodDistance/2+20-thickness, linearBearing[1]/2+thickness/2-1])
			cube([25, 10, thickness+2]);

		// the linear bearing channels
		translate([-300/2, xRodDistance/2, thickness+linearBearing[1]/2])
			rotate([0, 90, 0])
			polyhole(d=linearBearing[1], h=300);
		translate([-linearBearing[2], -xRodDistance/2, thickness+linearBearing[1]/2])
			rotate([0, 90, 0])
			polyhole(d=linearBearing[1], h=linearBearing[2]*2);
		translate([-300/2, xRodDistance/2-1, linearBearing[1]-thickness])
			cube([300, 2, thickness*5]);
		translate([-300/2, -xRodDistance/2-1, linearBearing[1]-thickness])
			cube([300, 2, thickness*5]);

		// zip tie holes
		difference(){
			translate([100/2-linearBearing[2]/2-thickness/2, xRodDistance/2, thickness+linearBearing[1]/2])
				rotate([0,90,0])
				polycyl(d=linearBearing[1]+thickness*2+2, h=thickness);
			translate([100/2-linearBearing[2]/2-thickness/2, xRodDistance/2, thickness+linearBearing[1]/2])
				rotate([0,90,0])
				polycyl(d=linearBearing[1]+thickness*2-2, h=thickness);
		}
		difference(){
			translate([-100/2+linearBearing[2]/2-thickness/2, xRodDistance/2, thickness+linearBearing[1]/2])
				rotate([0,90,0])
				polycyl(d=linearBearing[1]+thickness*2+2, h=thickness);
			translate([-100/2+linearBearing[2]/2-thickness/2, xRodDistance/2, thickness+linearBearing[1]/2])
				rotate([0,90,0])
				polycyl(d=linearBearing[1]+thickness*2-2, h=thickness);
		}
		difference(){
			translate([-thickness/2, -xRodDistance/2, thickness+linearBearing[1]/2])
				rotate([0,90,0])
				polycyl(d=linearBearing[1]+thickness*2+2, h=thickness);
			translate([-thickness/2, -xRodDistance/2, thickness+linearBearing[1]/2])
				rotate([0,90,0])
				polycyl(d=linearBearing[1]+thickness*2-2, h=thickness);
		}


		// bolt holes
		translate([100/2-5, xRodDistance/2-20, -1])
			polyhole(d=M5, h=thickness*2+2);
		translate([-100/2+5, xRodDistance/2-20, -1])
			polyhole(d=M5, h=thickness*2+2);
		translate([100/2-5, -xRodDistance/2+15, -1])
			polyhole(d=M5, h=thickness*2+2);
		translate([-100/2+5, -xRodDistance/2+15, -1])
			polyhole(d=M5, h=thickness*2+2);

		// bolt head traps
		translate([100/2-5, xRodDistance/2-20, thickness])
			rotate([0, 0, 90])
			polynut(d=M5nut, h=M5nutThickness+1);
		translate([-100/2+5, xRodDistance/2-20, thickness])
			rotate([0, 0, 90])
			polynut(d=M5nut, h=M5nutThickness+1);
		translate([100/2-5, -xRodDistance/2+15, thickness])
			rotate([0, 0, 90])
			polynut(d=M5nut, h=M5nutThickness+1);
		translate([-100/2+5, -xRodDistance/2+15, thickness])
			rotate([0, 0, 90])
			polynut(d=M5nut, h=M5nutThickness+1);

		// flatten the sides
		translate([-70, -xRodDistance, -xRodDistance/3])
			cube([20, xRodDistance*2, xRodDistance]);
		translate([50, -xRodDistance, -xRodDistance/3])
			cube([20, xRodDistance*2, xRodDistance]);

	}// end difference

}

module support(){
	union(){

		difference(){
	
			union(){
	
			// belt block support
				hull(){
					translate([-50/2, xRodDistance/2+linearBearing[1]-4, 0])
						cube([50, 17, thickness+linearBearing[1]/2-thickness/2]);
	
					translate([-80/2, xRodDistance/2+linearBearing[1]-4, 0])
						cube([1, 5, thickness+linearBearing[1]/2-thickness/2]);
					translate([79/2, xRodDistance/2+linearBearing[1]-4, 0])
						cube([1, 5, thickness+linearBearing[1]/2-thickness/2]);
				}
				translate([-40/2, xRodDistance/2+linearBearing[0]-4, 0])
					cube([40, 10, thickness+linearBearing[1]/2-thickness/2]);
	
			}// end union
	
		// cut the grooves
		for(i = [-45 : 45])
			translate([i, xRodDistance/2, -1])
				cube([.8, 40, thickness*4]);
	
		}// end difference

		// add cross brace to support to help keep the support from falling over
		translate([-80/2, xRodDistance/2+linearBearing[1], 0])
			cube([80, .5, thickness/2]);

	}// end union

}