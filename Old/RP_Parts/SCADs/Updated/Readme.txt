These are OpenSCAD models of Adapto parts.

Most are based on RoTorITs original design and attempt to reproduce that functionality if not the exact same look and feel. Some are simplified and/or lack embellishment.

A number of the scads contain alternative implementations of the parts. These are t00tie's attempts at improving the designs. Goals for this include smaller, cheaper parts. See each file for details. These alternative parts fit together but are not necessarily directly interchangeable with the originals, choose either or, or double check before you print and build.

Originally quite a few configuration values were hard-coded in the scads, this has been corrected and all variables that are not module specific or an established standard(nema17 size/bolt spacing) are stored within the configuration.scad file. This part of the project has been GearheadRed's primary focus along with improving parametric functions of the parts(certain parametric aspects like the x rod spacing is not sane yet) and general code readability. There are design additions/modifications to some components as well to improve on part strength or printability where they felt appropriate(note this probably violates some of t00ties goals for smaller/cheaper but was kept in mind). Some scads were missing, these have been created and added as well.

t00tie and GearheadRed would love your feedback on these, both criticisms and improvement suggestions.


Making the STLs
---------------
Edit configuration.scad to suit your needs(github copy currently is configured for GearheadRed's printer and probably needs changes to suit most users). Check the resulting parts for sanity.  Ask t00tie or GearheadRed for help if you need it.

On linux make the stls by typing one of
make -k
make -k -j12

If openscad is in your path this should result in lots of new files in the "output" directory.