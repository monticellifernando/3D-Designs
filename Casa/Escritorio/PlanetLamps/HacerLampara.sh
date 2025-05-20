#!env bash
if test -z $1; then echo Pasá el archivo del planeta
else
   Planeta=$1

   openscad -D  "HacerLampara(\"$Planeta\");" -o Base_$Planeta MakeLamp.scad
fi
