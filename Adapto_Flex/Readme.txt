These are OpenSCAD models of Adapto Flex parts. The Flex variant is GearheadReds implementation of the Adapto intended to support a more flexible variety of mountable carriage items and support for Mutleys Flex3Drive system(http://mutley3d.com/Flex3Drive/).

There are design changes with the Flex version, notably implementing the Vertical X Standard(http://reprap.org/wiki/Vertical_X_Axis_Standard). Example STLs have been provided to view the parts on github. Naming conventions have been shortened and standardized somewhat. the _x# is the amount of a given part that needs to be printed.

Most parts are based on RoTorITs design but either combined to reduce part count, save plastic, or make the design more versatile. These files have
A few parts are t00ties designs or t00ties code re-structured to handle the central config file better.


Making the STLs
---------------
Edit ./inc/configuration.scad to suit your needs. Check the resulting parts for sanity.

On linux make the stls by typing one of
make -k
make -k -j12

If openscad is in your path this should result in lots of new files in the "output" directory.
