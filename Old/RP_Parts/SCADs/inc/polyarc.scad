// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./configuration.scad>

// Concepts pulled and modified to suit needs from
// http://hydraraptor.blogspot.com/2011/02/polyholes.html
// and
// http://reprap.org/wiki/ArcCompensation

// proper poly compensation for a cylinder including the config file $fn value
// this one is probably not needed but lets use it anyway
module polycyl(d, h){
	cylinder(r=(d/2)/cos(180/$fn), h=h);
}

// proper poly compensation when drilling a hole
module polyhole(d, h){
	cylinder(r=(d/2)/cos(180/$fn)+0.05, h=h);
}

// proper poly compensation for a 6 sided nut(measured flat to flat)
module polynut(d, h){
	cylinder(r=(d/2)/cos(180/6)+0.05, h=h, $fn=6);
}