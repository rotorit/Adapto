// Copyright (C) 2012 t00tie
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/

//==========================================================================//
// Configuration file for Adapto OpenSCAD files                             //
// Scroll past the definition section to change basic and advanced settings //
//==========================================================================//

//====================//
// Definition Section //
//====================//
// Frame and Walls
// frameX and frameY are the dimensions of the frame material when viewed on end(the end of an extrusion looks roughly like an X)
// frameX is the width of the frame material
// frameY is the height of the frame material
//   x
//  [ ]y
// these are used to find offsets for screw placing so screws meet the (slot in the) middle of the frame
frameX=20;// width of the frame material(alu, wood etc.)
frameY=20;// height of the frame material

// Screws, Bolts, and Rods
boltOuterRadius=5/2;// outer radius of bolt threads, 5 for M5 bolts
boltLength=60;// bolt length without head (threaded part only)
washerOuterRadius=10/2;// washers that fit the bolts
washerLength=10;// this is large because it is used to make holes for washers
boltOffset=frameX/2;// How far in the bolt holes go, may need tweaking if frameX!=frameY
screwR=5.3/2;// Defaults for M5 screws

// Print the hole_calibration.scad object to dial in the next 6 settings
// Google found http://www.fairburyfastener.com/xdims_metric_nuts.htm
M8=8.4;// diameter of M8 threaded rod
M5=5.3;// diameter of M5 threaded rod
M3=3.4;// diameter of M3 threaded rod
M8nut=15.2;// diameter of M8 nut using $fn=6
M5nut=9.9;// diameter of M5 nut using $fn=6
M3nut=6.9;// diameter of M3 nut using $fn=6

M8nutThickness=6.8;// thickness of a standard M8 nut
M5nutThickness=4.7;// thickness of a standard M5 nut
M3nutThickness=2.4;// thickness of a standard M3 nut

// Acme Linear Screw and Nut
ACME14=6.4;// diameter of 1/4 inch ACME threaded rod in mm
ACME14nut=14.5;// diameter of ACME 1/4 inch nut using $fn=6 in mm
ACME14nutThickness=6.5;// thickness of ACME 1/4 inch nut in mm

// Linear Bearings
// lm__uu is IDxODxL
lm8uu=[8, 15, 24];
lm10uu=[10, 19, 29];
lm10luu=[10, 19.1, 55];

//rotary bearings
// 608__ is IDxODxL
608zz=[8, 22, 7];
rotaryBearing=608zz;// for readability(can be changed if other bearings are used

//====================//
// Basic Config Items //
//====================//
smoothRod=10;			// diameter of smooth rods in mm
linearBearing=lm10uu;	// change this to the linear bearing you are using from the definitions section
zRod=ACME14;			// change this to the z threaded rod you are using from the definitions section
zRodnut=ACME14nut;		// change this to the z nut you are using from the definitions section
zRodnutThickness=ACME14nutThickness;	// change this to the z nut thickness you are using from the definitions section

//=======================//
// Advanced Config Items //
//=======================//
$fn=200;				// default resolution for parts, decrease if part compiling or stl/gcode is unmanageable
xRodDistance=70;		// i3 xaxis_rod_distance=45, try this for compatible extruders, ymmv(not fully parametric yet)
thickness=5;			// thickness of walls etc. in parts