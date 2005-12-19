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
%// @title    M�moire de dipl�me: Classe de m�moire                             
%// @context  Travail de dipl�me                                                
%// @author   Y. Chevallier <nowox@kalios.ch>                                   
%// @file     kbook.cls                                                         
%// @language ASCII/C                                                           
%// @svn      $Id: kbook.cls 82 2005-12-14 05:41:51Z Canard $                   
%///////////////////////////////////////////////////////////////////////////////
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{rapport}[2004/11/10 Extension pour RAPPORT EIVD]   

%///////////////////////////////////////////////////////////////////////////////
% Chargement de la classe du document                                           
%///////////////////////////////////////////////////////////////////////////////
\LoadClass[12pt,a4paper, twoside,final]{book}

% Packages utiles
\usepackage[latin1]{inputenc}     		% Format d'encodage
\usepackage[T1]{fontenc} 					% Table d'encodage de caract�res
\usepackage[french]{babel} 				% Conventions francaises
\usepackage[nofancy]{svninfo} 			% Modifie \today selon la release Subversion
\usepackage{verbatim} 						% Permet d'�crire du texte brute
\usepackage{graphicx}						% Permet l'insertion d'illustrations .eps
\usepackage{makeidx} 						% Constitution d'un index
\usepackage{fancyhdr}						% En-t�te et pied de pages
\usepackage{lastpage} 						% Permet de conna�tre le num�ro de la derni�re page
\usepackage{fix-cm} 
\usepackage{titletoc}
\usepackage{utopia}
\usepackage{helvet}

\usepackage[ps2pdf,pagebackref=true,colorlinks=false,linkcolor=blue,plainpages=true]{hyperref}
\usepackage[leftbars]{changebar}
\usepackage{framed}
%\usepackage{palatino} 						% Groupes de fontes Palatino

%///////////////////////////////////////////////////////////////////////////////
% Mise � jour des longueurs                                                     
%///////////////////////////////////////////////////////////////////////////////
\setlength\parindent				{0pt}
\setlength\parskip            {\bigskipamount}
%\setlength\hoffset				{-18pt}  	
%\setlength\oddsidemargin		{0cm} 	% Marge gauche sur pages impaires
%\setlength\evensidemargin		{0cm} 	% Marge gauche sur pages paires
%\setlength\marginparwidth		{3cm} 	% Largeur de note dans la marge
%\setlength\textwidth				{13cm}	% Largeur de la zone de texte
%\setlength\voffset				{-18pt}	% Bon pour DOS
%\setlength\marginparsep			{7pt} 	% S�paration de la marge
%\setlength\topmargin				{0pt} 	% Pas de marge en haut
%\setlength\headheight			{13pt} 	% Haut de page
%\setlength\headsep				{10pt} 	% Entre le haut de page et le texte
%\setlength\footskip				{27pt} 	% Bas de page + s�paration
%\setlength\textheight			{708pt}  % Hauteur de la zone de texte (25cm)
 
\def\graphicsExt	            {eps}

%///////////////////////////////////////////////////////////////////////////////
% En-t�te et pied de pages                                                      
%///////////////////////////////////////////////////////////////////////////////
	
	% Tables des mati�res, liste des figures...
	\fancypagestyle{empty}{
	\fancyhf{}
   \renewcommand{\headrulewidth}{0pt}  	
   \renewcommand{\footrulewidth}{0pt}} 

	\fancypagestyle{heading}{
	\fancyhf{}
   \renewcommand{\headrulewidth}{0pt}  	
   \renewcommand{\footrulewidth}{0pt}} 
	
	% Premi�re page de chapitre
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
% D�finition de la page de titre                                                
%///////////////////////////////////////////////////////////////////////////////
\title{\kTitle}
\author{\kAuthors}
\date{\today}

%///////////////////////////////////////////////////////////////////////////////
% Demande l'indexisation                                                        
%///////////////////////////////////////////////////////////////////////////////
\makeindex

%///////////////////////////////////////////////////////////////////////////////
% Red�finition des entr�es de table de mati�re                                  
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
% Red�finition de cleardoublepage                                               
%///////////////////////////////////////////////////////////////////////////////
\renewcommand\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}  

%///////////////////////////////////////////////////////////////////////////////
% Red�finition des chapitres                                                    
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
% Red�finition des sections et sous sections                                    
%///////////////////////////////////////////////////////////////////////////////
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\Large\bfseries\itshape}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\bfseries\itshape}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
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
% Red�finition de Tables des mati�res & Liste des figures ...                   
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
Couverture \emph{con�ue par} \textsc{\kcouverture}
\vfil 
\begin{tabbing}
\emph{Imprimerie}:~~\= \kimprimerie\\
\emph{Relecture}:\> \textsc{\krelecture}
\end{tabbing}
\vfil
Les programmes figurant dans ce document ont pour but d'illustrer les sujets trait�s. Il n'est donn� aucune garantie quant � leur fonctionnement une fois compil�s, assembl�s ou interpr�t�s dans le cadre d'une utilisation professionnelle ou commerciale.
\vfil
\small
Toute repr�sentation ou reproduction, int�grale ou partielle, fait sans le consentement de l'auteur, de ses ayants droit, ou ayants cause, est illicite (loi du 11 mars 1957, alin�a 1er de l'article 40). Cette repr�sentation ou reproduction, par quelque proc�d� que ce soit, constituerai une contrefa�on sanctionn�e par les articles 425 et suivants du Code p�nal. La loi du 11 mars 1967 autorise uniquement, aux termes des alin�as 2 et 3 de l'article 41, les copies ou reproductions strictemnt r�serv�es � l'usage priv� du copiste et non destin�es � une utilisation collective d'une part et, d'autre part, les analyses et les courtes citations dans un but d'exemple et d'illustration. 
\normalfont
}   

%///////////////////////////////////////////////////////////////////////////////
% Table des mati�res                                                            
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