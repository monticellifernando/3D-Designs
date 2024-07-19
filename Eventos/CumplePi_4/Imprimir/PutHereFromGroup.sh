#! bash
#
# run as ./PutHereFromGroup.sh ../Group0
#
if test -z $1; then
    echo Pasa un argumento! 
    echo run as ./PutHereFromGroup.sh ../Group0
else
    rm ./*stl
    ls $1/* -1 | awk 'BEGIN{m_N=0};{print("cp " $1, m_N".stl;"); m_N++}' | zsh
fi
