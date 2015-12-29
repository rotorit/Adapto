These are OpenSCAD models of Adapto parts.

Most are based on RoTorITs original design and attempt to reproduce that functionality if not the exact same look and feel. Some are simplified and/or lack embellishment.

A number of the scads contain alternative implementations of the parts. These are t00tie's attempts at improving the design. Goals for this include smaller, cheaper parts. See each file for details. These alternative parts fit together but are not necessarily directly interchangeable with the originals, choose either or, or double check before you print and build.

t00tie would love your feedback on these, both criticisms and improvement suggestions.


Making the STLs
---------------
Edit configuration.scad to suit your needs. Check the resulting parts for sanity. Quite a few values are still hard-coded in the scads, you may need to edit them. Ask t00tie for help if you need it.

On linux make the stls by typing one of
make -k
make -k -j12

If openscad is in your path this should result in lots of new files in the "output" directory.