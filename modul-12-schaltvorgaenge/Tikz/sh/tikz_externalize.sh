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
MAXTHREADNUMBER=10		# maximum number of parallel threads for compilation
TIKZBORDER="1pt"		# border around tikzpicture in .pdf, recommended: "1pt"

# WORKING DIRECTORY
# ----------------
origdir=$( pwd ) # save original directory
cd "$(dirname "$0")" || exit # ref: https://stackoverflow.com/questions/3349105/how-can-i-set-the-current-working-directory-to-the-directory-of-the-script-in-ba
cd ../src || exit # $tikzdir

# PATHS: relative Tikz/src/ (no trailing "/" allowed)
settingsdir=../../../Templates 				# source directory with templates
srcdir=. 									# source directory with tikzpictures as *.tex files
pdfdir=../pdf 								# output directory for rendered tikzpicture, PDF-format
pngdir=../png								# output directory for rendered tikzpicture, PNG-format
svgdir=../svg 								# output directory for rendered tikzpicture, SVG-format
auxdir=../TeXAux 							# output directory for auxillary files for LaTeX Compilation
errorlog=$auxdir/errorlog.txt 				# errorlog file

settingsdirabs=$( realpath $settingsdir ) 	# absolute path to $settingsdir
srcdirabs=$( realpath $srcdir ) 			# absolute path to $srcdir

# functions
stats(){
	echo -e "Stats:\t\t\t\t(including subdirectories)"
	echo -e "\t$( find $srcdir -maxdepth $MAXSUBDIRDEPTH -type f -name "*.tex" | wc -l )\t.tex files in\t$( realpath $srcdir )"
	echo -e "\t$( find $pdfdir -maxdepth $MAXSUBDIRDEPTH -type f -name "*.pdf" | wc -l )\t.pdf files in\t$( realpath $pdfdir )"
	if [[ $EXPORTPDF2PNG == true ]] ; then echo -e "\t$( find $pngdir -maxdepth $MAXSUBDIRDEPTH -type f -name "*.png" | wc -l )\t.png files in\t$( realpath $pngdir )" ; fi
	if [[ $EXPORTPDF2SVG == true ]] ; then echo -e "\t$( find $svgdir -maxdepth $MAXSUBDIRDEPTH -type f -name "*.svg" | wc -l )\t.svg files in\t$( realpath $svgdir )" ; fi
}

# cleanup
if [[ $FROMSCRATCH == true ]] ; then
	rm -r $auxdir/*
	rm -r $pdfdir/*
	rm -r $pngdir/*
	rm -r $svgdir/*
fi

echo "/--------------------t-i-k-z---e-x-t-e-r-n-a-l-i-z-e-.-s-h---------------------\\"

mkdir -p $auxdir
for directory in $( find $srcdir -maxdepth $MAXSUBDIRDEPTH -type d ) ; do # for all source subdirectories
	directoryname=$( echo "$directory" | sed -e "s/\.\///" ) # remove leading "./" 

	# create output subdirectories
	mkdir -p ${pdfdir}/${directoryname}
	mkdir -p ${pngdir}/${directoryname}
	mkdir -p ${svgdir}/${directoryname}
	mkdir -p ${auxdir}/${directoryname}
	mkdir -p ${auxdir}/md5/${directoryname}
done

stats
echo -e "\nStart Compiling TiKz pictures... (parallel compilation, thread limit = ${MAXTHREADNUMBER}) \nWarning! CPU load might be high! --> To STOP press Ctrl+C <--"

rm $errorlog 2>/dev/null
touch $errorlog # create errorlog file

mkdir -p "${auxdir}/pid"

# PRECOMPILE TIKZPICTURES: .tex -> .pdf -> .svg, .png
# ---------------------------------------------------
time $( # measure execution time
for directory in $( find $srcdir -maxdepth $MAXSUBDIRDEPTH -type d ) ; do # loop through src/ and it's subdirectories
	if [[ "$directory" == "unused" ]] ; then continue ; fi # skip unused directory
( # parallel execution for each directory ref: https://unix.stackexchange.com/questions/103920/parallelize-a-bash-for-loop
	directoryname=$( echo "$directory" | sed -e "s/\.\///" ) # remove leading "./"
    for filepath in $( find $directory -maxdepth 1 -name "*.tex" -type f ) ; do # loop through all texfiles in current directory
	( 	# parallel execution for each file ref: https://unix.stackexchange.com/questions/103920/parallelize-a-bash-for-loop
		trap 'exit' SIGINT SIGTERM # exit subshell if pressed Ctrl+C
		stem=$( basename "${filepath}" .tex )
		pathstem=$( echo "${filepath%.*}" | sed -e "s/\.\///" ) # remove leading "./"

		# check md5sum
		if [[ -f "${auxdir}/md5/${pathstem}.md5" ]] ; then
			md5_old=$( cat "${auxdir}/md5/${pathstem}.md5" )
		else
			md5_old="0"
		fi
		md5_new=$( md5sum $filepath | cut -d ' ' -f 1 )

		# Note: subshell workaround - execute if requirements are met (instead of exiting if they are not met)
		# Ref: https://stackoverflow.com/questions/13726764/while-loop-subshell-dilemma-in-bash

		# execute if md5sum changed or output files do not exist
		if [[ "$md5_new" != "$md5_old" ]] \
			|| [[ ! -f "${pdfdir}/${pathstem}.pdf" ]] \
			|| [[ ! -f "${pngdir}/${pathstem}.png" && $EXPORTPDF2PNG == true ]] \
			|| [[ ! -f "${svgdir}/${pathstem}.svg" && $EXPORTPDF2SVG == true ]] ; then

			# LaTeX Template
			# --------------
			PREFIX="""
				% compilable standalone document for Tikz pictures created by ${0}
				\documentclass[border = ${TIKZBORDER}, multi={tikzpicture}]{standalone}
				\input{${settingsdirabs}/Settings.tex}
				\begin{document}"""
			POSTFIX="""
				\end{document}"""

			# create compilable .tex in $auxdir
			echo "$PREFIX" > ${auxdir}/${directoryname}/compilable_${stem}.tex # overwrite/create >
			echo "\input{${srcdirabs}/${directoryname}/${stem}.tex}" >> ${auxdir}/${directoryname}/compilable_${stem}.tex # append >>
			echo "$POSTFIX" >> ${auxdir}/${directoryname}/compilable_${stem}.tex # append >>

			# wait until thread number is below maximum
			timer=$TIMEOUT
			while (($timer > 0)); do # https://stackoverflow.com/a/33891876
				sleep 1 ; ((timer -= 1))
				(( $( find "${auxdir}/pid" -maxdepth $MAXSUBDIRDEPTH -name "*.pid" -type f | wc -l ) >= $MAXTHREADNUMBER )) || break # counts pid tokens
			done

			# compile .pdf
			pdflatex -interaction=nonstopmode -output-directory ${auxdir}/${directoryname} ${auxdir}/${directoryname}/compilable_${stem}.tex 2>> $errorlog & pdflatexid=$! # compile, get pid
			echo $pdflatexid >> "${auxdir}/pid/${stem}.pid" # create pid token

			# wait until compilation is finished
			timer=$TIMEOUT
			while (($timer > 0)) ; do # https://stackoverflow.com/questions/20165057/executing-bash-loop-while-command-is-running
				sleep 1 ; ((timer -= 1))
				kill -0 $pdflatexid 2>/dev/null || break
			done

			# move .pdf to $pdfdir, overwrite if exists (remove "compilable_" prefix in filename)
			mv "${auxdir}/${directoryname}/compilable_${stem}.pdf" "${pdfdir}/${directoryname}/${stem}.pdf" 2>> $errorlog & wait
			rm "${auxdir}/pid/${stem}.pid" # remove pid token

			# export .pdf to .svg and move to $svgdir
			if [[ "${md5_new}" != "${md5_old}" ]] || [[ $EXPORTPDF2SVG == true ]] && [[ ! -f "$svgdir/$pathstem.svg" ]] ; then
				pdf2svg ${pdfdir}/${pathstem}.pdf ${svgdir}/${pathstem}.svg all 2>> $errorlog || echo "pdf2svg: failed to open ${pdfdir}/${pathstem}.pdf" >> $errorlog
			fi

			# export .pdf to .png and move to $pngdir
			if [[ "${md5_new}" != "${md5_old}" ]] || [[ $EXPORTPDF2PNG == true ]] && [[ ! -f "$pngdir/$pathstem.png" ]] ; then
				# default density is 72 dpi http://www.imagemagick.org/script/command-line-options.php#density use \includegraphics[scale=0.1]{file.png} for same size as pdf
				convert -density 720 ${pdfdir}/${pathstem}.pdf -quality 100 ${pngdir}/${pathstem}.png 2>> $errorlog || echo "convert: failed to open ${pdfdir}/${pathstem}.pdf" >> $errorlog
			fi
			# update md5sum
			echo "${md5_new}" > "${auxdir}/md5/${pathstem}.md5"
		fi
	) &
	done ; wait
) &
done ; wait
) 2>/dev/null # measure execution time
wait

# remove temporary files
if [[ $REMOVECOMPILABLES == true ]] ; then
	rm -r $auxdir/../**/compilable_* 2>/dev/null # remove compilable files
	rm -r $auxdir/../**/srcdir.link 2>/dev/null # remove srcdir.link
	rm -r $auxdir/../**/Settings.link 2>/dev/null # remove Settings.link
	rm -r $auxdir/pid 2>/dev/null # remove pid directory
fi

echo ""
stats ; echo -e "\nDone Compiling TiKz pictures."
echo "\------------------------------------------------------------------------------/"

cd $origdir # return to original directory

# Disable traps on a normal exit
trap - EXIT SIGINT SIGTERM
exit 0