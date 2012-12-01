// Copyright (C) 2012 t00tie
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/

// Configuration file for Adapto OpenSCAD files

boltOuterRadius=5/2;// outer radius of bolt threads, 5 for M5 bolts
boltLength=60;//bolt length without head (threaded part only)
washerOuterRadius=13/2;// washers that fit the bolts
washerLength=10;// this is large because it is used to make holes for washers

frameX=20;// width of frame parts (alu, wood etc.)
frameY=20;// ditto

boltOffset=frameX/2;// How far in the bolt holes go, may need tweaking if framX!=frameY

smoothRod=8;// diameter of smooth rods


// Copied from 
// PRUSA Mendel  
// Default metric sizes
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel
m3_nut_diameter = 5.3;
m3_nut_diameter_bigger = ((m3_nut_diameter  / 2) / cos (180 / 6))*2;
