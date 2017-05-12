all: clean
	pdflatex index
	pdflatex index

clean:
	rm -f *.aux *.log *.glo *.toc *.dvi index.pdf *.out
	rm -f */*.aux */*.log */*.glo */*.out
	rm -rf */auto chapter_*/chapter_*.pdf
