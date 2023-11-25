for i in BaseUp BaseDown PitutoLargo PitutoAngosto Perilla SidesMiddleHole SidesMiddlePlug  Tubes ; do openscad -D  "$i();" -o $i.stl LabJack.scad; done

