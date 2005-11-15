\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{rapport}[2004/11/10 Extension pour RAPPORT EIVD]   

% Chargement de la classe du document
\LoadClass[11pt,a4paper, twoside, final]{book}

% Packages utiles
\usepackage[latin1]{inputenc}     		% Format d'encodage
\usepackage[T1]{fontenc} 					% Table d'encodage de caractères
\usepackage[french]{babel} 				% Conventions francaises
\usepackage[nofancy]{svninfo} 			% Modifie \today selon la release Subversion
\usepackage{verbatim} 						% Permet d'écrire du texte brute
\usepackage{graphicx}						% Permet l'insertion d'illustrations .eps
\usepackage{makeidx} 						% Constitution d'un index
\usepackage{fancyhdr}						% En-tête et pied de pages
\usepackage{lastpage} 						% Permet de connaître le numéro de la dernière page
\usepackage{fix-cm} 
\usepackage{palatino} 						% Groupes de fontes Palatino
\usepackage{titletoc}

% Mise à jour des longueurs
\setlength\parindent				{0pt}
\setlength\hoffset				{-18pt}  	
\setlength\oddsidemargin		{0pt} 	% Marge gauche sur pages impaires
\setlength\evensidemargin		{9pt} 	% Marge gauche sur pages paires
\setlength\marginparwidth		{54pt} 	% Largeur de note dans la marge
\setlength\textwidth				{481pt}	% Largeur de la zone de texte (17cm)
\setlength\voffset				{-18pt}	% Bon pour DOS
\setlength\marginparsep			{7pt} 	% Séparation de la marge
\setlength\topmargin				{0pt} 	% Pas de marge en haut
\setlength\headheight			{13pt} 	% Haut de page
\setlength\headsep				{10pt} 	% Entre le haut de page et le texte
\setlength\footskip				{27pt} 	% Bas de page + séparation
\setlength\textheight			{708pt}  % Hauteur de la zone de texte (25cm)
 
\def\graphicsExt	            {eps}
% En-tête et pied de pages
	
	% Tables des matières, liste des figures...
	\fancypagestyle{empty}{
	\fancyhf{}
   \renewcommand{\headrulewidth}{0pt}  	
   \renewcommand{\footrulewidth}{0pt}} 

	\fancypagestyle{heading}{
	\fancyhf{}
   \renewcommand{\headrulewidth}{0pt}  	
   \renewcommand{\footrulewidth}{0pt}} 
	
	% Première page de chapitre
   \fancypagestyle{plain}{
   \fancyhead{}
   \fancyfoot{}	
   \renewcommand{\headrulewidth}{0.4pt}  	
   \renewcommand{\footrulewidth}{0pt}}
	

	% Corps du document
	\pagestyle{fancy}
	\fancyhf{}
	\fancyhead[LE,RO]{\textbf{\thepage}}
	\fancyhead[LO]{\textsl{\rightmark}}
	\fancyhead[RE]{\textsl{\leftmark}}
	\fancyfoot{}	
	\renewcommand{\headrulewidth}{0.4pt}  	
	\renewcommand{\footrulewidth}{0pt} 
	
% Définition de la page de titre
\title{\kTitle}
\author{\kAuthors}
\date{\today}

% Demande l'indexisation
\makeindex

% Redéfinition des entrées de table de matière
\renewcommand{\@dotsep}{2}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
		\large\emph{#1}\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

% Redéfinition de cleardoublepage
\renewcommand\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}  

% Redéfinition des chapitres
\renewcommand{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}												  
						  
\renewcommand{\@makechapterhead}[1]{%
  \vspace*{2\p@}%
  {\parindent \z@ \raggedleft \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
		\fontsize{72pt}{12pt}\selectfont{\textbf\thechapter}
        \par\nobreak
        \vskip 20\p@
      \fi
    \fi
    \interlinepenalty\@M
	 \Huge\bfseries\emph{#1}\par\nobreak
    \vskip 40\p@
  }}


% Redéfinition de Tables des matières & Liste des figures ...
\renewcommand{\@makeschapterhead}[1]{%
  \thispagestyle{empty}
  \vspace*{150\p@}%
  {\parindent \z@ 
    \normalfont
    \interlinepenalty\@M
	 \begin{center}
	 \Huge\emph{#1}\par\nobreak
	 \end{center}
    \vskip 40\p@
  }}   

% Titre du document
\renewcommand{\maketitle}{
	\begin{titlepage}%	
	 \let\footnotesize\small
	 \let\footnoterule\relax
	 \parindent \z@
	 \reset@font
	 \null\vfil
	 \begin{center}
		 \Huge\textbf{\fontsize{40pt}{10pt}\selectfont\@title}
	 \end{center}
	 \vfil~\null
	\end{titlepage}%

	\begin{titlepage}%
	 \let\footnotesize\small
	 \let\footnoterule\relax
	 \parindent \z@
	 \reset@font
	 \begin{center}	 
	 \null	 
	 \Huge{\textsc{\@author}}
	 \vfil
	 \Huge{\textbf{\fontsize{40pt}{10pt}\selectfont\@title}}
	 \vfil
	 \huge{\emph{\ksubTitle}}
	 \vfil
	 \large{\keditorAddress}\\
	 \large{\emph{\keditorUrl}}
	 \end{center}  	 
	\end{titlepage}%  
  \setcounter{footnote}{0}% 
}

% Page liminaire
\newcommand\firstPage{
\thispagestyle{empty}
\normalfont
\kliminairetext\\[1cm]
\copyright \kAuthors, \kcopyrightYear
\vfil 
Couverture \emph{conçue par} \textsc{\kcouverture}
\vfil 
\begin{tabbing}
\emph{Imprimerie}:~~\= \kimprimerie\\
\emph{Relecture}:\> \textsc{\krelecture}
\end{tabbing}
\vfil
Les programmes figurant dans ce document ont pour but d'illustrer les sujets traités. Il n'est donné aucune garantie quant à leur fonctionnement une fois compilés, assemblés ou interprêtés dans le cadre d'une utilisation professionnelle ou commerciale.
\vfil
\small
Toute représentation ou reproduction, intégrale ou partielle, fait sans le consentement de l'auteur, de ses ayants droit, ou ayants cause, est illicite (loi du 11 mars 1957, alinéa 1er de l'article 40). Cette représentation ou reproduction, par quelque procédé que ce soit, constituerai une contrefaçon sanctionnée par les articles 425 et suivants du Code pénal. La loi du 11 mars 1967 autorise uniquement, aux termes des alinéas 2 et 3 de l'article 41, les copies ou reproductions strictemnt réservées à l'usage privé du copiste et non destinées à une utilisation collective d'une part et, d'autre part, les analyses et les courtes citations dans un but d'exemple et d'illustration. 
\normalfont
}   

% Table des matières
  \newcommand*{\chapp}{\chaptername}
  \newcommand*{\switchapp}%
    {\renewcommand*{\chapp}{\appendixname}}

  \titlecontents{chapter}[0pt]{}%
    {\chapp{} \thecontentslabel{} \textemdash{} }{}{}       


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Importation d'une figure                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\fig}[2]{
   \begin{figure}[!h]
   \begin{center}
   \includegraphics[width=\textwidth]{figures/#1.\graphicsExt}
   \end{center}
   \caption{\label{#1}#2}
   \end{figure}   
}
\newcommand{\figi}[4]{
   \begin{figure}[!h]
   \begin{center}
   \includegraphics[width=#4]{figures/#1.\graphicsExt}
   \end{center}
   \caption{\label{#2}#3}
   \end{figure}   
} 	 
