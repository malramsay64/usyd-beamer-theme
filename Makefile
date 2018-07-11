makedir = output

examples = $(wildcard examples/*.tex)

all: $(examples:.tex=.pdf)

tex_flags = 

DOCKER_CMD = docker run -ti -v packages:/miktex/.miktex -v $(CURDIR):/miktex/work miktex/miktex

%.pdf: %.tex | packages
ifndef TRAVIS
	latexmk ${tex_flags} -outdir=${makedir} -pdf $<
else
	${DOCKER_CMD} latexmk ${tex_flags} -outdir=${makedir} -pdf $<
endif
	cp ${makedir}/$(notdir $@) .

packages:
	mkdir -p $@

clean:
	rm -rf ${makedir}/*
	rm -f $(examples:.tex=.pdf)

