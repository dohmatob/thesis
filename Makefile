all: clean dot tikz svg
	pdflatex index
	bibtex abstract.aux
	bibtex chapter_1/chapter_1.aux
	bibtex chapter_2/chapter_2.aux
	bibtex chapter_3/chapter_3.aux
	bibtex chapter_4/chapter_4.aux
	bibtex chapter_5/chapter_5.aux
	bibtex chapter_7/chapter_7.aux
	bibtex chapter_8/chapter_8.aux
	bibtex chapter_9/chapter_9.aux
	pdflatex index
	pdflatex index

tikz:
	pdflatex chapter_1/tikz1.tex
	pdflatex chapter_1/tikz2.tex

svg:
	inkscape -D -z --file=figures/dlsvg.svg --export-pdf=figures/dlsvg.pdf --export-latex
	inkscape -D -z --file=figures/neuron.svg --export-pdf=figures/neuron.pdf --export-latex


dot:
	dot flowchart.dot -Tpdf > flowchart.pdf

clean:
	rm -f *.aux *.log *.glo *.toc *.dvi index.pdf *.out
	rm -f */*.aux */*.log */*.glo */*.out
	rm -rf */auto chapter_*/chapter_*.pdf
