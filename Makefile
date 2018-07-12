makedir = output

examples = $(wildcard examples/*.tex)

all: $(examples:.tex=.pdf)

tex_flags = -silent -interaction=batchmode

%.pdf: %.tex
ifndef TRAVIS
	latexmk ${tex_flags} -outdir=${makedir} -pdf $<
else
	tectonic -o $(makedir) --keep-intermediates $<
ifeq (,$(wildcard ${makedir}/$(notdir $(<:.tex=.bcf))))
	biber $(makedir)/$(notdir $(<:.tex=))
endif
	tectonic -o $(makedir) --keep-intermediates $<
endif
	cp ${makedir}/$(notdir $@) .

clean:
	rm -rf ${makedir}/*
	rm -f $(examples:.tex=.pdf)

