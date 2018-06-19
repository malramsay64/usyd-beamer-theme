makedir = output
gen_files = example.pdf example-logobar.pdf

all: $(gen_files)

$(gen_files): %.pdf: %.tex
	latexmk -outdir=${makedir} -pdf $< && mv ${makedir}/$@ .

example-logobar.tex: example.tex
	sed 's/\usetheme{usyd}/\usetheme[logobar]{usyd}/' $< > $@

clean:
	rm -rf ${makedir}/*
	rm -f $(gen_files)
	rm -f example-logobar.tex

