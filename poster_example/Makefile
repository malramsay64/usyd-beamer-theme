infile=poster.tex
makedir=output

all:
	latexmk -outdir=${makedir} -pdf ${infile} && mv ${makedir}/${infile:.tex=.pdf} .

clean:
	rm -rf ${makedir}/*
	rm ${infile:.tex=.pdf}

