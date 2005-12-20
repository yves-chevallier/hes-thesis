#--------------------------------------------------+---------------------------#
#   _   _        _                            _    |      (Prof: B.Schneider)  #
#  | | | |      |_|                          | |   |                           #
#  | |_| |_____  _ _____           _     _ __| |   |                           #
#  | |_  | ___ || |  _  \  _____  \ \  / // _  |   | Author:   Y.Chevallier    #
#  | | | | ____|| | |_| | (_____)  \ \/ /( (_| |   | FileName: Makefile        #
#  |_| |_|_____)|_|___  |           \__/  \____|   | FileType: MAKEFILE        #
#                   __| | Haute Ecole d'Ingenieurs | Created:  200511282209    #
#                  |___/  et de Gestion - Vaud     |                           #
#------------------------------------------------------------------------------#
#  Title:   MAKEFILE                                                           #
#  Context: Travail de diplôme                                                 #
#  SVN:     http://193.134.216.186/svn/heig/  (anonymous)                      #
#           $Id: Makefile 21 2005-11-18 02:44:58Z Canard $                     #
#------------------------------------------------------------------------------#
LATEX = latex 
HTML = latex2html
PS = dvips 
PDF = gswin32c -sOutputFile=$(SRC).pdf
#PDF = ps2pdf
BIBTEX = bibtex
PS_OPTIONS = 
PDF_OPTIONS = -dBATCH -g2480x3508 -r300 -sNOPAUSE -sDEVICE=pdfwrite
LATEX_OPTIONS = --src-specials
PSFLAGS = 
SRC = memoire

#------------------------------------------------------------------------------#
DEFAULT: all

all: mrproper $(SRC).pdf

#------------------------------------------------------------------------------#
dvi: $(SRC).tex 
ps: $(SRC).ps
pdf: $(SRC).pdf 
html: 
	$(HTML) $<
	
#------------------------------------------------------------------------------#
$(SRC).pdf: $(SRC).ps
	$(PDF) $(PDF_OPTIONS) $<
	$(MAKE) -k clean

#------------------------------------------------------------------------------#
$(SRC).ps: $(SRC).dvi
	$(PS) $(PS_OPTIONS) $<
		
#------------------------------------------------------------------------------#		
$(SRC).dvi: $(SRC).tex
	@echo
	@echo \*
	@echo \* Compiling $(TARGET) - compilation log in $(LOG)...
	@echo \*
	$(LATEX) $<
	@while ( grep "Rerun to get cross-references" $(SRC).log); do \
			echo '** Re-running LaTeX **'; \
			$(LATEX) $<; \
	done

#------------------------------------------------------------------------------#
.PHONY: clean

mrproper: clean
	@rm -f $(SRC).dvi $(SRC).ps $(SRC).pdf 	

clean:
	@rm -f *.log *.ps *.idx *.toc *.aux *.blg 
