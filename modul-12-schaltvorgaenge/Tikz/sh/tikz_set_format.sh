#!/bin/bash

# script to modify *.tex files to use tikzpictures as .tex's (source) or .pdf's or .png's (precompiled)
#
# EXAMPLES:
# \includegraphics{Tikz/pdf/**/<file>.pdf}               % FORMAT=pdf 
# \includegraphics[scale=0.1]{Tikz/png/**/<file>.png}    % FORMAT=png 
# \input{Tikz/src/**/<file>.tex}                         % FORMAT=tex

echo "/------------------------------------------------------------------------------\\"
while (( $# > 0 )); do
    case $1 in
        -h|--help)
            echo -e "modify *.tex files to use tikzpictures as .tex's (source) or .pdf's or .png's (precompiled)"
            echo -e "\nUSAGE:                     bash $0 [OPTIONS]"
            echo -e "\nOPTIONS:"
            echo -e "    -f|--format FORMAT       use tikzpictures in FORMAT format (pdf, png or tex)"
            echo -e "    -d|--maxdepth MAXDEPTH   set maxdepth of directories to parse to modify .tex files (e.g. Kapitel1.tex) relative to location of this script!"
            echo -e "    -h|--help                show this help"
            echo -e "    -n|--non-interactive     run in none-interactive mode (cli arguments only)"
            echo -e "    -p|--path EXEPATH        set path to parse for .tex files (default: parent-parent-directory of $0)"
            echo -e "    <no further arguments>   run with default settings (FORMAT=pdf, MAXDEPTH=0)"
            echo "\------------------------------------------------------------------------------/"
            exit 0
            ;;
        -f|--format)
            FORMAT=$2
            shift 2
            ;;
        -d|--maxdepth)
            MAXDEPTH=$2
            shift 2
            ;;
        -p|--path)
            EXEPATH=$2
            shift 2
            ;;
        -n|--non-interactive)
            NONINTERACTIVE=true
            shift
            ;;
        *)
            echo "Error: unknown argument $1"
            exit 1
            ;;
    esac
done

if [[ ! $NONINTERACTIVE == true ]] ; then 
    echo -e "\nrun\tbash $0 -h\tfor help, press [CTRL]+[C] to abort.\n"
    # PROMPT USER if not set
    if [ -z ${FORMAT+x} ] ;     then read -p "Enter FORMAT   [pdf] or png or tex: " FORMAT ; fi
    if [ -z ${EXEPATH+x} ] ;    then read -p "Enter EXEPATH  [$(dirname "$0")/../..] to parse for .tex files: " EXEPATH ; fi
    if [ -z ${MAXDEPTH+x} ] ;   then read -p "Enter MAXDEPTH [0] (no subdirs) or 1, 2, 3 ... to parse for .tex files: " MAXDEPTH ; fi
fi

# SETTINGS
FORMAT=${FORMAT:-pdf} # default value
MAXDEPTH=${MAXDEPTH:-0} # default value
EXEPATH=${EXEPATH:-"$(dirname "$0")/../.."} # default value ref: https://stackoverflow.com/questions/3349105/how-can-i-set-the-current-working-directory-to-the-directory-of-the-script-in-ba

# WORKING DIRECTORY
initial_working_directory=$( pwd )  # <anywhere>/ 
cd $EXEPATH

# INFO
echo -e "\nChange use of tikzpictures to $FORMAT format in all *.$FORMAT files in\n\t$PWD/ and subdirectories (MAXDEPTH=$MAXDEPTH)."
if [[ $FORMAT == pdf ]] ; then 
    echo -e "from\t\input{Tikz/src/**.tex} OR \includegraphics[scale=0.1]{Tikz/png/**.png}\toccurences\nto\t\includegraphics{Tikz/pdf/**.pdf}"
    echo -e "\nto precompile tikz pictures run:\n\tbash $PWD/Tikz/sh/tikz_externalize.sh\n"
elif [[ $FORMAT == png ]] ; then 
    echo -e "from\t\input{Tikz/src/**.tex} OR \includegraphics{Tikz/pdf/**.pdf}\toccurences\nto\t\input{Tikz/src/**.tex}"
    echo -e "\t\includegraphics[OPTIONS]{Tikz/pdf/*.pdf} ---> ignored"
    echo -e "\nto precompile tikz pictures run:\n\tbash $PWD/Tikz/sh/tikz_externalize.sh\n"
elif [[ $FORMAT == tex ]] ; then 
    echo -e "from\t\includegraphics{Tikz/pdf/*.pdf} OR \includegraphics[scale=0.1]{Tikz/png/*.png}\toccurences\n\to\t\input{Tikz/src/*.tex}"
    echo -e "\t\includegraphics[OPTIONS]{Tikz/pdf/*.pdf} ---> ignored"
else
    echo -e "Error: FORMAT=$FORMAT not supported. Run script with -h or --help for help."
    exit 1
fi

# MAIN
echo "start modifying .tex files in $PWD/ and subdirectories (MAXDEPTH=$MAXDEPTH) to use tikzpicture in FORMAT=$FORMAT ..." 
for texfile in $( find . -maxdepth 1 -type f -name "*.tex" ) ; do
    tikzpdfs=$( grep -c "{Tikz\/pdf\/.*\.pdf" $texfile ) # count
    tikzpngs=$( grep -c "{Tikz\/png\/.*\.png" $texfile ) # count
    tikztexs=$( grep -c "{Tikz\/src\/.*\.tex" $texfile ) # count
    case $FORMAT in
        # nothing to do (no tikzpictures in different format used)
        pdf) if (( $tikzexts+$tikzpngs == 0 )) ; then continue ; fi ;;
        png) if (( $tikzexts+$tikzpdfs == 0 )) ; then continue ; fi ;;
        tex) if (( $tikzpdfs+$tikzpngs == 0 )) ; then continue ; fi ;;
        *) echo -e "Error: FORMAT=$FORMAT not supported. Run script with -h or --help for help." ; exit 1 ;;
    esac
    # something to do
    if [[ $FORMAT == pdf ]] ; then echo -e "$texfile \tmodify to use tikzpictures in $FORMAT format...\t($tikztexs+$tikzpngs occurrences)"
        perl -i -pe 's/\\input{Tikz\/src\/((?:(?!\.tex).)*)\.tex}/\\includegraphics{Tikz\/pdf\/\1\.pdf}/g' $texfile # input{*.tex} to includegraphics{*.pdf}
        perl -i -pe 's/\\includegraphics\[(?:(?!\]).)*\]{Tikz\/png\/((?:(?!\.png).)*)\.png}/\\includegraphics{Tikz\/pdf\/\1\.pdf}/g' $texfile # includegraphics[*]{*.png} to includegraphics{*.pdf}
    elif [[ $FORMAT == png ]] ; then echo -e "$texfile \tmodify to use tikzpictures in $FORMAT format...\t($tikztexs+$tikzpdfs occurrences)"
        perl -i -pe 's/\\input{Tikz\/src\/((?:(?!\.tex).)*)\.tex}/\\includegraphics[scale=0.1]{Tikz\/png\/\1\.png}/g' $texfile # input{*.tex} to includegraphics[scale=0.1]{*.png}
        perl -i -pe 's/\\includegraphics{Tikz\/pdf\/((?:(?!\.pdf).)*)\.pdf}/\\includegraphics[scale=0.1]{Tikz\/png\/\1\.png}/g' $texfile # includegraphics[*]{*.pdf} to includegraphics[scale=0.1]{*.png}
    elif [[ $FORMAT == tex ]] ; then echo -e "$texfile \tmodify to use tikzpictures in $FORMAT format...\t($tikzpngs+$tikzpdfs occurrences)"
        perl -i -pe 's/\\includegraphics{Tikz\/pdf\/((?:(?!\.pdf).)*)\.pdf}/\\input{Tikz\/src\/\1\.tex}/g' $texfile # includegraphics{*.pdf} to input{*.tex}
        perl -i -pe 's/\\includegraphics\[(?:(?!\]).)*\]{Tikz\/png\/\\input{Tikz\/src\/\1\.tex}/g' $texfile # includegraphics[*]{*.png} to to input{*.tex}
    else 
        echo "Error? $texfile not modified. Please check file."
    fi
done
echo "...finished."

cd $initial_working_directory
echo "\------------------------------------------------------------------------------/"