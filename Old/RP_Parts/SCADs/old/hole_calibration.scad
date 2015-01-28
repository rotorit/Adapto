// Copyright (C) 2012 t00tie
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/

// hole size calibration object


include <configuration.scad>;
$fn=99;//wild guess


echo("M3=", M3);
echo("M5=", M5);
echo("M8=", M8);
echo("M3nut=", M3nut);
echo("M5nut=", M5nut);
echo("M8nut=", M8nut);
holes();
translate([0, thickness+M8, thickness+M8/2]) rotate([-90, 0, 0]) holes();

module holes(){
	difference(){
		union(){
			translate([0, 0, 0]) cylinder(r=thickness+M8/2, h=thickness);
			translate([2*thickness+M5, 0, 0]) cylinder(r=thickness+M5/2, h=thickness);
			translate([2*thickness+M5+thickness+M8, 0, 0]) cylinder(r=thickness+M3/2, h=thickness);
			hull(){
				translate([-thickness-M8/2, 0, 0]) cube([thickness, thickness+M8/2, thickness]);
				translate([2*thickness+M5+thickness+M8, 0, 0]) cube([thickness+M3/2, thickness+M8/2, thickness]);
			}
		}
		translate([0, 0, -1]) cylinder(r=M8/2, h=thickness/2+2);
		translate([2*thickness+M5, 0, -1]) cylinder(r=M5/2, h=thickness/2+2);
		translate([2*thickness+M5+thickness+M8, 0, -1]) cylinder(r=M3/2, h=thickness/2+2);
		translate([0, 0, thickness/2]) cylinder(r=M8nut/2, h=thickness/2+2, $fn=6);
		translate([2*thickness+M5, 0, thickness/2]) cylinder(r=M5nut/2, h=thickness/2+2, $fn=6);
		translate([2*thickness+M5+thickness+M8, 0, thickness/2]) cylinder(r=M3nut/2, h=thickness/2+2, $fn=6);
	}
}