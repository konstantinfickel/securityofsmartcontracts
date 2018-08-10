all: build

clean:
	rm -r *.bbl *.bcf *.blg *.dvi *.fls *.log *.out *.toc *.fdb_latexmk *.aux *.run.xml *.synctex.gz || :
	rm -rf _minted-SecurityOfSmartContracts

build: SecurityOfSmartContracts.tex
	pdflatex -synctex=1 -interaction=nonstopmode -shell-escape "SecurityOfSmartContracts.tex" || :
	biber SecurityOfSmartContracts
	pdflatex -synctex=1 -interaction=nonstopmode -shell-escape "SecurityOfSmartContracts.tex" || :
	pdflatex -synctex=1 -interaction=nonstopmode -shell-escape "SecurityOfSmartContracts.tex" || :

view: build
	zathura SecurityOfSmartContracts.pdf
