
include <configuration.scad>;

module bolt(){
	union(){
		translate([0, 0, -boltLength]) cylinder(r=boltOuterRadius, h=boltLength+1);
		cylinder(r=washerOuterRadius, h=washerLength);
	}
}

// a bolt and washer intended for making equivalent holes
// the parameter from indicates which side the bolt is inserted from
module boltWasher(from="x-"){
	if(from=="x+"){
		rotate([0, 90, 0]) bolt();
	} else
	if(from=="x-"){
		rotate([0, -90, 0]) bolt();
	} else
	if(from=="y+"){
		rotate([-90, 0, 0]) bolt();
	} else
	if(from=="y-"){
		rotate([90, 0, 0]) bolt();
	} else
	if(from=="z+"){
		rotate([0, 0, 0]) bolt();
	} else
	if(from=="z-"){
		rotate([180, 0, 0]) bolt();
	}
}

boltWasher("x-");