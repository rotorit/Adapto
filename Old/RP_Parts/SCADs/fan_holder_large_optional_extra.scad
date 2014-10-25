// Copyright (C) 2013 t00tie
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/

// Fan holder for the adapto frame
// Designed to be screwed onto available frame parts
// Use zip ties and/or screws to attach the fan
// designed to fit most large pc fans, tested a 120mm fan
// This should work on anything that uses extrusions or indeed juast has centered screw mounts
// The holes in the base are designed so that one side of the fanholder is flush with the frame -
// it shouldn't protrude inside the adapto frame but can stick out on the outside


$fn=99;//wild guess
slop=0.5;// extra wiggle room
depth=3;
width=25+slop;// Width of the fan case. My 120mm fan has a 25mm thick case
inset=7+slop;// how far from the edge the fan case's holes are
fanHoles=5/2;// radius of the screw holes in the fan frame
frameHoles=4/2;// radius of the screw holes in the adapto frame
frame=20;// the width of the adapto frame you will attach this to
height=2*(2*inset+fanHoles)+slop;

fanholder2();

module fanholder2(){
	base();
	wing();
	translate([0, width+depth, 0]) wing();	
}

// deprecated, kept for history
module fanholder1(){
difference(){
	union(){
		cube([height, width+2*depth, depth]);
		//translate([depth/2, depth, -1]) cube([5, height-2*depth, depth+2]);
		translate([0, 0, depth]) rotate([-90, 0, 0]) cylinder(r=2*inset+fanHoles, h=depth);
		translate([0, width+depth, depth]) rotate([-90, 0, 0]) cylinder(r=2*inset+fanHoles, h=depth);
	}
	translate([inset, -1, depth+inset]) rotate([-90, 0, 0]) cylinder(r=fanHoles, h=width+2*depth+2);
// holes to attach to the adapto frame
	translate([height-depth-frameHoles, frame/2, -1]) cylinder(r=frameHoles, h=depth+2);
	translate([height/2, frame/2, -1]) cylinder(r=frameHoles, h=depth+2);
	translate([depth+frameHoles, frame/2, -1]) cylinder(r=frameHoles, h=depth+2);
	translate([height-depth-frameHoles, width+2*depth-frame/2, -1]) cylinder(r=frameHoles, h=depth+2);
	translate([height/2, width+2*depth-frame/2, -1]) cylinder(r=frameHoles, h=depth+2);
	translate([depth+frameHoles, width+2*depth-frame/2, -1]) cylinder(r=frameHoles, h=depth+2);

	translate([-1, -1, -111]) cube([111, 111, 111]);
	translate([-111, -1, -111]) cube([111, 111, 222]);
}
}


module base(){
difference(){
	union(){
		cube([height, width+2*depth, depth]);
	}
// holes to attach to the adapto frame
	translate([height-depth-frameHoles, frame/2, -1]) cylinder(r=frameHoles, h=depth+2);
	translate([height/2, frame/2, -1]) cylinder(r=frameHoles, h=depth+2);
	translate([depth+frameHoles, frame/2, -1]) cylinder(r=frameHoles, h=depth+2);
	translate([height-depth-frameHoles, width+2*depth-frame/2, -1]) cylinder(r=frameHoles, h=depth+2);
	translate([height/2, width+2*depth-frame/2, -1]) cylinder(r=frameHoles, h=depth+2);
	translate([depth+frameHoles, width+2*depth-frame/2, -1]) cylinder(r=frameHoles, h=depth+2);
}	
}

module wing(){
difference(){
	union(){
		translate([inset, 0, depth+inset+slop]) rotate([-90, 0, 0]) cylinder(r=inset, h=depth);
		cube([2*(inset), depth, depth+inset+slop]);
	}
	translate([inset, -1, depth+inset+slop]) rotate([-90, 0, 0]) cylinder(r=fanHoles, h=width+2*depth+2);
}
}
