makedir = output

examples = $(wildcard examples/*.tex)

all: $(examples:.tex=.pdf)

%.pdf: %.tex
	latexmk -outdir=${makedir} -pdf $<
	cp ${makedir}/$(notdir $@) .

clean:
	rm -rf ${makedir}/*
	rm -f $(examples:.tex=.pdf)

