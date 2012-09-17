// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/

use <bolt.scad>;
include <configuration.scad>;

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


}

