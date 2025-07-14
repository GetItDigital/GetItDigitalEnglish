#!/bin/bash

[ ! -d "TTS" ] && mkdir "TTS"

cd TeXAux

#loop through tts-files
for filename in tts-*.txt; do
    #get filename without extension
    filenameo="${filename%.*}"

    #replace umlaute
    sed -i -e 's/\\OT1\\ss /ß/g' $filename
    sed -i -e 's/\\protect {\\grmnU@D 1ex{\\setbox \\z@ \\hbox {\\char 127}\\dimen@ -.45ex\\advance \\dimen@ \\ht \\z@ \\fontdimen 5\\font \\dimen@ }\\accent 127\\fontdimen 5\\font \\grmnU@D a}\\penalty \\@M \\hskip \\z@skip /ä/g' $filename
    sed -i -e 's/\\protect {\\grmnU@D 1ex{\\setbox \\z@ \\hbox {\\char 127}\\dimen@ -.45ex\\advance \\dimen@ \\ht \\z@ \\fontdimen 5\\font \\dimen@ }\\accent 127\\fontdimen 5\\font \\grmnU@D A}\\penalty \\@M \\hskip \\z@skip /Ä/g' $filename
    sed -i -e 's/\\protect {\\grmnU@D 1ex{\\setbox \\z@ \\hbox {\\char 127}\\dimen@ -.45ex\\advance \\dimen@ \\ht \\z@ \\fontdimen 5\\font \\dimen@ }\\accent 127\\fontdimen 5\\font \\grmnU@D o}\\penalty \\@M \\hskip \\z@skip /ö/g' $filename
    sed -i -e 's/\\protect {\\grmnU@D 1ex{\\setbox \\z@ \\hbox {\\char 127}\\dimen@ -.45ex\\advance \\dimen@ \\ht \\z@ \\fontdimen 5\\font \\dimen@ }\\accent 127\\fontdimen 5\\font \\grmnU@D O}\\penalty \\@M \\hskip \\z@skip /Ö/g' $filename
    sed -i -e 's/\\protect {\\grmnU@D 1ex{\\setbox \\z@ \\hbox {\\char 127}\\dimen@ -.45ex\\advance \\dimen@ \\ht \\z@ \\fontdimen 5\\font \\dimen@ }\\accent 127\\fontdimen 5\\font \\grmnU@D u}\\penalty \\@M \\hskip \\z@skip /ü/g' $filename
    sed -i -e 's/\\protect {\\grmnU@D 1ex{\\setbox \\z@ \\hbox {\\char 127}\\dimen@ -.45ex\\advance \\dimen@ \\ht \\z@ \\fontdimen 5\\font \\dimen@ }\\accent 127\\fontdimen 5\\font \\grmnU@D U}\\penalty \\@M \\hskip \\z@skip /Ü/g' $filename

    #test if file exists in target folder
    if [ -f "../TTS/$filename" ]; then
        #test if file contents are same
        if  diff -w "$filename" "../TTS/$filename" ; then
            if [ ! -f "../TTS/$filenameo.wav" ]; then
                echo "$filenameo.wav not exists";
                processFile=true
            else
                echo "$filename exists and is identical";
                processFile=false
            fi
        else
            echo "$filename exists but is different";
            processFile=true
        fi
    else
        echo "$filename not exists";
        processFile=true
    fi

    if [ "$processFile" = true ] ; then
        echo "process audio for $filename";
        text=`cat $filename`

        #process text-to-speech
        python3 ../../Video/Make_TTS.py "$filenameo" "$text"

        if [ $? -eq 0 ]; then
            #save file in target folder
            cp -f $filename ../TTS/$filename
        fi        
    fi
done