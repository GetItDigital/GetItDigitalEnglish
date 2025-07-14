#!/bin/bash

# creates:      <dir>/Tikz/TeXAux/tikz_standalone_settings.tex    (overwrites existing file!)
#
# depends on:   <dir>/Settings.tex
#               <dir>/Tikz/<subdir>/._tikz_standalone_settings.sh (location)
#
# needed by:    <dir>/Tikz/tikz_standalone.tex                    (for compatibility with standalone documentclass)
# 
# should be automatically called when compiling tikz_standalone.tex (with latexmk by .latexmkrc executed pre-compilation)

initial_working_directory=$( pwd ) 
cd "$(dirname "$0")" # ref: https://stackoverflow.com/questions/3349105/how-can-i-set-the-current-working-directory-to-the-directory-of-the-script-in-ba
cd ../..

# VARIABLES (without leading ./)
auxdir=Tikz/TeXAux
settingsfilein=Settings.tex

settingsfileout=Tikz/TeXAux/tikz_standalone_settings.tex

# create auxdir if not exists
mkdir -p $auxdir

# If $settingsfilein exists, then ...
if [[ -f "$settingsfilein" ]] 
    then
        echo ""
        echo "/------------t-i-k-z-_-s-t-a-n-d-a-l-o-n-e-_-s-e-t-t-i-n-g-s-.-s-h------------\\"
        echo "copy       $( pwd )/$settingsfilein"
        echo "to         $( pwd )/$settingsfileout"
        echo "commented out \usetheme{GetItDigital}   for compatibility with standalone documentclass"
        sed "s/\\\\usetheme{GetItDigital}/%\\\\usetheme{GetItDigital}\t\t\t% Auskommentiert für documentclass standalone/g" $settingsfilein > $settingsfileout
        echo "commented out \input{Modulsettings.tex} for compatibility with standalone documentclass"
        sed -i "s/\\\\input{Modulsettings.tex}/%\\\\input{Modulsettings.tex}\t\t\t% Auskommentiert für documentclass standalone/g" $settingsfileout
        echo "\------------------------------------------------------------------------------/"
        echo ""
    else
        echo "File $settingsfilein does not exist."
        echo "Error: Can't create $settingsfileout without template. Please check filenames and paths."
        exit 1
fi

cd $initial_working_directory
exit 0 