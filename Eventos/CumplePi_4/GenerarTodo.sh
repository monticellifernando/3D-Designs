for i in $(cat Sorted.txt) ; do 
    FileName=MarcaVasos_$i.stl
    
    if test -f $FileName ; then
        echo $FileName Ya está
    else
   
       echo Generando $FileName 
       openscad -D  "MarcaVasos(\"${i/_/ }\",0.75);" -o $FileName MarcaVasos.scad 
    fi

done

