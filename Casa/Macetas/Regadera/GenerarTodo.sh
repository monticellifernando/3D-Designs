for i in RegaderaBotella_20 RegaderaBotella_40 ; do openscad -D  "$i();" -o $i.stl RegaderaBotella.scad ; done
