makedir = output

examples = $(wildcard examples/*.tex)

all: $(examples:.tex=.pdf)

tex_flags = -silent -interaction=batchmode

%.pdf: %.tex | $(makedir)
ifndef TRAVIS
	latexmk ${tex_flags} -outdir=${makedir} -pdf $<
else
	tectonic -o $(makedir) --keep-intermediates -r0 $<
	if [ -f ${makedir}/$(notdir $(<:.tex=.bcf)) ]; then biber --input-directory ${makedir} $(notdir $(<:.tex=)); fi
	tectonic -o $(makedir) --keep-intermediates $<
endif
	cp ${makedir}/$(notdir $@) .

$(makedir):
	mkdir -p $@

clean:
	rm -rf ${makedir}/*
	rm -f $(examples:.tex=.pdf)
	rm -f $(notdir $(examples:.tex=.bbl))
	rm -f $(notdir $(examples:.tex=.blg))

