makedir = output

examples = $(wildcard examples/*.tex)

all: $(examples:.tex=.pdf)

tex_flags = -interaction=batchmode -silent

DOCKER_CMD = docker run -ti -v ${HOME}/.miktex:/miktex/.miktex -v $(CURDIR):/miktex/work miktex/miktex

%.pdf: %.tex
ifndef TRAVIS
	latexmk ${tex_flags} -outdir=${makedir} -pdf $<
else
	${DOCKER_CMD} latexmk ${tex_flags} -outdir=${makedir} -pdf $<
endif
	cp ${makedir}/$(notdir $@) .

clean:
	rm -rf ${makedir}/*
	rm -f $(examples:.tex=.pdf)

