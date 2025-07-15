#!/bin/bash

# script to move unused Tikz/src/**.tex files to Tikz/src/unused/**.tex

origdir=$(pwd)
cd "$(dirname "$0")/../src/" # change directory to Tikz/src/ relative to script location

for file in ./**.tex ; do
    pathstem=$( echo "${file%.*}" | sed -e 's/^\.\///' ) # remove tailing .ext (e.g. .pdf) and leading ./ from filepath
    # check if file is used
    if [[ $( grep "Tikz/\(src\|pdf\|png\)/**$pathstem.\(src\|pdf\|png\)" ../../*.tex ) ]] ; then
        continue
    else
        mkdir -p unused/ 2>/dev/null
        mv $file unused/
        echo "moved $file to unused/" 
    fi
done

cd $origdir
exit 0