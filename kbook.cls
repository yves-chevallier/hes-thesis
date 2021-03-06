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
\usepackage[T1]{fontenc} 					% Table d'encodage de caract�res
\usepackage[french]{babel} 				% Conventions francaises
\usepackage[nofancy]{svninfo} 			% Modifie \today selon la release Subversion
\usepackage{verbatim} 						% Permet d'�crire du texte brute
\usepackage{graphicx}						% Permet l'insertion d'illustrations .eps
\usepackage{makeidx} 						% Constitution d'un index
\usepackage{fancyhdr}						% En-t�te et pied de pages
\usepackage{lastpage} 						% Permet de conna�tre le num�ro de la derni�re page
\usepackage{fix-cm}                    % ??
\usepackage{titletoc}                  % Modification de la table des mati�res
\usepackage{helvet}                    % Fonte Helvetica
\usepackage{courier}                   % Fonte Courier
\usepackage{framed}                    % permet le \begin{leftbar}
\usepackage{tipa}                      % phon�tique internationale
\usepackage{dirtree}                   % Arborescence de repertoires (J.C.Charpentier)
\usepackage{listings}
\usepackage{float}
\usepackage{tabularx}
\usepackage{color}
\usepackage{multicol}                  % Disposition de texte sur plusieurs colonnes
\usepackage[ps2pdf,pagebackref=true,colorlinks=false,linkcolor=blue,plainpages=true]{hyperref}

%///////////////////////////////////////////////////////////////////////////////
% Mise � jour des longueurs                                                     
%                                                                               
%   +-----------------------------14------------------/-------------------+     
%   |                                                 1                   |     
%   |           /                                     /                   |     
%   |           2                                                         |     
%   |    +--/---/--------------------------------------------+            |     
%   |    |  3                 En-t�te                        |            |     
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
\usepackage[dvips,
            b5paper,
            marginratio=1:2,
            top=1cm,
            left=2cm,
            headheight=6mm,
            headsep=5mm,
            marginparwidth=2cm,
            marginparsep=4mm,
            heightrounded,
%           includemp,
            includehead]{geometry}
				
%\setlength\voffset{-1in}	% (1) + 1 in.
%\setlength\topmargin{1cm}	% (2)
%\setlength\headheight{6mm}	% (3)
%\setlength\headsep{5mm}	% (4)
%\setlength\topskip{0mm}	% (5)
%\setlength\textheight{18.5cm}	% (6)
%\setlength\textwidth{12.5cm}	% (7)
%\setlength\footskip{2.5cm}	% (8)
%\setlength\oddsidemargin{0cm}	% (9) pair
%\setlength\evensidemargin{0cm}	% (9) impair
%\setlength\hoffset{-0.5cm}	% (10)
%\setlength\marginparsep{4mm}	% (11)
%\setlength\marginparwidth{2cm}	% (12)
%\setlength\paperheight{240mm}	% (14)
%\setlength\paperwidth{175mm}	% (15)

\setlength\parindent{0pt}	% (13) <- reste celle-l�  
\setlength\parskip{\medskipamount} % <- et celle-l�  
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
                                   {-2.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.0ex \@plus.2ex}%
                                   {\normalfont\Large\bfseries\itshape}}
\renewcommand\subsection{\@startsection{subsection}{6}{\z@}%
                                     {-1.5ex\@plus -1ex \@minus -.2ex}%
                                     {1.0ex \@plus .2ex}%
                                     {\normalfont\large\bfseries\itshape}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-2.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.0ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries\itshape}}

\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
					{1.25ex \@plus1ex \@minus.2ex}%
					{1.0ex}%
					{\normalfont\normalsize\itshape}}
%\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
%                                    {3.25ex \@plus1ex \@minus.2ex}%
%                                    {2.5ex \@plus .2ex}%
%                                    {\normalfont\normalsize\bfseries\itshape}}
%\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
%                                       {3.25ex \@plus1ex \@minus .2ex}%
%                                       {1.5ex \@plus .2ex}%
%                                      {\normalfont\normalsize\bfseries\itshape}}
												  
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
		 {\usefont{T1}{cmr}{bx}{n}\fontsize{32pt}{32pt}\selectfont\@title}
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
		 {\usefont{T1}{cmr}{bx}{n}\fontsize{32pt}{32pt}\selectfont\@title}	 
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
%Couverture \emph{con�ue par} \textsc{\kcouverture}
%\vfil 
\begin{tabbing}
\emph{Imprimerie}:~~\= \kimprimerie\\
\emph{Relecture}:\> \textsc{\krelecture}
\end{tabbing}
\vfil
\small
Les programmes figurant dans ce document ont pour but d'illustrer les sujets trait�s. Il n'est donn� aucune garantie quant � leur fonctionnement une fois compil�s, assembl�s ou interpr�t�s dans le cadre d'une utilisation professionnelle ou commerciale.
\vfil
\begin{tabularx}{\textwidth}{Xr}
\includegraphics[height=1.5cm]{figures/heig-vd.eps} &
\includegraphics[height=1.5cm]{figures/hes-so.eps} \\
\end{tabularx}
\vfil
%\footnotesize
%Ce document est libre, vous pouvez le redistribuer et/ou le modifier selon les termes de la Licence Publique G�n�rale GNU publi�e par la Free Software Foundation. 

%Toute repr�sentation ou reproduction, int�grale ou partielle, fait sans le consentement de l'auteur, de ses ayants droit, ou ayants cause, est illicite (loi du 11 mars 1957, alin�a 1er de l'article 40). Cette repr�sentation ou reproduction, par quelque proc�d� que ce soit, constituerai une contrefa�on sanctionn�e par les articles 425 et suivants du Code p�nal. La loi du 11 mars 1967 autorise uniquement, aux termes des alin�as 2 et 3 de l'article 41, les copies ou reproductions strictemnt r�serv�es � l'usage priv� du copiste et non destin�es � une utilisation collective d'une part et, d'autre part, les analyses et les courtes citations dans un but d'exemple et d'illustration. 
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

\newcommand{\figi}[4]{
   \begin{figure}[!h]
   \begin{center}
   \includegraphics[width=#4]{figures/#1.\graphicsExt}
   \end{center}
   \caption{\label{#2}#3}
   \end{figure}   
} 

\newcommand{\maraja}[1]{\mbox{}\marginpar{\raggedright\tiny#1}}

\definecolor{shadecolor}{gray}{0.85}
\lstset{
	basicstyle=\sffamily\scriptsize, 
	breaklines=true, 
	tabsize=3, 
	backgroundcolor=\color{shadecolor}
}

\newcommand{\fig}[2]{
   \begin{figure}[!h]
   \begin{center}
   \includegraphics[width=\textwidth]{figures/#1.\graphicsExt}
   \end{center}
   \caption{\label{#1}#2}
   \end{figure}   
}
\newcommand{\figh}[2]{
   \begin{figure}[H]
   \begin{center}
   \includegraphics[width=\textwidth]{figures/#1.\graphicsExt}
   \end{center}
   \caption{\label{#1}#2}
   \end{figure}   
}        


\AtBeginDocument{\renewcommand{\labelitemi}{\textbullet}}


% vim: ft=tex: 
