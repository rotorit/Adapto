Originally quite a few configuration values were hard-coded in the scads, this has been corrected and all variables that are not module specific or an established standard(nema17 size/bolt spacing) are stored within the configuration.scad file. This part of the project has been GearheadRed's primary focus along with improving parametric functions of the parts and general code readability. There are design additions/modifications to some components as well to improve on part strength or printability where they felt appropriate(note this probably violates some of t00ties goals for smaller/cheaper but that goal was kept in mind). Some scads were missing, these have been created and added or replaced with suitable parts as well.
Example STLs have been provided to view the parts on github. Naming conventions have been shortened and standardized somewhat. the _x# is the amount of a given part that needs to be printed.

Most are based on RoTorITs original design and attempt to reproduce that functionality if not the exact same look and feel. Some are simplified and/or lack embellishment. Others are completely different.

A number of the scads contain alternative implementations of the parts. These are t00tie's attempts at improving the designs. Goals for this include smaller, cheaper parts. See each file for details. These alternative parts fit together but are not necessarily directly interchangeable with the originals, choose either or, or double check before you print and build. Some of these files may have been updated to help with parametric configuration by GearheadRed, but have largely been left unaltered in design as t00tie intended otherwise. You will need to look inside each of the scad files and uncomment/comment the module calls for the parts towards the top of each file to activate the alternative designs. There are viewable references to the alternate designs in the Example STLs folder.

Files with alternates:

	footBase_x4.scad(currently t00tie's design is preferred, original is commented out)
	cornerBrace_x8.scad(currently GearheadReds design is preferred, original is commented out)
	yBlock_x1.scad(currently GearheadReds design is preferred, original is commented out)
	yClamp_x4.scad(currently GearheadReds design is preferred, original is commented out)
	yIdler_x1.scad(currently t00tie's design is preferred, original is commented out)
	zMotor_x2.scad(currently the original design is preferred, t00tie's design is commented out)

Making the STLs
---------------
Edit ./inc/configuration.scad to suit your needs(github copy currently is configured for GearheadRed's printer and probably needs changes to suit most users). Check the resulting parts for sanity.  Ask t00tie or GearheadRed for help if you need it.

On linux make the stls by typing one of
make -k
make -k -j12

If openscad is in your path this should result in lots of new files in the "output" directory.
