// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/

include <configuration.scad>;

$fn=33; // wild guess
r=14/2; // radius of each leg
h=30; // belt block height
w=26; // biggest width of belt block
gap=4; //width of gap between the legs
holer=4/2; // radius of the holes
nutr=m3_nut_diameter_bigger/2; // radius of nut trap

difference(){
	union(){
		cylinder(r=r, h=h);
		translate([w-2*r, 0, 0]) cylinder(r=r, h=h);
		translate([0, -r, 0]) cube([w-2*r, 2*r, h]);
	}
	translate([(w-2*r)/2-gap/2, -2*r, -1]) cube([gap, 4*r, h+1-gap]);// gap between the legs
	translate([0, 0, -1]) cylinder(r=holer, h=h+2);
	translate([w-2*r, 0, -1]) cylinder(r=holer, h=h+2);
	translate([0, 0, h-2]) cylinder(r=nutr, h=4, $fn=6);
	translate([w-2*r, 0, h-2]) cylinder(r=nutr, h=4, $fn=6);
}