% basiert auf der Vorlage von O. Gerlach (2015), erweitert von C. Hinze (2020/2021)
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{isw_smb_diss/isw_smb_diss}[2021/12/01 v. 1.4 Stuttgarter-Maschinenbau-Reihe für Dissertationen: https://git.isw.uni-stuttgart.de/projekte/eigenentwicklungen/templates/isw_smb_diss]
\typeout{}
\typeout{Stuttgarter Maschinenbau Dissertation LaTeX template class }
\typeout{}
\typeout{Institute for Control Engineering of Machine Tools and Manufacturing}
\typeout{Units, ISW, Seidenstrasse 36, D-70174 Stuttgart, Germany.}
\typeout{}

\ProcessOptions\relax
\newcommand{\documentfontsize}{10pt}
\newcommand{\titlewidth}{1.0}
\newcommand{\introstart}{Der Fakult\"at}
\newcommand{\introstatus}{vorgelegte}
\newcommand{\documentsourceintro}{von}
\DeclareOption{accepted}{\renewcommand{\introstart}{Von der Fakult\"at}\renewcommand{\introstatus}{genehmigte}\renewcommand{\documentsourceintro}{Vorgelegt von}}
%\DeclareOption{smalltext}{\renewcommand{\documentfontsize}{12pt}\renewcommand{\titlewidth}{0.9}}
\ProcessOptions
\LoadClass[fontsize=\documentfontsize,
twoside,
a5paper,
headings=normal,
headsepline,
listof=totoc,% add a tocentry for lists like LOF and LOT
]{scrbook} % KOMA-Script scrreprt, DIN A5, 14pt with bibliography in TOC
\usepackage[a5paper]{geometry}
\geometry{tmargin=2.1cm,bmargin=2.1cm,lmargin=1.4cm,rmargin=1.4cm,headheight=0.7cm,headsep=0.7cm,footskip=0.7cm,head=32pt}

\RequirePackage{ifthen}
\RequirePackage{ifpdf}
\RequirePackage{ifxetex}
\RequirePackage{ifluatex}

\RequirePackage{babel}

\ifthenelse{\boolean{xetex}\OR\boolean{luatex}}{
	\relax
}{
	\PassOptionsToPackage{T1}{fontenc} % T2A for cyrillics
	\RequirePackage{fontenc}  

	\PassOptionsToPackage{utf8}{inputenc} % directly support utf8 characters, as ä,ö,ü,Ü,ß
	\RequirePackage{inputenc}  	 
}


\ifthenelse{\boolean{xetex}\OR\boolean{luatex}}
   { % use fontspec and OpenType fonts with utf8 engines
	\RequirePackage{fontspec}%
	\defaultfontfeatures{Ligatures=TeX}%
	\setsansfont{texgyreheros}[
	%Scale=MatchLowercase,% or MatchUppercase
	Extension=.otf,
	UprightFont=*-regular,
	ItalicFont=*-italic,
	BoldFont=*-bold,
	BoldItalicFont=*-bolditalic,
	]
	
	\setmainfont{texgyrepagella}[
	%Scale=MatchLowercase,% or MatchUppercase
	Extension=.otf,
	UprightFont=*-regular,
	ItalicFont=*-italic,
	BoldFont=*-bold,
	BoldItalicFont=*-bolditalic,
	%Numbers={Proportional,OldStyle}
	]
	
	\linespread{1.05} % for pagella
	%\RequirePackage{unicode-math}
	%\setmathfont{TeX Gyre Pagella Math}%
	%\setmainfont[SmallCapsFeatures={LetterSpace=6}, Numbers={Proportional,OldStyle}]{Minion Pro}
	%\setsansfont[LetterSpace=3, Numbers={Proportional,OldStyle}]{Myriad Pro}
	\setmonofont[Scale=0.85]{DejaVu Sans Mono} 
   }
   { % use Type 1 fonts with pdflatex
	\PassOptionsToPackage{osf,sc}{mathpazo}%
	\RequirePackage{mathpazo} % Palatino with real small caps and old style figures
	\usepackage{tgheros}
	\linespread{1.05} % a bit more for Palatino
	\PassOptionsToPackage{scaled=0.85}{DejaVuSansMono}%
	\RequirePackage{DejaVuSansMono}%
	\RequirePackage{tgpagella}% bera monospace font
	\RequirePackage{textcomp}% declare missing symbols

	\PassOptionsToPackage{activate={true,nocompatibility},final,tracking=true,kerning=true,spacing=true,factor=1100,stretch=10,shrink=10}{microtype}
   }


\RequirePackage{microtype}

\RequirePackage[onehalfspacing]{setspace} 
\RequirePackage[automark,%
headsepline=0.20pt,%
%headtopline=0.00pt,%
%footsepline=0.20pt,%
draft=false,]{scrlayer-scrpage}	 % header & footer layout
\pagestyle{scrheadings}
\RequirePackage[pdfusetitle]{hyperref}

% Bibliography
\RequirePackage{xpatch}

\RequirePackage[style=ieee, %style=alphabetic
giveninits=true,
uniquelist=false,
backend=biber,
natbib=true,
bibwarn=true,
isbn=false]{biblatex}

% Colors (for links, ...)
\RequirePackage[dvipsnames]{xcolor}
\definecolor{uniSblue}{RGB}{0,65,145}
\definecolor{uniSlightblue}{RGB}{0,190,255}
\definecolor{uniSgrey}{RGB}{62, 68, 76}
\definecolor{uniSyellow}{RGB}{255, 213, 0}
\definecolor{uniSred}{RGB}{230, 0, 50}
\definecolor{uniSgreen}{RGB}{0, 200, 50} 

\RequirePackage{graphicx}

\RequirePackage{titletoc}
\contentsmargin{2.5em}

% Verhindern von Schusterjungen und Hurenkindern über Penalty
% \widowpenalty=10000
% \clubpenalty=10000 
% \displaywidowpenalty=10000

% Floats auf extra Float-Page oben platzieren
\setlength{\@fptop}{0pt}% default is 0\p@ \@plus 1fil
\setlength{\@fpsep}{\floatsep}% default is 8\p@ \@plus 2fil
\setlength{\@fpbot}{0pt plus 1fil}% default is 0\p@ \@plus 1fil

\renewcommand*{\chapterpagestyle}{scrheadings}	% sepline and running title above chapters beginning from toc
\clearpairofpagestyles	% clear header and footer, IIRC
\ohead[\headmark]{\headmark}
\ofoot[\pagemark]{\pagemark}	% page numbers nearly everywhere (also below new chapters)

%Schriftfamilien für Überschriften auf Schriften mit Serifen!
% \addtokomafont{chapter}{\normalfont \bfseries}{\sffamily}
% \addtokomafont{chapterentry}{\normalfont \bfseries}{\sffamily}
% \addtokomafont{section}{\normalfont \bfseries}{\sffamily}
% \addtokomafont{subsection}{\normalfont \bfseries}{\sffamily}
% \addtokomafont{subsubsection}{\normalfont \bfseries}{\sffamily}
% \addtokomafont{title}{\normalfont \bfseries}{\sffamily}
% \addtokomafont{disposition}{\normalfont \bfseries}{\sffamily}
% \addtokomafont{labelinglabel}{\normalfont \bfseries}{\sffamily}
% \addtokomafont{descriptionlabel}{\normalfont \bfseries}{\sffamily}

% Titelei: Befehle (Hinweis: author & title sind schon definiert)
\newcommand*{\@birthplace}{\ClassError{isw_smb_diss}{\string\birthplace\space missing}%
	{You have to use \string\birthplace\space to set up the place of the author's birth.}}
\newcommand*\birthplace[1]{\renewcommand\@birthplace{#1}}

\newcommand*{\@examiner}{\ClassError{isw_smb_diss}{\string\examiner\space missing}%
	{You have to use \string\examiner\space to set up the your examiner,\MessageBreak e.g. `\string\examiner{Name of examiner}'.}}
\newcommand*\examiner[1]{\renewcommand\@examiner{#1}}

\newcommand*{\@coexaminer}{\ClassError{isw_smb_diss}{\string\coexaminer\space missing}%
	{You have to use \string\coexaminer\space to set up the your co-examiner,\MessageBreak e.g. `\string\coexaminer{Name of co-examiner}'.}}
\newcommand*\coexaminer[1]{\renewcommand\@coexaminer{#1}}

\newcommand*{\@institute}{\ClassError{isw_smb_diss}{\string\institute\space missing}%
	{You have to use \string\institute\space to set up the your Institute,\MessageBreak e.g. `\string\institute{Institut für Steuerungstechnik der Werkzeugmaschinen und Fertigungseinrichtungen}'.}}
\newcommand*\institute[1]{\renewcommand\@institute{#1}}

\newcommand*{\@dateoforalexamination}{\ClassError{isw_smb_diss}{\string\dateoforalexamination\space missing}%
	{You have to use \string\dateoforalexamination\space to set up the date of oral examination,\MessageBreak e.g. `\string\dateoforalexamination{TT.MM.YYYY}'.}}
\newcommand*\dateoforalexamination[1]{\renewcommand\@dateoforalexamination{#1}}

\newcommand*{\@yearofpublication}{\ClassError{isw_smb_diss}{\string\yearofpublication\space missing}%
	{You have to use \string\yearofpublication\space to set up the publication year of your thesis,\MessageBreak e.g. `\string\yearofpublication{YYYY}'.}}
\newcommand*\yearofpublication[1]{\renewcommand\@yearofpublication{#1}}

\renewcommand*{\maketitle}{%
  \begin{titlepage}
	{
    \centering
		\begin{minipage}{\titlewidth\textwidth}
			\centering
			{\LARGE\bfseries\sffamily\strut\ignorespaces\@title\par}
		\end{minipage}
		\vfill
		\begin{minipage}{\titlewidth\textwidth}
			\centering
			\introstart\ Konstruktions-, Produktions- und Fahrzeugtechnik\\
			der  Universität Stuttgart zur Erlangung\\
			der Würde eines Doktor-Ingenieurs (Dr.-Ing.)\\
			\introstatus\ Abhandlung\par%
		\end{minipage}
		\vfill
		\begin{minipage}{0.8\textwidth}
			\centering
		\documentsourceintro\\
    {\bfseries\strut\ignorespaces\@author\\}
    aus \@birthplace\par%
		\end{minipage}
    \vfill
		\begin{minipage}{0.8\textwidth}
			\begin{tabbing}
				Hauptberichter:\qquad\quad\qquad\qquad \=\@examiner \\
				Mitberichter:\> \@coexaminer \\[\baselineskip]
				Tag der mündlichen Prüfung: \> \@dateoforalexamination \\
			\end{tabbing}
		\end{minipage}
		\vskip 2\baselineskip
		\begin{minipage}{0.8\textwidth}
			\centering
			\@institute\space der Universität Stuttgart\\
			\vskip \baselineskip
			\@yearofpublication
		\end{minipage}
    \clearpage
	}
  \end{titlepage}
}

%\ifpdf
%\fi

% get footnotes right
\deffootnote{0em}{0em}{\thefootnotemark\hspace*{.5em}}

% Initialize hyperref
\hypersetup{%
	%draft, % hyperref's draft mode, for printing see below
	colorlinks=true, linktocpage=true, pdfstartpage=3,% pdfstartview=FitV,%
	% uncomment the following line if you want to have black links (e.g., for printing)
	%colorlinks=false, linktocpage=false, pdfstartpage=3, pdfstartview=FitV, pdfborder={0 0 0},%
	breaklinks=true, pageanchor=true,%
	pdfpagemode=UseNone,%
	plainpages=false, bookmarksnumbered, bookmarksopen=true,% bookmarksopenlevel=1,%
	hypertexnames=true, pdfhighlight=/O,%
	urlcolor=uniSblue, linkcolor=uniSblue, citecolor=uniSblue,% %pagecolor=uniSblue,%
	%urlcolor=Black, linkcolor=Black, citecolor=Black, %pagecolor=Black,%
}