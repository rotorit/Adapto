// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/


use <bolt.scad>;
include <configuration.scad>;

$fn=33;
m8rodr=8/2;
m4rodr=4/2;
m3rodr=3/2;
motorcc=31;// centre-centre of the motor screw holes for nema17
centerr=25/2;// radius of the centre holes

difference(){
	union(){
		cube([62, 48, 8]);
		translate([30, 48, 0]) cube([32, 22, 21]);
		translate([0, 48-2, 0]) cube([62, 2, 21]);
		translate([58, 0, 0]) cube([4, 48, 21]);
	}
	translate([34+m8rodr, 48, 4+m8rodr]) rotate([-90,0,0]) cylinder(r=m8rodr, h=24+1);
	translate([30-1, 51+m4rodr, 14+m4rodr]) rotate([0,90,0]) cylinder(r=m4rodr, h=32+1+1);
	translate([8+centerr, 4+2*m3rodr+centerr, -1]) cylinder(r=centerr, h=8+2);
	translate([8+centerr+motorcc-(18-2*m3rodr), 4+2*m3rodr+centerr, -1]) cylinder(r=centerr, h=8+2);
	translate([8+centerr, 4+2*m3rodr, -1]) cube([motorcc-(18-2*m3rodr), 2*centerr, 8+2]);
	translate([4, 4, -1]) oval();
	translate([4+motorcc, 4, -1]) oval();
	translate([4, 4+motorcc, -1]) oval();
	translate([4+motorcc, 4+motorcc, -1]) oval();
	translate([0, 57, 14]) cube([111, 111, 111]);
}

module oval(){
	cylinder(r=m3rodr, h=8+2);
	translate([0, -m3rodr, 0]) cube([18-2*m3rodr, 2*m3rodr, 8+2]);
	translate([18-2*m3rodr, 0, 0]) cylinder(r=m3rodr, h=8+2);
}
