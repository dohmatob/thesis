all: clean common tables dot tikz svg slides
	pdflatex index
	bibtex abstract.aux
	bibtex chapter_1/chapter_1.aux
	bibtex chapter_2/chapter_2.aux
	bibtex chapter_3/chapter_3.aux
	bibtex chapter_4/chapter_4.aux
	bibtex chapter_5/chapter_5.aux
	bibtex chapter_6/chapter_6.aux
	bibtex chapter_7/chapter_7.aux
	bibtex chapter_8/chapter_8.aux
	bibtex chapter_9/chapter_9.aux
	bibtex chapter_10/chapter_10.aux
	bibtex chapter_11/chapter_11.aux
	pdflatex index
	pdflatex index
	pdftk modele_de_couverture_de_these_07_2017_1_0.pdf index.pdf cat output toto.pdf
	mv toto.pdf index.pdf

tikz:
	pdflatex chapter_1/tikz1.tex
	pdflatex chapter_1/tikz2.tex

svg:
	inkscape -D -z --file=figures/dlsvg.svg --export-pdf=figures/dlsvg.pdf --export-latex
	inkscape -D -z --file=figures/neuron.svg --export-pdf=figures/neuron.pdf --export-latex

dot:
	dot figures/flowchart.dot -Tpdf > figures/flowchart.pdf
	dot figures/gen_model.dot -Tpdf > figures/gen_model.pdf
	dot figures/rfmri2tfmri.dot -Tpdf > figures/rfmri2tfmri.pdf

tables:
	pdflatex figures/cv_grid.tex
	mv cv_grid.pdf figures

clean:
	rm -f *.aux *.log *.glo *.toc *.dvi *.out
	rm -f */*.aux */*.log */*.glo */*.out
	rm -rf */auto chapter_*/chapter_*.pdf

common:
	pdflatex acti
	pdflatex dico
	pdflatex codes


slides: clean common
	pdflatex slides
	bibtex slides
	pdflatex slides
	pdflatex slides


parietal: clean common
	pdflatex codes
	pdflatex dico
	pdflatex acti
	pdflatex parietal
	pdflatex parietal
	bibtex parietal
	pdflatex parietal
