// Copyright (C) 2012 t00tie
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/

// Configuration file for Adapto OpenSCAD files

// frame and walls
// frameX and frameY are the dimensions of the frame parts like extrusions
// frameX is the width of the Y frame seen from the front (an extrusion looks roughly like an X)
// frameY is the height of the Y frame seen from the front
// these are used to find offsets for screw placing so screws meet the (slot in the) middle of the frame
frameX=20;// width of frame parts (alu, wood etc.)
frameY=20;// ditto
thickness=6;// thickness of walls etc. in parts

// Screws and bolts and rods
boltOuterRadius=5/2;// outer radius of bolt threads, 5 for M5 bolts
boltLength=60;//bolt length without head (threaded part only)
washerOuterRadius=10/2;// washers that fit the bolts
washerLength=10;// this is large because it is used to make holes for washers
boltOffset=frameX/2;// How far in the bolt holes go, may need tweaking if framX!=frameY

xRodDistance=70;// i3 xaxis_rod_distance=45, try this for compatible extruders, ymmv
screwR=5.3/2;// Defaults for M5 screws
// print the hole_calibration.scad object to dial in the next 6 settings
// google found http://www.fairburyfastener.com/xdims_metric_nuts.htm
M8=8.4;// diameter of M8 threaded rod
M5=5.3;// diameter of M5 threaded rod
M3=3.4;// diameter of M3 threaded rod
M8nut=15.2;// diameter of M8 nut using $fn=6
M5nut=9.9;// diameter of M5 nut using $fn=6
M3nut=6.9;// diameter of M3 nut using $fn=6
M8nutThickness=6.8;// thickness of a standard M8 nut
M5nutThickness=4.7;// thickness of a standard M5 nut
M3nutThickness=2.4;// thickness of a standard M3 nut
smoothRod=M8;// diameter of smooth rods


// bearings
// lm8uu is IDxODxL 8x15x24mm, lm10uu is 10x19x29mm
lm8uu=[8, 15, 24];
lm10uu=[10, 19, 29];
linearBearing=lm8uu;// change this to the one you want from the list above
// 608zz 608rs


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
m3_nut_diameter_bigger = ((m3_nut_diameter  / 2) / cos (180 / 6))*2;// =6.119912853410033 this is silly
