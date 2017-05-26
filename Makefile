all: clean dot tikz
	pdflatex index
	bibtex chapter_1/chapter_1.aux
	bibtex chapter_3/chapter_3.aux
	bibtex chapter_4/chapter_4.aux
	pdflatex index
	pdflatex index

tikz:
	pdflatex chapter_1/tikz1.tex
	pdflatex chapter_1/tikz2.tex

dot:
	dot flowchart.dot -Tpdf > flowchart.pdf

clean:
	rm -f *.aux *.log *.glo *.toc *.dvi index.pdf *.out
	rm -f */*.aux */*.log */*.glo */*.out
	rm -rf */auto chapter_*/chapter_*.pdf
