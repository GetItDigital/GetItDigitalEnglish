#!/bin/bash

# alternative to TiKz library externalize: https://tikz.dev/library-external
#
# create one .pdf, .png and .svg for each TiKz picture using documentclass standalone (multithreading by parallel compilation)
#
# USAGE: 		bash tikz_externalize.sh
#
# DIRECTORY STRUCTURE:
#	./
#	├── Templates
#	│   └── Settings.tex
#	└── module-xyz/ 
#		└── Tikz/
#			├── sh/
#			│	└── tikz_externalize.sh
#			└── src/
#				├── <file1>.tex
#				├── ...
#				└── <filem>.tex
#
# OUTPUTS: (for each .tex file in ./src/)
#	./
#	└── module-xyz/ 
#		└── Tikz/
#			├── pdf/
#			│   ├── <file1>.pdf
#			│   ├── ...
#			│   └── <filem>.pdf
#			├── png/
#			│   ├── <file1>.png
#			│   ├── ...
#			│   └── <filem>.png
#			└── svg/
#				├── <file1>.svg
#				├── ...
#				└── <filem>.svg
#
# Note: file- and subdirectory names should not contain spaces or special characters
#
# Author: Matthias Werle, 2025
# Licence: CC-BY 4.0

# SETTINGS
# ------------------------------------

FROMSCRATCH=false 		# if set true, remove all files in $auxdir, $pdfdir and $svgdir before starting
EXPORTPDF2SVG=true 		# if set true, export .pdf to .svg files
EXPORTPDF2PNG=true 		# if set true, export .pdf to .png files
REMOVECOMPILABLES=true	# if set true, remove temporary compilable files after creating .pdf files
MAXSUBDIRDEPTH=5 		# depth of subdirectories to be included in src/ (default: 5)
TIMEOUT=45 				# timeout in seconds for waiting for each individual .pdf file to be created
WAITTIME=1				# wait time in seconds for each individual .pdf before moving and converting to .svg
TIKZBORDER="1pt"		# border around tikzpicture in .pdf, recommended: "1pt"

# LaTeX Template
# --------------

PREFIX="""% compilable standalone document for Tikz pictures created by ${0}
\documentclass[border = ${TIKZBORDER}, multi={tikzpicture}]{standalone}
\input{Settings.tex} % Attention! Symlink pointing to MAINDIR/Templates/Setting.tex 
\begin{document}
"""

POSTFIX="""
\end{document}
"""

# WORKING DIRECTORY
# ----------------
origdir=$( pwd ) # save original directory
cd "$(dirname "$0")" # ref: https://stackoverflow.com/questions/3349105/how-can-i-set-the-current-working-directory-to-the-directory-of-the-script-in-ba
cd ../src # $tikzdir

# PATHS: relative Tikz/src/ (no trailing "/" allowed)
settingsdir=../../../Templates # source directory with templates
tikzdir=.. 		# source directory with tikz_standalone.tex
shdir=../sh 	# source directory with .sh scripts
srcdir=. 		# source directory with tikzpictures as *.tex files
pdfdir=../pdf 	# output directory for generated tikzpicture, PDF-format
pngdir=../png	# output directory for generated tikzpicture, PNG-format
svgdir=../svg 	# output directory for generated tikzpicture, SVG-format
auxdir=../TeXAux # output directory for auxillary files for LaTeX Compilation; might have to match $auxdir in other .sh scripts
errorlog=$auxdir/errorlog.txt # errorlog file

settingsdirabs=$( realpath $settingsdir ) # absolute path to $settingsdir
srcdirabs=$( realpath $srcdir ) # absolute path to $srcdir
tikzdirabs=$( realpath $tikzdir ) # absolute path to $tikzdir

# functions
stats(){
	echo -e "Stats:\t\t\t\t(including subdirectories)"
	echo -e "\t$( find $srcdir -maxdepth $MAXSUBDIRDEPTH -type f -name "*.tex" | wc -l )\t.tex files in\t$( realpath $srcdir )"
	echo -e "\t$( find $pdfdir -maxdepth $MAXSUBDIRDEPTH -type f -name "*.pdf" | wc -l )\t.pdf files in\t$( realpath $pdfdir )"
	if [[ $EXPORTPDF2PNG == true ]] ; then echo -e "\t$( find $pngdir -maxdepth $MAXSUBDIRDEPTH -type f -name "*.png" | wc -l )\t.png files in\t$( realpath $pngdir )" ; fi
	if [[ $EXPORTPDF2SVG == true ]] ; then echo -e "\t$( find $svgdir -maxdepth $MAXSUBDIRDEPTH -type f -name "*.svg" | wc -l )\t.svg files in\t$( realpath $svgdir )" ; fi
}

pressed_ctrl_c=
trap "pressed_ctrl_c=1" SIGINT # used to break loops in subshells

# check file dependencies
if [ ! -f $settingsdir/Settings.tex ] ; then 
	echo "Error: $settingsdir/Settings.tex not found, please create file or check path. Nothing to do."
	exit 1
fi

# check direcotry structure
if [[ ! -d  $srcdir ]] ; then
	echo "Error: $srcdir not found, please create directory with tikzpictures or check path. Nothing to do."
	exit 1
fi

# cleanup
if [[ $FROMSCRATCH == true ]] ; then
	rm -r $auxdir/*
	rm -r $pdfdir/*
	rm -r $pngdir/*
	rm -r $svgdir/*
fi

mkdir -p $auxdir


# PRECOMPILE TIKZPICTURES: .tex -> .pdf -> .svg, .png
# ---------------------------------------------------

echo "/--------------------t-i-k-z---e-x-t-e-r-n-a-l-i-z-e-.-s-h---------------------\\"
for directory in $( find $srcdir -maxdepth 5 -type d ) ; do # for ./src and all subdirectories
	directoryname=$( echo "$directory" | sed -e "s/\.\///" ) # remove leading "./" from directory
	echo $directory

	mkdir -p ${pdfdir}/${directoryname} # create similar directory structure in pdfdir
	mkdir -p ${pngdir}/${directoryname} # create similar directory structure in pngdir
	mkdir -p ${svgdir}/${directoryname} # create similar directory structure in svgdir
	mkdir -p ${auxdir}/${directoryname} # create similar directory structure in auxdir
	mkdir -p ${auxdir}/md5/${directoryname} # create similar directory structure in auxdir for md5sums

	srcdirlink=$srcdirabs/$directoryname
	settingslink=$settingsdirabs/Settings.tex
	rm ${auxdir}/${directoryname}/srcdirlink 2>/dev/null
	ln -s $srcdirlink ${auxdir}/${directoryname}/srcdirlink # create symlink from $auxdir/$directoryname to corresponding $directory (in Tikz/src/) to easily \input{} src files
	ln -s $settingslink ${auxdir}/${directoryname}/Settings.tex # create symlink from $auxdir/$dictoryname/Settings.tex to Settings.tex
done

stats
echo -e "Start Compiling TiKz pictures... in parallel execution, no threadlimit! \n\tWARNING: CPU load high! --> STOP with Ctrl+C <--)\n"

touch $errorlog # create errorlog file

# MAIN
time $( # measure execution time
for directory in $( find $srcdir -maxdepth $MAXSUBDIRDEPTH -type d ) ; do # loop through src/ and it's subdirectories
	if [[ "$directory" == "unused" ]] ; then continue ; fi # skip unused directory
( # parallel execution for each directory ref: https://unix.stackexchange.com/questions/103920/parallelize-a-bash-for-loop
	directoryname=$( echo "$directory" | sed -e "s/\.\///" ) # remove leading "./" from current directory
    for filepath in $( find $directory -maxdepth 1 -name "*.tex" -type f ) ; do # loop through all texfiles in current directory
		if [ "$pressed_ctrl_c" ] ; then break ; fi
	( 	# parallel execution for each file ref: https://unix.stackexchange.com/questions/103920/parallelize-a-bash-for-loop
		filename=$(basename -- "$filepath")
		stem="${filename%.*}"
		pathstem="${filepath%.*}"
		pathstem=$( echo "$pathstem" | sed -e "s/\.\///" ) # remove leading "./" from pathstem
		extension="${filename##*.}"

		# check md5sum
		if [[ -f $auxdir/md5/$pathstem.md5 ]] ; then
			md5_old=$(cat $auxdir/md5/$pathstem.md5)
		else
			md5_old="0"
		fi
		md5_new=$(md5sum $filepath | cut -d ' ' -f 1)

		# Note: subshell workaround - execute if requirements are met (instead of exiting if they are not met)
		# Ref: https://stackoverflow.com/questions/13726764/while-loop-subshell-dilemma-in-bash

		# execute if md5sum changed or output files do not exist
		if [[ "$md5_new" != "$md5_old" ]] \
			|| [[ ! -f "$pdfdir/$pathstem.pdf" ]] \
			|| [[ ! -f "$pngdir/$pathstem.png" && $EXPORTPDF2PNG == true ]] \
			|| [[ ! -f "$svgdir/$pathstem.svg" && $EXPORTPDF2SVG == true ]] ; then

			# create compilable .tex in $auxdir
			echo "$PREFIX" > ${auxdir}/${directoryname}/compilable_${filename} # overwrite/create >
			echo "\input{srcdirlink/${filename}} % Attention! Symlink pointing to Tikz sourcefile." >> ${auxdir}/${directoryname}/compilable_${filename} # append >>
			echo "$POSTFIX" >> ${auxdir}/${directoryname}/compilable_${filename} # append >>

			# compile .pdf and move to $pdfdir
			printf "\tCompiling $filename ...\n"
			pdflatex -interaction=nonstopmode -output-directory ${auxdir}/${directoryname} ${auxdir}/${directoryname}/compilable_${filename} & pdflatexid=$! # compile, get pid
			trap "kill $pdflatexid 2> /dev/null" SIGINT SIGTERM # kill pdflatex on ctrl+c

			# DEBUG
			echo "file: $filepath pdflatex pid: $pdflatexid" >> $errorlog # log file

			# wait for file to be created
			timer=$TIMEOUT
			trap 'timer=$TIMEOUT' SIGINT SIGTERM # set timeout on ctrl+c
			while (($timer > 0)) ; do # https://stackoverflow.com/questions/20165057/executing-bash-loop-while-command-is-running
				sleep 1 ; ((timer -= 1))
				kill -0 $pdflatexid 2>/dev/null || break
			done

			# move to $pdfdir, overwrite if exists (remove "compilable_" prefix in filename)
			mv ${auxdir}/${directoryname}/compilable_${stem}.pdf ${pdfdir}/${directoryname}/${stem}.pdf &
			wait

			# export .pdf to .svg and move to $svgdir
			if [[ "$md5_new" != "$md5_old" ]] || [[ $EXPORTPDF2SVG == true ]] && [[ ! -f "$svgdir/$pathstem.svg" ]] ; then
				pdf2svg ${pdfdir}/${pathstem}.pdf ${svgdir}/${pathstem}.svg all 2>> $errorlog || echo "pdf2svg: failed to open ${pdfdir}/${pathstem}.pdf" >> $errorlog
			fi

			# export .pdf to .png and move to $pngdir
			if [[ "$md5_new" != "$md5_old" ]] || [[ $EXPORTPDF2PNG == true ]] && [[ ! -f "$pngdir/$pathstem.png" ]] ; then
				#convert -density 300 ${pdfdir}/${pathstem}.pdf -quality 90 ${pngdir}/${pathstem}.png 2>> $errorlog || echo "convert: failed to open ${pdfdir}/${pathstem}.pdf" >> $errorlog
				# default density is 72 dpi http://www.imagemagick.org/script/command-line-options.php#density use \includegraphics[scale=0.1]{file.png} for same size as pdf
				convert -density 720 ${pdfdir}/${pathstem}.pdf -quality 100 ${pngdir}/${pathstem}.png 2>> $errorlog || echo "convert: failed to open ${pdfdir}/${pathstem}.pdf" >> $errorlog
			fi
			# update md5sum
			echo $md5_new > $auxdir/md5/$pathstem.md5
		fi
	) &
	done ; wait
) &
done ; wait
) 2>/dev/null # measure execution time
kill "$bgid" ; wait # kill progressbar

# remove temporary files
if [[ $REMOVECOMPILABLES == true ]] ; then
	rm -r $auxdir/*/compilable_* 2>/dev/null # remove compilable files
	rm -r $auxdir/*/srcdirlink 2>/dev/null # remove srcdirlink
fi

echo ""
stats ; echo "Done Compiling TiKz pictures."
if [[ $( find $srcdir -type f -name "*.tex" | wc -l ) > $( find $pdfdir -type f -name "*.pdf" | wc -l ) ]] ; then
	echo -e "\nWarning:\tnot all .tex files were compiled to .pdf files."
	echo -e "\t\tTry to run the script again or check $errorlog for errors."
fi
if [[ $( find $pdfdir -type f -name "*.pdf" | wc -l ) > $( find $svgdir -type f -name "*.svg" | wc -l ) ]] ; then
	echo -e "\nWarning:\tnot all .pdf files were exported to .svg files."
	echo -e "\t\tTry to run the script again or check $errorlog for errors."
fi
echo "\------------------------------------------------------------------------------/"

cd $origdir # return to original directory

# Disable traps on a normal exit
#trap - EXIT SIGINT SIGTERM
exit 0