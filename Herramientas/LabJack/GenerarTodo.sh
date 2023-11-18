for i in SolidBase BaseHolderHole BaseHolderWide Pituto PitutoLargo PitutoAngosto Cup SmallCup Perilla SolidSides Sides SidesMiddleHole SidesMiddlePlug  Tubes ; do openscad -D  "$i();" -o $i.stl LabJack.scad; done

