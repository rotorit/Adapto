w=20;
l=37;
b=7;
bolt_r=5/2;

use <bolt.scad>;

difference(){
	union(){
		cube([l, w, b]);
		cube([b, w, l]);
		intersection(){
			rotate([-90,0,0]) cylinder(r=l-bolt_r-w/2, h=w);
			cube([l,w,l]);
		}
	}
	translate([l-w/2, w/2, b]) boltWasher("z+");
	translate([b, w/2, l-w/2]) boltWasher("x+");
}
