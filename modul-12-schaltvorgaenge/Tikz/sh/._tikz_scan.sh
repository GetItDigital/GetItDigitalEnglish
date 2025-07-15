#!/bin/bash

# based on script by /u/BenedongCumculous 2022
# https://www.reddit.com/r/LaTeX/comments/prtxl9/how_to_input_all_files_from_a_>
# adopted minimal changes, not sure why check for root.tex

# scans ../src/ dir for .tex files and writes ../TeXAux/tikz_imports.tex with list of \input'able files:
# \input{..src/file1.tex}
# \input{..src/file2.tex}
# \input{..src/subdir1/file11.tex}
# \input{..src/subdir1/file12.tex}

# WORKING DIRECTORY
initial_working_directory=$( pwd ) # anywhere/ 
cd "$(dirname "$0")" # Tikz/sh/ ref: https://stackoverflow.com/questions/3349105/how-can-i-set-the-current-working-directory-to-the-directory-of-the-script-in-ba
cd .. # Tikz/

# OPTIONS:
ADDIMGINFO=false # true|false
MODCOPY2EXCLUDEOVERLAY=false # true|false    Note: false might break with beamer overlay specifications! (e.g. \onslide<n>{...}, \node<n-m>, \pause, ...)

# VARIABLES
FILE_INFO="""\
% FILE INFO
% ---------
% auto-generated file by ._tikz_scan.sh to \input{} all .tex files in Tikz/src/
% usally called pre-compilation of Tikz/tikz_standalone.tex by Tikz/.latexmkrc
%
% OPTIONS (set in ._tikz_scan.sh)
% -------
% MODCOPY2EXCLUDEOVERLAY set to:    ${MODCOPY2EXCLUDEOVERLAY}
%   if set false:   import unmodified original tikz files from Tikz/src/
%   if set true:    import modified hardcopied tikz files from Tikz/TeXAux/src/
%                   with removed beamer overlay specifications (prevent breaking)
% ADDIMGINFO set to:                ${ADDIMGINFO}
%   if set false:   nothing special
%   if set true:    do insert extra tikzpictures before each \input'ted tikz file with filename as readable text in tikz_standalone.pdf
"""
auxdir=./TeXAux
importfile=./TeXAux/tikz_imports.tex

mkdir -p $auxdir

# clear importfile
rm $importfile
touch $importfile
echo "$FILE_INFO" >> $importfile

if [[ $MODCOPY2EXCLUDEOVERLAY == false ]] ; then
    rm -r $auxdir/src 2>/dev/null # remove hardcopied directory (might exist due to former run with MODCOPY2EXCLUDEOVERLAY=true)
fi

# scan dir
for directory in $( find ./src -maxdepth 5 -type d ) ; do # for ./src and all subdirectories
    mkdir -p $auxdir/$directory # create similar directory structure in auxdir

    #echo "##############################"
    #echo "DEBUG directories: $directory"
    #echo "-----------------------------"

    if [[ $ADDIMGINFO == true ]] ; then
        # add img info in extra page before each parsed directory
        directory_name_texcomp=$(echo $directory | sed "s/_/\\\textunderscore{}/g") # escape _ with \textscore{}
        imginfo="Image on following page(s) from diretory \textbf{$directory_name_texcomp}"
        imginfotikzformat="\begin{tikzpicture}\node at (0,0) {$imginfo};\end{tikzpicture}"
        echo "${imginfotikzformat}" >> $importfile
    fi

    for filepath in $( find $directory -maxdepth 1 -type f ) ; do # for all files in currently parsed (sub)directory
        # get filename, stem, extension, directory
        filename=$(basename -- "$filepath")
        #stem="${filename%.*}"
        #extension="${filename##*.}"
        #directory=$(dirname -- "$filepath")

        #echo "DEBUG filepaths: $filepath"
        #echo "DEBUG filenames: $filename"

        if [[ $ADDIMGINFO == true ]] ; then
            # add img info in extra page before each image
            filename_texcomp=$(echo $filename | sed "s/_/\\\textunderscore{}/g") # escape _ with \textscore{}
            imginfo="\small Image on following page(s) from file \textbf{$filename_texcomp}"
            imginfotikzformat="\begin{tikzpicture}\node at (0,0) {$imginfo};\end{tikzpicture}"
            echo "${imginfotikzformat}" >> $importfile
        fi
        
        if [[ $MODCOPY2EXCLUDEOVERLAY == true ]] ; then
            # copy file to auxdir, preprocess file to remove beamer overlay commands and specifications (quick and dirty)
            cat $filepath | perl -0777 -pe 's/\\(?:only|onslide|uncover|visible)\<[^\>]*\>\{/\{/g' | perl -0777 -pe 's/(\\(?:[\w]*))(?:\<\d+[^\>]*\>)/\1/g' | perl -0777 -pe 's/\\pause//g' > $auxdir/$filepath # overwrite potentially former file in auxdir
            # 1. perl regex call: e.g. '\onslide<ANYTHING>{' --> '{'
            # 2. perl regex call: e.g. '\node<NUMBER-THAN-ANYTHING>' --> '\node'
            # 3. perl regex call: remove '\pause'
            # WARNING: '\alpha<5 blabla \beta>0' --> '\alpha0'
            # Problem: Difficult to match all patterns like: '\item<2| handout:0>' 
            # ... without falsely matching '\command< anything > anything', when '<' and '>' are used in math... (less likely in TiKz Pictures though)

            #cat plot.tex | perl -0777 -pe 's/(\\(?:only|onslide|uncover|visible)<[^>]*>\{((?:[^{}]*?|(?2)|(?:(?<[^[\\(?:only|onslide|uncover|visible)\<[^\>]*\>)]]|($1))*)\})/$2/g' | bat -pltex
            # recursive call is error prone with no benefit except also removing the '{...}' brackets from '\only{...}' and similar to '...'
            # complicated with nested all à la '\only<2-10>{...stuff...\onslide<5>{...}text...\otherthings{} and more}'

            # append import statement
            filepath_without_leading_dot=$(echo $filepath | sed 's/^\.\///') # remove leading ./
            echo "\input{./TeXAux/${filepath_without_leading_dot}}	% Modified hardcopy! Original file: ${filepath}" >> $importfile
        elif [[ $MODCOPY2EXCLUDEOVERLAY == false ]] ; then
            # append import statement
            filepath_without_leading_dot=$(echo $filepath | sed 's/^\.\///') # remove leading ./
            echo "\input{${filepath_without_leading_dot}}" >> $importfile
        else
            echo "Whuat? Set option MODCOPY2EXCLUDEOVERLAY correct."
            cd $initial_working_directory
            exit 1
        fi
    done

done
# Note on tikz_imports.tex \input order:
# works fine from terminal, does weird stuff if tikz_imports.tex is opened in VSCode

cd $initial_working_directory