# Presentation Text Creator

__Synopsis:__ 
	Create presentation text for Folien.pdf in order to auto-generate Videos with text-to-speech models.

__Method:__
	- prompt local multimodal AI model with single slides from Folien.pdf
	- store speech text in .txt-files named according to document structure and slide number

__Usage:__
```bash
python txtgen.py
```

__Output:__

- `../Kapitel{$N}_with_speech.tex` (modified version of `Kapitel{$N}.tex` ) 
	+ include `\speech{\input{...}}` commands for video creation (cf. `../Videos`)
	+ pattern: `"./txt/p${NPAGE}_sec${NSEC}-${NSSEC}-${NNNSEC}_slide{$NSLIDE}.txt"`
	+ e.g.: `\speech{input{p-001_sec-01-03-02_slide-05.txt}}` # 1. page, 1. section, 3. subsection, 2. subsubsection, 5. slide on that frame
- `/tmp/slides/<png-files>` with single slided .png files derived from Folien.pdf, naming pattern according to the above
	+ pattern: `"/tmp/slides/p${NPAGE}_sec${NSEC}-${NSSEC}-${NNNSEC}_slide{$NSLIDE}.png"`
	+ e.g.: `/tmp/slides/p-001_sec-01-03-02_slide-05.png` # 1. page, 1. section, 3. subsection, 2. subsubsection, 5. slide on that frame

Notes:
	

