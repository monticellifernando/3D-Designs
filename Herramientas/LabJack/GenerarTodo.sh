for i in SolidBase  BaseHolderLeft BaseHolderRight SidesMiddleHole SidesMiddlePlug Pituto Tubes ; do openscad -D  "$i();" -o $i.stl LabJack.scad; done
