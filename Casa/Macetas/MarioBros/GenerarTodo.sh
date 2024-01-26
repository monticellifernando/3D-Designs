for j in 100 75; do 
    for i in Maceta Rejilla Base ; do
        openscad -D  "$i($j);" -o $i"_$j".stl MarioMaceta.scad; done
    done

