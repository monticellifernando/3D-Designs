for j in 50 75 100 125 150 ; do 
    for i in Maceta Rejilla Base ; do
        openscad -D  "$i($j);" -o $i"_$j".stl MarioMaceta.scad; done
    done

