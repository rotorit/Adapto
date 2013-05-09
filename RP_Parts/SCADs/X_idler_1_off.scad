// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/

include <configuration.scad>;
$fn=99;//wild guess

xIdler2();


// This is based on RoTorITs second version spring 2013
module xIdler2(){
	difference(){
		union(){
			// channel for the Z linear bearings
			translate([-linearBearing[2]-3/2*thickness, -thickness-linearBearing[1]/2, 0]) cube([linearBearing[2]*2+thickness*3, 2*thickness+linearBearing[1], linearBearing[1]/2+thickness]);
			translate([-88/2, 40, 0]) cube([88, 22, 20+thickness]);
			hull(){
				translate([-linearBearing[2]-3/2*thickness, thickness+linearBearing[1]/2, 0]) cube([linearBearing[2]*2+thickness*3, 1, linearBearing[1]/2+thickness]);
				translate([-88/2, 40, 0]) cube([88, 1, linearBearing[1]/2+thickness]);				
			}
			// smooth rod holders
			translate([xRodDistance/2-0*(thickness+linearBearing[1]/2)/2, 40, 27+thickness+linearBearing[1]/2]) rotate([-90, 0, 0]) cylinder(r=thickness+linearBearing[1]/2, h=22);
			translate([-xRodDistance/2-(thickness+linearBearing[1]/2), 40, 0]) cube([2*thickness+linearBearing[1], 22, 27+thickness+linearBearing[1]/2]);
			translate([-xRodDistance/2+0*(thickness+linearBearing[1]/2)/2, 40, 27+thickness+linearBearing[1]/2]) rotate([-90, 0, 0]) cylinder(r=thickness+linearBearing[1]/2, h=22);
			translate([xRodDistance/2-2*(thickness+linearBearing[1]/2)/2, 40, 0]) cube([2*thickness+linearBearing[1], 22, 27+thickness+linearBearing[1]/2]);
			hull(){
				translate([-88/2, 40+22/2, 27+thickness+linearBearing[1]/2+thickness+M8/2]) rotate([0, 90, 0]) cylinder(r=thickness+M8/2, h=22);
				translate([-88/2, 40+22/2, 27+thickness+linearBearing[1]/2+thickness+M8/2+16]) rotate([0, 90, 0]) cylinder(r=thickness+M8/2, h=22);
				translate([-88/2, 40, 0]) cube([22, 22, 27+thickness+linearBearing[1]/2]);
			}
			// the linear bearings
			%translate([-linearBearing[2]-1/2*thickness, 0, thickness+linearBearing[1]/2]) rotate([0, 90, 0]) cylinder(r=linearBearing[1]/2, h=linearBearing[2]);
			%translate([0*linearBearing[2]+1/2*thickness, 0, thickness+linearBearing[1]/2]) rotate([0, 90, 0]) cylinder(r=linearBearing[1]/2, h=linearBearing[2]);
			// the X smooth rods
			%translate([xRodDistance/2-0*(thickness+linearBearing[1]/2)/2, 64, 27+thickness+linearBearing[1]/2]) rotate([90, 0, 0]) cylinder(r=smoothRod/2, h=300);
			%translate([-xRodDistance/2+0*(thickness+linearBearing[1]/2)/2, 64, 27+thickness+linearBearing[1]/2]) rotate([90, 0, 0]) cylinder(r=smoothRod/2, h=300);
			// The Z smooth rod
			%translate([-300/2, 0, thickness+linearBearing[1]/2]) rotate([0, 90, 0]) cylinder(r=smoothRod/2, h=300);
		}// end union
			// remove stuff
			// x smooth rod holes
			translate([xRodDistance/2-0*(thickness+linearBearing[1]/2)/2, 64, 27+thickness+linearBearing[1]/2]) rotate([90, 0, 0]) cylinder(r=smoothRod/2, h=300);
			translate([-xRodDistance/2+0*(thickness+linearBearing[1]/2)/2, 64, 27+thickness+linearBearing[1]/2]) rotate([90, 0, 0]) cylinder(r=smoothRod/2, h=300);
			// channel for linear bearings
			translate([-linearBearing[2]-1/2*thickness, 0, thickness+linearBearing[1]/2]) rotate([0, 90, 0]) cylinder(r=linearBearing[1]/2, h=linearBearing[2]*2+thickness);
			translate([-50, 0, thickness+linearBearing[1]/2]) rotate([0, 90, 0]) cylinder(r=smoothRod/2, h=100);
			// zip tie holes
			translate([-2*thickness, (thickness+linearBearing[1]/2)/2+1, -1]) cube([thickness, 2, linearBearing[1]/2+thickness+2]);
			translate([thickness, (thickness+linearBearing[1]/2)/2+1, -1]) cube([thickness, 2, linearBearing[1]/2+thickness+2]);
			translate([-linearBearing[2], (thickness+linearBearing[1]/2)/2+1, -1]) cube([thickness, 2, linearBearing[1]/2+thickness+2]);
			translate([linearBearing[2]-thickness, (thickness+linearBearing[1]/2)/2+1, -1]) cube([thickness, 2, linearBearing[1]/2+thickness+2]);
			// centre hole to save plastic
			translate([-24/2, linearBearing[1]/2+10, -1]) cube([24, 20, linearBearing[1]/2+thickness+2]);
			// idler hole
			hull(){
				translate([-88/2-1, 40+22/2, 27+thickness+linearBearing[1]/2+thickness+M8/2]) rotate([0, 90, 0]) cylinder(r=M8/2, h=88/2);
				translate([-88/2-1, 40+22/2, 27+thickness+linearBearing[1]/2+thickness+M8/2+16]) rotate([0, 90, 0]) cylinder(r=M8/2, h=88/2);
			}
			translate([-88/2+22, 40+22/2, 27+thickness+linearBearing[1]/2+thickness+M8/2]) rotate([0, 90, 0]) cylinder(r=M8, h=22);
			// The curve http://www.wolframalpha.com/input/?i=circle+that+intersects+%2844%2C0%29+and+%2862%2C19%29+and+%2862%2C-19%29 or something similar
			translate([0, 33/2+27+thickness+linearBearing[1]/2+14, -1]) cylinder(r=685/36, h=111);
			// trim the sides
			translate([88/2, 0, -1]) cube([100,100,100]);
			translate([-88/2-100, 0, -1]) cube([100,100,100]);

			// The Z nut trap and hole for Z threaded rod
			translate([-88/2-1, 40+linearBearing[1]/2+screwR, thickness+(M5+1)/2]) rotate([0, 90, 0]) cylinder(r=(M5+1)/2, h=88+2);
			translate([-4, 40+linearBearing[1]/2+screwR, thickness+(M5+1)/2]) rotate([90, 0, 0]) rotate([0, 90, 0]) cylinder(r=M5nut/2, h=88+2, $fn=6);
			// nuts traps for M3 nuts and screws to hold the x smooth rods in place
			translate([-xRodDistance/2, linearBearing[1]/2+50, -1]) cylinder(r=6/2, h=27);
			translate([xRodDistance/2, linearBearing[1]/2+50, -1]) cylinder(r=6/2, h=27);
			translate([-xRodDistance/2, linearBearing[1]/2+50, -1]) cylinder(r=M3/2, h=27+thickness+linearBearing[1]/2);
			translate([xRodDistance/2, linearBearing[1]/2+50, -1]) cylinder(r=M3/2, h=27+thickness+linearBearing[1]/2);
			translate([-xRodDistance/2, linearBearing[1]/2+50, 27+thickness+linearBearing[1]/2-M8/2-4]) cylinder(r=M3nut/2, h=8, $fn=6);
			translate([xRodDistance/2, linearBearing[1]/2+50, 27+thickness+linearBearing[1]/2-M8/2-4]) cylinder(r=M3nut/2, h=8, $fn=6);


	}
}


// This is based on RoTorITs very first version autumn 2012
module xIdler1(){
length=60;
lowerHeight=14;
thinWidth=22;
shortLength=36;
height=20;
width=36;
wallWidth=2;
bhBolt=8;// width of the bearing holder bolt elongated hole
srXoffset=20;// smooth rod X offset
srZoffset=3;// smooth rod Z offset
srSetScrew=3;// diameter of the smooth rod set screw
sSHead=6;// set screw head diameter
sSHH=12;// set screw head height
cHole=4;// X carriage fastener hole diameter
cHXoffset=26;// X carriage fastener hole X offset
cHZoffset=14;// X carriage fastener hole Z offset

difference(){
	// main body
	cube([length, width, height]);
	translate([shortLength, thinWidth, -1]) cube([length+2, width+2, height+2]);
	translate([wallWidth, -1,lowerHeight]) cube([length+2, thinWidth-wallWidth-1, height]);
	// bearing holder hole
	translate([shortLength, bhBolt, -1]) cylinder(r=bhBolt/2, h=lowerHeight+2);
	translate([length-8, bhBolt, -1]) cylinder(r=bhBolt/2, h=lowerHeight+2);
	translate([shortLength, bhBolt/2, -1]) cube([length-8-shortLength, 8, lowerHeight+2]);
	// smooth rod hole
	// future: should use real length smooth rod
	translate([srXoffset+smoothRod/2, -1, srZoffset+smoothRod/2]) rotate([-90, 0, 0]) cylinder(r=smoothRod/2, h=width+2);
	// smooth rod set screw hole and countersink
	translate([-1, srZoffset+srSetScrew/2, srZoffset+smoothRod/2]) rotate([0, 90, 0]) cylinder(r=srSetScrew/2, h=srXoffset+2);
	translate([-1, srZoffset+srSetScrew/2, srZoffset+smoothRod/2]) rotate([0, 90, 0]) cylinder(r=sSHead/2, h=sSHH+1);
	// smooth rod set screw captive m3 nut hole - needs to use common module
	translate([srXoffset-2, srZoffset+srSetScrew/2, srZoffset+smoothRod/2]) rotate([0, 90, 0]) cylinder(r=6/2, h=3, $fn=6);
	// X carriage fastener hole
	translate([-1, cHXoffset+cHole/2, cHZoffset+cHole/2]) rotate([0, 90, 0]) cylinder(r=cHole/2, h=shortLength+2);
}}

