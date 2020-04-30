paper = paper.tex
cfp = call-for-papers.tex
sources = $(paper) $(cfp)
llncs-class = llncs.cls

.PHONY: clean reformat split-sentences indent

paper: $(paper)
	latexmk $<

compile: $(sources)
	latexmk $(sources)

$(sources): $(llncs-class)
$(llncs-class): download

download:
ifeq (,$(wildcard ./$(llncs-class)))
	./download-llncs-files-from-springer.sh
endif

format:
	latexindent -l -s -sl -w $(sources)

indent:
	latexindent -y="indentPreamble:1,defaultIndent:'  '" -m -w $(sources)

split-sentences:
	latexindent -m -l -s -sl -w $(sources)

clean:
	latexmk -c
