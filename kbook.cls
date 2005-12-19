%///////////////////////////////////////////////////////////////////////////////
%//  _   _        _                            _                                
%// | | | |      |_|                          | |                               
%// | |_| |_____  _ _____           _     _ __| |                               
%// | |_  | ___ || |  _  \  _____  \ \  / // _  |                               
%// | | | | ____|| | |_| | (_____)  \ \/ /( (_| |                               
%// |_| |_|_____)|_|___  |           \__/  \____|                               
%//                  __| | Haute Ecole d'Ingenieurs                             
%//                 |___/  et de Gestion - Vaud                                 
%//                                                                             
%// @title    Mémoire de diplôme: Classe de mémoire                             
%// @context  Travail de diplôme                                                
%// @author   Y. Chevallier <nowox@kalios.ch>                                   
%// @file     kbook.cls                                                         
%// @language ASCII/C                                                           
%// @svn      $Id$                   
%///////////////////////////////////////////////////////////////////////////////
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{rapport}[2004/11/10 Extension pour RAPPORT EIVD]   

%///////////////////////////////////////////////////////////////////////////////
% Chargement de la classe du document                                           
%///////////////////////////////////////////////////////////////////////////////
\LoadClass[11pt, b5paper,twoside,final]{book}

%///////////////////////////////////////////////////////////////////////////////
% Packages                                                                      
%///////////////////////////////////////////////////////////////////////////////
\usepackage[latin1]{inputenc}     		% Format d'encodage
\usepackage[T1]{fontenc} 					% Table d'encodage de caractères
\usepackage[french]{babel} 				% Conventions francaises
\usepackage[nofancy]{svninfo} 			% Modifie \today selon la release Subversion
\usepackage{verbatim} 						% Permet d'écrire du texte brute
\usepackage{graphicx}						% Permet l'insertion d'illustrations .eps
\usepackage{makeidx} 						% Constitution d'un index
\usepackage{fancyhdr}						% En-tête et pied de pages
\usepackage{lastpage} 						% Permet de connaître le numéro de la dernière page
\usepackage{fix-cm}                    % ??
\usepackage{titletoc}                  % Modification de la table des matières
\usepackage{utopia}                    % Fonte Utopia
\usepackage{helvet}                    % Fonte Helvetica
\usepackage{framed}                    % permet le \begin{leftbar}
\usepackage{tipa}                      % phonétique internationale
\usepackage{dirtree}                   % Arborescence de repertoires (J.C.Charpentier)
\usepackage{multicol}                  % Disposition de texte sur plusieurs colonnes
%\usepackage[leftbars]{changebar}       % ??
\usepackage[ps2pdf,pagebackref=true,colorlinks=false,linkcolor=blue,plainpages=true]{hyperref}
%\usepackage{palatino} 						% Groupes de fontes Palatino

%///////////////////////////////////////////////////////////////////////////////
% Mise à jour des longueurs                                                     
%                                                                               
%   +-----------------------------14------------------/-------------------+     
%   |                                                 1                   |     
%   |           /                                     /                   |     
%   |           2                                                         |     
%   |    +--/---/--------------------------------------------+            |     
%   |    |  3                 En-tête                        |            |     
%   |    +--/-----/------------------------------------------+            |     
%   |             4                                                       |     
%   |    +--/-----/------------------------------------------+  +-12+     |     
%   |    |  5                                                |  |   |     |     
%   |    |  / texte                                          |  |   |     |     
%   |    |                                                   |  |   |     |     
%   |    |                Corps du texte                     6  |   |    15     
%   |    |                                                   |  |   |     |     
%   |    /-13-/lorem ipsum.. .. .. ..                        |  |   |     |     
%   |    | dolor .. .. ..                                    /11/   |     |     
%   |    |                                                   |  |   |     |     
%   |    +--------/-----------------7------------------------+  +---+     |     
%   |             |                                                       |     
%   |    +--------8------------------------------------------+            |     
%   |  /9/        |        Pied de page                      |            |     
%   /10/ +--------/------------------------------------------+            |     
%   |                                                                     |     
%   +---------------------------------------------------------------------+     
%                                                                               
%///////////////////////////////////////////////////////////////////////////////
\setlength\voffset				{-1in}	% (1) + 1 in.
\setlength\topmargin				{1cm} 	% (2)
\setlength\headheight			{6mm} 	% (3)
\setlength\headsep				{5mm} 	% (4)
\setlength\topskip				{0mm} 	% (5)
\setlength\textheight			{18.5cm} % (6)
\setlength\textwidth				{12.5cm}	% (7)
\setlength\footskip				{2.5cm} 	% (8)
\setlength\oddsidemargin		{0cm} 	% (9) pair
\setlength\evensidemargin		{0cm} 	% (9) impair
\setlength\hoffset				{-0.5cm} % (10)
\setlength\marginparsep			{4mm} 	% (11)
\setlength\marginparwidth		{2cm} 	% (12)
\setlength\parindent				{0pt}    % (13)
\setlength\paperheight			{240mm}  % (14)
\setlength\paperwidth			{175mm}  % (15)
%\setlength\parskip            {\bigskipamount} % (Separation de paragraphe)
\def\graphicsExt	            {eps}

%///////////////////////////////////////////////////////////////////////////////
% En-tête et pied de pages                                                      
%///////////////////////////////////////////////////////////////////////////////
	
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
	
%///////////////////////////////////////////////////////////////////////////////
% Définition de la page de titre                                                
%///////////////////////////////////////////////////////////////////////////////
\title{\kTitle}
\author{\kAuthors}
\date{\today}

%///////////////////////////////////////////////////////////////////////////////
% Demande l'indexisation                                                        
%///////////////////////////////////////////////////////////////////////////////
\makeindex

%///////////////////////////////////////////////////////////////////////////////
% Redéfinition des entrées de table de matière                                  
%///////////////////////////////////////////////////////////////////////////////
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

%///////////////////////////////////////////////////////////////////////////////
% Redéfinition de cleardoublepage                                               
%///////////////////////////////////////////////////////////////////////////////
\renewcommand\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}  

%///////////////////////////////////////////////////////////////////////////////
% Redéfinition des chapitres                                                    
%///////////////////////////////////////////////////////////////////////////////
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
		{\itshape\Huge\textbf{#1}}\par\nobreak
    \vskip 40\p@
  }}

%///////////////////////////////////////////////////////////////////////////////
% Redéfinition des sections et sous sections                                    
%///////////////////////////////////////////////////////////////////////////////
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-2.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.0ex \@plus.2ex}%
                                   {\normalfont\Large\bfseries\itshape}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-1.5ex\@plus -1ex \@minus -.2ex}%
                                     {1.0ex \@plus .2ex}%
                                     {\normalfont\large\bfseries\itshape}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-2.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.0ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries\itshape}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {2.5ex \@plus .2ex}%
                                    {\normalfont\normalsize\bfseries\itshape}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {1.5ex \@plus .2ex}%
                                      {\normalfont\normalsize\bfseries\itshape}}
												  
%///////////////////////////////////////////////////////////////////////////////
% Redéfinition de Tables des matières & Liste des figures ...                   
%///////////////////////////////////////////////////////////////////////////////
\renewcommand{\@makeschapterhead}[1]{%
  \thispagestyle{empty}
  \vspace*{50\p@}%
  {\parindent \z@ 
    \normalfont
    \interlinepenalty\@M
	 \begin{center}
	 \Huge\textit{#1}\par\nobreak
	 \end{center}
    \vskip 40\p@
  }}   

%///////////////////////////////////////////////////////////////////////////////
% Titre du document                                                             
%///////////////////////////////////////////////////////////////////////////////
\renewcommand{\maketitle}{
	\begin{titlepage}%	
	 \let\footnotesize\small
	 \let\footnoterule\relax
	 \parindent \z@
	 \reset@font
	 \null\vfil
	 \begin{center}
		 {\fontsize{40pt}{30pt}\usefont{T1}{cmss}{bx}{n}\@title}
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
	 {\fontsize{40pt}{30pt}\usefont{T1}{cmss}{bx}{n}\@title}
	 \vfil
	 \huge{\emph{\ksubTitle}}
	 \vfil
	 \large{\keditorAddress}\\
	 \large{\emph{\keditorUrl}}
	 \end{center}  	 
	\end{titlepage}%  
  \setcounter{footnote}{0}% 
}

%///////////////////////////////////////////////////////////////////////////////
% Page liminaire                                                                
%///////////////////////////////////////////////////////////////////////////////
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

%///////////////////////////////////////////////////////////////////////////////
% Table des matières                                                            
%///////////////////////////////////////////////////////////////////////////////
  \newcommand*{\chapp}{\chaptername}
  \newcommand*{\switchapp}%
    {\renewcommand*{\chapp}{\appendixname}}

  \titlecontents{chapter}[0pt]{}%
    {\chapp{} \thecontentslabel{} \textemdash{} }{}{}       

%///////////////////////////////////////////////////////////////////////////////
%  Importation d'une figure                                                     
%///////////////////////////////////////////////////////////////////////////////
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

\newcommand{\maraja}[1]{\mbox{}\marginpar{\tiny#1}}
% vim: ft=tex: 
