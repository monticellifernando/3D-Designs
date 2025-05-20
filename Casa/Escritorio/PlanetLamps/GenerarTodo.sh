for N in Ine Manu Vir ; do 
        openscad -D  "Base(\"$N\");" -o Base"_$N".stl BaseLampara.scad; 

    done

openscad -D  "Pie();" -o Pie.stl BaseLampara.scad;
