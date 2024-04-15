for tamano in 50 100 125 150 ; do
    for i in Maceta Rejilla Base ; do
        openscad -D  "$i($tamano);" -o $i"_"$tamano.stl PortalMaceta.scad
    done
done

