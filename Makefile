NAME=paper
SECTIONS=paper.tex
LATEX=pdflatex -interaction=nonstopmode

all:  $(NAME).pdf

dvi: $(NAME).tex #$(SECTIONS)
	$(LATEX) $(NAME) || true
	bibtex $(NAME)
	$(LATEX) $(NAME) || true 
	bibtex $(NAME)
	$(LATEX) $(NAME) || true 
	$(LATEX) $(NAME)

$(NAME).pdf: $(NAME).tex #$(SECTIONS)
	$(LATEX) $(NAME) || true
	bibtex $(NAME)
	$(LATEX) $(NAME) || true 
	bibtex $(NAME)
	$(LATEX) $(NAME) || true 
	$(LATEX) $(NAME) || true 
	rm -f $(NAME).blg $(NAME).log $(NAME).aux

clean:
	rm -f *~ *.aux *.dvi *.gz *.out *.toc *log *-temp.* *.blg *~ $(NAME).ps $(NAME).bbl $(NAME).pdf


