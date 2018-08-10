all: delete presentation.pdf

delete:
	rm presentation.pdf || :

clean:
	rm -r *.bbl *.synctex.gz *.snm *.vrb *.nav *.bcf *.blg *.dvi *.fls *.log *.out *.toc *.fdb_latexmk *.aux || :
	rm -rf _minted-presentation

presentation.pdf: presentation.tex
	pdflatex -synctex=1 -interaction=nonstopmode -shell-escape "presentation.tex" || :
	pdflatex -synctex=1 -interaction=nonstopmode -shell-escape "presentation.tex" || :

view: presentation.pdf
	zathura presentation.pdf
