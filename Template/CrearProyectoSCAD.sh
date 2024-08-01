#!/bin/bash

echo Usage: $0 SCadProjectName


if test -z $SCADTEMPLATEPATH; then
    echo "ERROR! please set SCADTEMPLATEPATH to where the template scad is!"
elif test -z $1; then
    echo "ERROR! please pass a name for the SCAD project!"
else

    ProjectName=$1
    mkdir $ProjectName
    cp $SCADTEMPLATEPATH/* $ProjectName/
    rm $ProjectName/CrearProyectoSCAD.sh
    cd $ProjectName
    for i in ./* ; do mv $i ${i/Template/$ProjectName} ; done
    cd -
    sed s/Template/$ProjectName/g -i $ProjectName/*

    echo Done!
fi




