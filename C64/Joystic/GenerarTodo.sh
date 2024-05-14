for i in Tapa ; do
    openscad -D  "$i();" -o $i.stl Joystic.scad; done

