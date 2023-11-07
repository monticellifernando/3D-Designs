for i in SmallCup Cup Perilla SolidBase  BaseHolderLeft BaseHolderRight SidesMiddleHole SidesMiddlePlug Pituto PitutoLargo PitutoAngosto Tubes ; do openscad -D  "$i();" -o $i.stl LabJack.scad; done
