for i in Tapa Base; do
    openscad -D  "$i();" -o $i.stl Power.scad; done

