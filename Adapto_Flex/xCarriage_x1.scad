// Copyright (C) 2014 GearheadRed
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

translate([0,0,thickness*2])
	mirror([0,0,1])
	xCarriage();

module xCarriage(){

	difference(){

		union(){

			// poorly implemented support for the belt channel
			// dont use unless your slicer is having a bad time working it out on its own
			//support();

			// base plate
			translate([-100/2, -xRodDistance/2, thickness])
				cube([100, xRodDistance, thickness]);

			// belt block
			hull(){
				translate([-50/2, xRodDistance/2, -linearBearing[1]/2+thickness/2])
					cube([50, 30, thickness]);
				translate([-100/2, xRodDistance/2, -linearBearing[1]/2+thickness/2])
					cube([1, 1, thickness]);
				translate([98/2, xRodDistance/2, -linearBearing[1]/2+thickness/2])
					cube([1, 1, thickness]);
			}

			// linear bearing traps
			translate([100/2-linearBearing[2], xRodDistance/2, -thickness])
				rotate([0, 90, 0])
				polycyl(d=linearBearing[1]+thickness*2+1, h=linearBearing[2]);
			translate([-100/2, xRodDistance/2, -thickness])
				rotate([0, 90, 0])
				polycyl(d=linearBearing[1]+thickness*2+1, h=linearBearing[2]);
			translate([-linearBearing[2]/2, -xRodDistance/2, -thickness])
				rotate([0, 90, 0])
				polycyl(d=linearBearing[1]+thickness*2+1, h=linearBearing[2]);

			// bearing trap reinforcements
			translate([linearBearing[2]/2-thickness, -xRodDistance/2, 0])
				cube([thickness*3, xRodDistance, linearBearing[0]]);
			translate([-linearBearing[2]/2-thickness*2, -xRodDistance/2, 0])
				cube([thickness*3, xRodDistance, linearBearing[0]]);

			// bolt head traps
			translate([100/2-5, xRodDistance/2-20, 1])
				polycyl(d=M5nut*2, h=M5nutThickness);
			translate([-100/2+5, xRodDistance/2-20, 1])
				polycyl(d=M5nut*2, h=M5nutThickness);
	
			translate([100/2-5, -xRodDistance/2+15, 1])
				polycyl(d=M5nut*2, h=M5nutThickness);
			translate([-100/2+5, -xRodDistance/2+15, 1])
				polycyl(d=M5nut*2, h=M5nutThickness);

			// the X smooth rods
			%translate([-300/2, xRodDistance/2, -thickness])
				rotate([90, 0, 90])
				polycyl(d=smoothRod, h=300);
			%translate([-300/2, -xRodDistance/2, -thickness])
				rotate([90, 0, 90])
				polycyl(d=smoothRod, h=300);

			// the linear bearings
			%translate([100/2-linearBearing[2], xRodDistance/2, -thickness])
				rotate([0, 90, 0])
				polycyl(d=linearBearing[1], h=linearBearing[2]);
			%translate([-100/2, xRodDistance/2, -thickness])
				rotate([0, 90, 0])
				polycyl(d=linearBearing[1], h=linearBearing[2]);

			%translate([-linearBearing[2]/2, -xRodDistance/2, -thickness])
				rotate([0, 90, 0])
				polycyl(d=linearBearing[1], h=linearBearing[2]);

		}// end union

		// belt channel
		translate([-25/2, xRodDistance/2+20-thickness, -linearBearing[1]/2+thickness/2-.99])
			cube([25, 10, thickness+1]);

		// the linear bearing channels
		translate([-300/2, xRodDistance/2, -thickness])
			rotate([0, 90, 0])
			polyhole(d=linearBearing[1]-.2, h=300);
		translate([-300/2, -xRodDistance/2, -thickness])
			rotate([0, 90, 0])
			polyhole(d=linearBearing[1]-.2, h=300);

		// the linear bearing split
		translate([-300/2, xRodDistance/2-smoothRod/2, -linearBearing[1]-thickness/2])
			cube([300, smoothRod, thickness*2]);
		translate([-300/2, -xRodDistance/2-smoothRod/2, -linearBearing[1]-thickness/2])
			cube([300, smoothRod, thickness*2]);

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
		translate([100/2-5, xRodDistance/2-20, -1])
			rotate([0, 0, 90])
			polynut(d=M5nut, h=M5nutThickness+1);
		translate([-100/2+5, xRodDistance/2-20, -1])
			rotate([0, 0, 90])
			polynut(d=M5nut, h=M5nutThickness+1);
		translate([100/2-5, -xRodDistance/2+15, -1])
			rotate([0, 0, 90])
			polynut(d=M5nut, h=M5nutThickness+1);
		translate([-100/2+5, -xRodDistance/2+15, -1])
			rotate([0, 0, 90])
			polynut(d=M5nut, h=M5nutThickness+1);

		// flatten the sides
		translate([-70, -xRodDistance, -xRodDistance/2])
			cube([20, xRodDistance*2, xRodDistance]);
		translate([50, -xRodDistance, -xRodDistance/2])
			cube([20, xRodDistance*2, xRodDistance]);

	}// end difference

}

module support(){
	union(){

		difference(){
	
			union(){
	
			// belt block support
				hull(){
					translate([-50/2, xRodDistance/2+linearBearing[1]-4, -linearBearing[1]/2+thickness*1.5])
						cube([50, 17, thickness+linearBearing[1]/2-thickness/2]);
	
					translate([-80/2, xRodDistance/2+linearBearing[1]-4, -linearBearing[1]/2+thickness*1.5])
						cube([1, 5, thickness+linearBearing[1]/2-thickness/2]);
					translate([79/2, xRodDistance/2+linearBearing[1]-4, -linearBearing[1]/2+thickness*1.5])
						cube([1, 5, thickness+linearBearing[1]/2-thickness/2]);
				}
				translate([-40/2, xRodDistance/2+linearBearing[0]-4, -linearBearing[1]/2+thickness*1.5])
					cube([40, 10, thickness+linearBearing[1]/2-thickness/2]);
	
			}// end union
	
		// cut the grooves
		for(i = [-45 : 45])
			translate([i, xRodDistance/2, -thickness])
				cube([.8, 40, thickness*4]);
	
		}// end difference

		// add cross brace to support to help keep the support from falling over
		translate([-80/2, xRodDistance/2+linearBearing[1], thickness*2-thickness/2])
			cube([80, .5, thickness/2]);

	}// end union

}