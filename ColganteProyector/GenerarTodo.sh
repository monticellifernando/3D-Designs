#!/bin/bash
#
for i in $(grep module ./*scad  | sed s/"("/\ /g | awk '{print($2)}'); do
    echo $i 
    openscad -D  "$i();" -o $i.stl ColganteProyector.scad

done
    
