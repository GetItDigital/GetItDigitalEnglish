# How-To (short)

Um alle TikZ Bilder in `Tikz/src/*` zu PDF, PNG und SVG Dateien zu kompilieren, im Terminal folgenden Befehl ausführen: 

```bash
bash Tikz/sh/tikz_externalize.sh
```

# Datei Baum

<pre>
<b>Tikz/</b>
├── <i>README.md</i>
├── <b>TeXAux/</b>		<b>LaTeX Output</b>
│   ├...
│   └── ...
├── <b>pdf/</b>			<b>PDF Output</b>
│   ├── <i>some_tikzfile.pdf</i>
│   ├...
│   └── <i>other_tikzfile.pdf</i>
├── <b>png/</b>			<b>PNG Output</b>
│   ├── <i>some_tikzfile.png</i>
│   ├...
│   └── <i>other_tikzfile.png</i>
├── <b>sh/ </b>			<b>Bash Scripts</b>
│   ├── <i>tikz_cleaner.sh</i>			removes unused TikZ Source files
│   ├── <i>tikz_externalize.sh</i>		compiles TikZ Source files to seperate PDF, PNG and SVG files [<a href="#tikz-externalize">s.u.</a>]
│   └── <i>tikz_set_format.sh</i>		sets format used by <i>Skript.tex</i> and <i>Folien.tex</i>
├── <b>src/</b>			<b>TikZ Source files</b>
│   ├── <i>some_tikzfile.tex</i>
│   ├...
│   └── <i>other_tikzfile.tex</i>
├── <b>svg/</b>			<b>SVG Output</b>
│   ├── <i>some_tikzfile.svg</i>
│   ├...
│   └── <i>other_tikzfile.svg</i>
└── <i>tikz_standalone.tex</i>		LaTeX Dokument: compiles TikZ Source files to one single PDF document [<a href="#tikz-standalone">s.u.</a>]
</pre>

**TikZ Bilder**

Im `Tikz/` Ordner befinden sich der Code für alle TikZ Bilder. Darunter fallen alle $\LaTeX$ Bilder basierend auf den Packages:

- `circuitikz` (bereits enthalten in tikzpicture)
- `pgfplots` (optional, zusätzlich zu tikzpicture) 
- `tikzpicture`

Die TikZ Bilder sind in den jeweiligen Dateien `./Tikz/src/<jeweiliger-dateiname>.tex` als $\LaTeX$ Code im Format:
```latex
\begin{tikzpicture}
	... % Inhalt 
\end{tikzpicture}`
```
gegeben. Jeweils ein `tikzpicture` environment je Datei.

Zum Kompilieren einzelner Bilder entweder:

- das Bash script `tikz_externalize.sh` [[s.u.]](#tikz-externalize) ausführen oder
- das LaTeX Dokument `tikz_standalone.tex` [[s.u.]](#tikz-standalone) kompilieren.

Der TikZ Code einzelner Bilder sollte ohne größere Anpassung in anderen $\LaTeX$ Dokumenten verwendet werden können.

## TikZ Externalize
Bei Start des Terminals im Parent directory, folgende Kommandos ausführen: 
```bash
bash Tikz/sh/tikz_externalize.sh
```

Dadurch werden alle TikZ-Bilder in `./Tikz/src/*.tex` zu gleichnamigen PDF's kompiliert nach `./Tikz/pdf/*.pdf` und zu PNG- und SVG-Dateien exportiert nach `./Tikz/png/*.png` und `./Tikz/svg/*.svg`.

**Anmerkungen, Credits, Optionales:**

Das bash script `tikz_externalize.sh` kompiliert die TikZ Bilder **parallel** als $\LaTeX$ Dokumente mit documentclass `standalone`. Das script nutzt die Datei `tikz_standalone.tex` als Vorlage und fügt den jeweiligen TikZ Code als Inhalt hinzu. Unveränderte Bilder werden nicht erneut kompiliert (Check der md5 hashes).

Das script ist namentlich angelehnt an das $\LaTeX$ package `tikzexternalize`. Dieses package ermöglicht es beim kompilieren von $\LaTeX$ Dokumenten alle TikZ Bilder innerhalb des Dokumentes zusätzlich als seperate PDF's zu speichern. Bei unveränderten TikZ-Bildern werden deren bereits kompilierte PDF's eingebunden, statt die jeweiligen Grafiken neu zu berechnen. Dadurch ist der Rechenaufwand initial größer und später geringer. In Modul 8 gab es Probleme beim Verwenden des Packages, zudem war die initiale Kompilierungszeit deutlich länger. 

Via `Tikz/sh/tikz_set_format.sh` lässt sich einstellen, ob die LaTeX Dokumente im Parent Directory TikZ Bilder als sourcecode einbinden sollen (z.B. `\input{Tikz/src/bild01.tex}`) oder in prekompilierter Form (z.B. `\includegraphics{Tikz/png/bild01.png}`). Nähere Infos im Sourcecode des Scripts.

## TikZ Standalone

Um alle TikZ Source Files in `./Tikz/src/` auf einmal zu **einer PDF** zu kompilieren, 
kann das $\LaTeX$ Dokument `tikz_standalone.tex` kompiliert werden. Die nötigen Settings und Dateipfade werden automatisch hinzugefügt.

**Hinweis:** 

`tikz_standalone.tex` bietet sich auch als Minimal-Umgebung zum Erstellen einzelner Tikz-Bildern an. 

***Achtung:*** 

Wenn nicht(!) `latexmk` als Compiler verwendet wird (default in VSCode), muss zuerst `.latexmkrc` ausgeführt werden:
```bash
perl .latexmkrc
```
Falls das auch nicht geht, manuell `bash ._tikz_scan.sh` und `bash ._tikz_standalone_settings.sh` ausführen.


# Betriebssystem

Für die Verwendung der Skripte mit `.sh`-Dateiendung ist eine `bash`-Shell nötig [Vgl. [Datei Baum](#datei-baum)].

`bash` unter:

- **Linux** i.d.R. nativ vorhanden
- **Windows** z.B. mit:
	+ *Windows Subsystem Linux* (WSL) ab Windows 10 oder neuer
	+ *Docker* mit GETitDigital [.devcontainer](#link) (empfohlen)
	+ *Cygwin* eventuell (nicht getested, nicht empfohlen)
	+ nicht gelisteten Optionen (nicht empfohlen)
- **MacOS** z.B. mit:
	+ *Docker* mit GETitDigital [.devcontainer](#link) (empfohlen)
	+ nicht gelisteten Optionen (nicht empfohlen)

Falls nicht der projekteigene '.devcontainer' genutzt wird, ist 
hier eine unvollständige Liste zur Umsetzung 
nativ in Linux oder in *WSL*, *Docker* und *Cygwin*:

- `texlive` oder andere $\LaTeX$-Distribution mit nötigen Paketen vorhanden
- `apt` Paketmanager vorhanden