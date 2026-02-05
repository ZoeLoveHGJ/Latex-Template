%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --------------------------------------------------------
% Supplementary Material Class (Based on Rho)
% LaTeX Class
% Version 2.2.0 (Standardized)
% --------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------
% CLASS CONFIGURATION
%----------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{class/sup}[2025/02/05 Standardized Supplementary Class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax
\LoadClass{extarticle} % Defaults to onecolumn
\AtEndOfClass{\RequirePackage{microtype}}
\linespread{1.05} 
\setlength{\textfloatsep}{10pt plus 1.0pt minus 2.0pt}
\setlength{\floatsep}{10pt plus 1.0pt minus 2.0pt}
\setlength{\intextsep}{10pt plus 1.0pt minus 2.0pt}

%----------------------------------------------------------
% REQUIRED PACKAGES
%----------------------------------------------------------

\RequirePackage[utf8]{inputenc}
\RequirePackage{etoolbox}
\RequirePackage[framemethod=tikz]{mdframed}
\RequirePackage{titling}
\RequirePackage{lettrine}
\RequirePackage[switch]{lineno}
\RequirePackage{microtype}
\RequirePackage[bottom,hang,flushmargin,ragged]{footmisc}
\RequirePackage{fancyhdr}
\RequirePackage{xifthen}
\RequirePackage{adjustbox}
\RequirePackage{adforn}
\RequirePackage{lastpage}
\RequirePackage[explicit]{titlesec}
\RequirePackage{booktabs}
\RequirePackage{array} 
\RequirePackage{caption}
\RequirePackage{setspace}
\RequirePackage{iflang}
\RequirePackage{listings}
\RequirePackage{lipsum}
\RequirePackage{fontawesome5}
\RequirePackage{chemfig}
\RequirePackage{circuitikz}
\RequirePackage{supertabular}
\RequirePackage{matlab-prettifier}
\RequirePackage{csquotes}
\RequirePackage{ragged2e}
\RequirePackage{ccicons}
\RequirePackage{imakeidx}
\RequirePackage{subcaption}
\RequirePackage{stfloats} 
\RequirePackage{authblk}

%----------------------------------------------------------
% RHO CUSTOM PACKAGES
%----------------------------------------------------------

\RequirePackage{class/rhobabel}
\RequirePackage{class/rhoenvs}

%----------------------------------------------------------
% CORRESPONDING AUTHOR SECTION-, ABTRACT-, NEWBOOL
%----------------------------------------------------------

\newbool{corres-info}
\newbool{rho-abstract}

% Default settings for Supplementary
\setbool{rho-abstract}{false}
\setbool{corres-info}{false}

\AtBeginDocument{
    \setcounter{figure}{0}
    \setcounter{table}{0}
    \setcounter{equation}{0}
    \setcounter{section}{0}
    \renewcommand{\thefigure}{S\arabic{figure}}
    \renewcommand{\thetable}{S\arabic{table}}
    \renewcommand{\theequation}{EqS-\arabic{equation}}
    \renewcommand{\thesection}{S.\arabic{section}}
}

%----------------------------------------------------------
% PAGE LAYOUT
%----------------------------------------------------------

\RequirePackage[
    left=1.25cm, 
    right=1.25cm, 
    top=2cm, 
    bottom=2cm, 
    headsep=0.75cm
]{geometry}
% No columnsep needed for onecolumn

%----------------------------------------------------------
% PACKAGES FOR FIGURES
%----------------------------------------------------------

\usepackage{graphicx}
\RequirePackage{here}
\graphicspath{{figures/}{./}} 

%----------------------------------------------------------
% PACKAGES FOR BOXES
%----------------------------------------------------------

\RequirePackage{adjustbox}
\RequirePackage{colortbl}
\RequirePackage{tcolorbox}

%----------------------------------------------------------
% MATH PACKAGES
%----------------------------------------------------------

\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{mathtools}

\newlength{\eqskip}\setlength{\eqskip}{10pt}
\expandafter\def\expandafter\normalsize\expandafter{%
    \normalsize%
    \setlength\abovedisplayskip{\eqskip}%
    \setlength\belowdisplayskip{\eqskip}%
    \setlength\abovedisplayshortskip{\eqskip-\baselineskip}%
    \setlength\belowdisplayshortskip{\eqskip}%
}

%----------------------------------------------------------
% FONTS
%----------------------------------------------------------

\usepackage[notextcomp]{stix2}
\RequirePackage[scaled]{helvet}
\renewcommand{\ttdefault}{lmtt}

%----------------------------------------------------------
% URLs STYLE
%----------------------------------------------------------

\RequirePackage{url}
\RequirePackage{xurl}
\renewcommand\UrlFont{\selectfont}

%----------------------------------------------------------

\RequirePackage[colorlinks=true, allcolors=rhocolor]{hyperref}
\RequirePackage{orcidlink}
\RequirePackage{cleveref}
\RequirePackage{bookmark}

%----------------------------------------------------------
% ITEMS
%----------------------------------------------------------

\RequirePackage{enumitem}
\setlist{noitemsep}

%----------------------------------------------------------
% FIRST PAGE-, HEADER AND FOOTER
%----------------------------------------------------------

\newcommand{\footerfont}{\normalfont\sffamily\fontsize{7}{9}\selectfont}
\newcommand{\institution}[1]{\def\@institution{#1}}
\newcommand{\leadauthor}[1]{\def\@leadauthor{#1}}
\newcommand{\footinfo}[1]{\def\@footinfo{#1}}
\newcommand{\smalltitle}[1]{\def\@smalltitle{#1}}
\newcommand{\theday}[1]{\def\@theday{#1}}

\pagestyle{fancy}
   \pagenumbering{arabic}

\fancypagestyle{firststyle}{
    \fancyfoot[R]{
        {\ifx\@institution\undefined\else\footerfont\@institution\hspace{10pt}\fi}
        {\ifx\@theday\undefined\else\footerfont\bfseries\@theday\hspace{10pt}\fi}
        {\ifx\@smalltitle\undefined\else\footerfont\@smalltitle\hspace{10pt}\fi}
        {\footerfont\textit{Supplementary Material \textendash\ \today}\hspace{10pt}}
        {\footerfont\textbf\thepage\textendash\pageref{LastPage}}
    }
    \fancyfoot[L]{\ifx\@footinfo\undefined\else\footerfont\@footinfo\fi}
    \fancyfoot[C]{}
    \fancyhead[C]{}
    \fancyhead[R]{}
    \fancyhead[L]{}
    \renewcommand{\headrulewidth}{0pt}
}

\fancyhead[RO,LE]{\ifx\@title\undefined\else\footerfont\@title\fi}
\fancyhead[RE,LO]{\ifx\@leadauthor\undefined\else\footerfont\@leadauthor\fi}
\fancyfoot[C]{\footerfont\textit{Supplementary Material \textendash\ \today}\hspace{20pt}\thepage\textendash\pageref{LastPage}}

\renewcommand{\headrulewidth}{0.1pt}
\renewcommand{\headrule}{\hbox to\headwidth{\color{black!15}\leaders\hrule height \headrulewidth\hfill}}
\renewcommand{\footrulewidth}{0pt} 

%----------------------------------------------------------
% LETTERS
%----------------------------------------------------------

\newcommand{\dropcapfont}{\color{rhocolor}\bfseries\fontsize{25pt}{28pt}\selectfont}
\newcommand{\rhostart}[1]{\lettrine[lines=2,lraise=0,findent=2pt, nindent=0em]{{\dropcapfont{#1}}}{}}

%----------------------------------------------------------
% INFO SECTION (Simplified for Sup)
%----------------------------------------------------------

\newcommand{\rhoinfofont}{\color{black}\normalfont\sffamily\linespread{1}\fontsize{7.8}{9}\selectfont}
% Dummy definitions if needed

%----------------------------------------------------------
%----------------------------------------------------------
% ABSTRACT STYLE
%----------------------------------------------------------

% Abstract text style new commands
\newcommand{\keywords}[1]{\def\@keywords{#1}}
\newcommand{\absfont}{\color{black}\normalfont\sffamily\linespread{1}\fontsize{8}{10}\selectfont}
\newcommand{\absheadfont}{\color{rhocolor}\normalfont\sffamily\fontsize{9}{11}\selectfont}
\newcommand{\keywordsfont}{\normalfont\sffamily\itshape\linespread{1}\fontsize{7}{8.5}\selectfont}
\newcommand{\keywordheadfont}{\color{rhocolor}\normalfont\sffamily\fontsize{7.8}{9}\selectfont\bfseries}

% Abstract definition
\def\xabstract{abstract}
\long\def\abstract#1\end#2{
    \def\two{#2}\ifx\two\xabstract
    \long\gdef\theabstract{\ignorespaces#1}
    \def\go{\end{abstract}}
\else
    #1\end{#2}
    \gdef\theabstract{\vskip12pt 
    \vskip12pt}
    \let\go\relax\fi
\go}

% Rho class abstract style 
\newcommand{\rhoabstract}{
    \begin{tcolorbox}[colback=rhocolor!12, arc=0pt, boxrule=0pt, left=5pt, right=5pt, top=5pt, bottom=5pt, colframe=rhocolor, sharp corners]
        \ifx\@keywords\undefined
            \absheadfont\bfseries\abstractname\vskip0.5em\absfont\theabstract\vskip10pt
        \else
            \absheadfont\bfseries\abstractname\vskip0.5em\absfont\theabstract\vskip10pt
            \keywordsfont\keywordname\hspace{0.1em}\keywordsfont\@keywords
        \fi
    \end{tcolorbox}
}

%----------------------------------------------------------
% TITLE STYLE
%----------------------------------------------------------

\newcommand{\journalname}[1]{\def\@journalname{#1}}
\newcommand{\dates}[1]{\def\@dates{#1}}
\newcommand{\datesfont}{\fontsize{7.5}{9}\selectfont}

\renewcommand{\@maketitle}{
    \bgroup\setlength{\parindent}{0pt}
    {
        {\ifx\@journalname\undefined\vskip-18pt\else\vskip-25pt\RaggedRight\sffamily\bfseries\fontsize{8}{14}\selectfont\@journalname\par\fi}
        {\RaggedRight\color{rhocolor}\sffamily\bfseries\fontsize{16}{22}\selectfont\@title\par}
        \vskip10pt
            {\RaggedRight\@author\par}
        \vskip8pt
        % Abstract and Info
        \ifbool{rho-abstract}{\justify\rhoabstract}{}
        \ifbool{corres-info}{\RaggedRight\rhoinfo}{}
    } 
    \egroup
    \vskip12pt
}

%----------------------------------------------------------
% AFFILIATION
%----------------------------------------------------------

\setlength{\affilsep}{9pt}
\renewcommand\Authfont{\fontsize{9}{11}\bfseries\sffamily\selectfont}
\renewcommand\Affilfont{\fontsize{7}{8.5}\it\selectfont}
\renewcommand\AB@affilsep{\reset@font\protect\Affilfont}
\renewcommand\AB@affilsepx{\reset@font\protect\\\protect\Affilfont}
\renewcommand\Authand{\ignorespaces\andlanguage }
\renewcommand\Authands{\ignorespaces\andlanguage }

%----------------------------------------------------------
% SECTION STYLE
%----------------------------------------------------------

\setcounter{secnumdepth}{5}

\titleformat{\section}
    {\color{rhocolor}\sffamily\large\bfseries}
    {}
    {0em}
    {\tikz\draw[rhocolor, fill=rhocolor] (0,0) rectangle (6.6pt,6.6pt); \hspace{2.5pt} \thesection. \hspace{0.5em} #1}
    []

\titleformat{name=\section,numberless}[block]
    {\color{rhocolor}\sffamily\large\bfseries}
    {}
    {0em}
    {\tikz\draw[rhocolor, fill=rhocolor] (0,0) rectangle (6.6pt,6.6pt); \hspace{2.5pt} {#1}}
    []
  
\titleformat{\subsection}[block]
    {\sffamily\bfseries}
    {}
    {0em}
    {\tikz\draw[rhocolor, fill=rhocolor] (0,0) rectangle (5pt,5pt); \hspace{2.5pt} \thesubsection. \hspace{0.5em} #1}     
    []
  
\titleformat{\subsubsection}[block]
    {\small\sffamily\bfseries\itshape}
    {\thesubsubsection.}
    {0.5em}
    {#1}
    []    
  
\titleformat{\paragraph}[runin]
    {\small\bfseries}
    {}
    {0em}
    {#1} 
  
\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{2pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{2pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{12pt}

%----------------------------------------------------------
% TABLE OF CONTENTS (Wider Spacing)
%----------------------------------------------------------

\newlength{\tocsep} 
\setlength\tocsep{2.5pc} % Wider indentation for "S.1"
\newlength{\tocsubsecsep} \setlength{\tocsubsecsep}{3.5pc}
\newlength{\tocsubsubsecsep} \setlength{\tocsubsubsecsep}{5.0pc}
\setcounter{tocdepth}{5}

\usepackage{titletoc}
\contentsmargin{2.5em}

\titlecontents{section}[\tocsep]
    {\addvspace{4pt}\sffamily\selectfont\bfseries}
    {\contentslabel[\thecontentslabel]{\tocsep}}
    {}
    {\hfill\thecontentspage}
    []

\titlecontents{subsection}[\tocsubsecsep]
    {\addvspace{4pt}\small\sffamily\selectfont}
    {\contentslabel[\thecontentslabel]{\tocsep}}
    {}
    {\ \titlerule*[.5pc]{.}\ \thecontentspage}
    []

\titlecontents{subsubsection}[\tocsubsubsecsep]
    {\addvspace{0pt}\footnotesize\sffamily\selectfont}
    {\contentslabel[\thecontentslabel]{\tocsep}}
    {}
    {\ \titlerule*[.5pc]{.}\ \thecontentspage}
    []

%----------------------------------------------------------
% CAPTIONS
%----------------------------------------------------------

\RequirePackage[
    labelfont={bf,sf,color=rhocolor},
    list=no,
    labelsep=period,
    singlelinecheck=off,
    font=footnotesize,
    justification=justified
]{caption}

\captionsetup[table]{position=below}
\newcommand{\tabletext}[1]{{\setlength{\leftskip}{9pt}\fontsize{7}{9}\vskip2pt\selectfont#1}}
\AtBeginEnvironment{table}{\footnotesize}
\AtBeginEnvironment{table*}{\footnotesize}
\AtBeginEnvironment{longtable}{\footnotesize}
\AtBeginEnvironment{supertabular}{\footnotesize}

\newcommand{\captioncodelanguage}{
    \iflanguage{spanish}{{C\'odigo}}{{Code}}
}
\captionsetup[lstlisting]{font=footnotesize, labelfont={bf,sf,color=rhocolor}, belowskip=3pt, position=below, labelsep=period}
\renewcommand\lstlistingname{\captioncodelanguage}
\renewcommand\lstlistlistingname{\captioncodelanguage}

%----------------------------------------------------------
% LISTINGS
%----------------------------------------------------------
% Skipped repetition for brevity, assuming standard listings style from main.cls works fine or users copy it. 
% Wait, I should include it for completeness.

\definecolor{rhocodeback}{RGB}{246, 248, 250}   
\definecolor{rhocodecomment}{RGB}{106, 115, 125} 
\definecolor{rhocodekey}{RGB}{0, 64, 128}        
\definecolor{rhocodestring}{RGB}{165, 42, 42}    
\definecolor{rhogray}{RGB}{0.5,0.5,0.5}
\definecolor{rhoredmatlab}{RGB}{199, 78, 0}

\lstdefinestyle{rhocoding}{
    backgroundcolor=\color{rhocodeback},   
    commentstyle=\color{rhocodecomment},
    keywordstyle=\color{rhocodekey},
    numberstyle=\tiny\color{rhogray},
    stringstyle=\color{rhocodestring},
    breakatwhitespace=false,        
    basicstyle=\small\ttfamily,
    breaklines=true,                 
    captionpos=b,                    
    keepspaces=true,                 
    numbers=left,
    numbersep=8pt,
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2,
    aboveskip=12pt,
    belowskip=8pt,
    xleftmargin=10pt,
    rulecolor=\color{rhogray},
    frame=single
}

\lstset{
    language=Matlab,
    rulecolor=\color{rhogray},
    emph=[1]{for,end,break},
    emphstyle=[1]\color{rhoredmatlab},
}

\lstset{style=rhocoding}

%----------------------------------------------------------
% FOOTNOTES
%----------------------------------------------------------

\definecolor{black50}{gray}{0.5}
\renewcommand*{\footnotelayout}{\normalfont\fontsize{6}{8}}
\renewcommand{\footnoterule}{
    \kern -3pt
    {\color{black50} \hrule width 75pt height 0.25pt}
    \kern 2.5pt
}

%----------------------------------------------------------
% BIBLATEX
%----------------------------------------------------------

\usepackage[
    backend=biber,
    style=ieee,
    sorting=none
]{biblatex}

\addbibresource{ref.bib}

%----------------------------------------------------------

\endinput
