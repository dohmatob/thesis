all: clean
	pdflatex index
	# bibtex index
	bibtex chapter_3/chapter_3.aux
	bibtex chapter_4/chapter_4.aux
	pdflatex index
	pdflatex index

clean:
	rm -f *.aux *.log *.glo *.toc *.dvi index.pdf *.out
	rm -f */*.aux */*.log */*.glo */*.out
	rm -rf */auto chapter_*/chapter_*.pdf
