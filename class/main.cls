%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --------------------------------------------------------
% Main Article Class (Based on Rho)
% LaTeX Class
% Version 2.2.0 (Standardized)
% --------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------
% CLASS CONFIGURATION
%----------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{class/main}[2025/02/05 Standardized Main Class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax
\LoadClass[twocolumn]{extarticle} % Defaults to twocolumn
\AtEndOfClass{\RequirePackage{microtype}}
\linespread{1.05} % Editorial spacing
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
\setlength{\columnsep}{15pt}

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
\tcbuselibrary{skins}

%----------------------------------------------------------
% MATH PACKAGES
%----------------------------------------------------------

\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{mathtools}

% Equation skip value
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

% New commands
\newcommand{\footerfont}{\normalfont\sffamily\fontsize{7}{9}\selectfont}
\newcommand{\institution}[1]{\def\@institution{#1}}
\newcommand{\leadauthor}[1]{\def\@leadauthor{#1}}
\newcommand{\footinfo}[1]{\def\@footinfo{#1}}
\newcommand{\smalltitle}[1]{\def\@smalltitle{#1}}
\newcommand{\theday}[1]{\def\@theday{#1}}
\newcommand{\paperversion}[1]{\def\@paperversion{#1}}

\pagestyle{fancy}
   \pagenumbering{arabic}

% First page style
\fancypagestyle{firststyle}{
    \fancyfoot[R]{}
    \fancyfoot[L]{}
    \fancyfoot[C]{\footerfont\textbf{1\textendash\pageref{LastPage}}}
    \fancyhead[L]{\ifx\@institution\undefined\else\footerfont\textbf{\@institution}\fi}
    \fancyhead[R]{\ifx\@paperversion\undefined\footerfont\textit{Version\textendash\  \today}\else\footerfont\textit{\@paperversion}\fi}
    \fancyhead[C]{\sffamily\fontsize{7}{9}\selectfont\bfseries Main Paper}
    \renewcommand{\headrulewidth}{0.4pt}
    \renewcommand{\headrule}{\hbox to\headwidth{\color{rhocolor}\leaders\hrule height \headrulewidth\hfill}}
    \renewcommand{\footrulewidth}{0pt}
}

% Header
\fancyhead[L]{\ifx\@savedtitle\undefined\else\footerfont\@savedtitle\fi}
\fancyhead[R]{\ifx\@leadauthor\undefined\else\footerfont\@leadauthor\fi}

% Footer
\fancyfoot[L]{\ifx\@institution\undefined\else\footerfont\@institution\fi}
\fancyfoot[R]{\ifx\@paperversion\undefined\footerfont\textit{Paper Version \textendash\ \today}\else\footerfont\textit{\@paperversion}\fi}
\fancyfoot[C]{\footerfont\textbf{\thepage\textendash\pageref{LastPage}}}

\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\headrule}{\hbox to\headwidth{\color{rhocolor}\leaders\hrule height \headrulewidth\hfill}}
\renewcommand{\footrulewidth}{0pt}

%----------------------------------------------------------
% RHO START ~ LETTRINE
%----------------------------------------------------------

\newcommand{\dropcapfont}{\color{rhocolor}\bfseries\fontsize{25pt}{28pt}\selectfont}
\newcommand{\rhostart}[1]{\lettrine[lines=2,lraise=0,findent=2pt, nindent=0em]{{\dropcapfont{#1}}}{}}

%----------------------------------------------------------
% CORRESPONDING AUTHOR SECTION
%----------------------------------------------------------

% New commands
\newcommand{\rhoinfofont}{\color{black}\normalfont\sffamily\linespread{1}\fontsize{7.8}{9}\selectfont}
\newcommand{\received}[1]{\def\@received{#1}}
\newcommand{\revised}[1]{\def\@revised{#1}}
\newcommand{\accepted}[1]{\def\@accepted{#1}}
\newcommand{\published}[1]{\def\@published{#1}}
\newcommand{\corres}[1]{\def\@corres{#1}}
\newcommand{\email}[1]{\def\@email{#1}}
\newcommand{\doi}[1]{\def\@doi{#1}}
\newcommand{\license}[1]{\def\@license{#1}}
\newcommand{\firstauthor}[1]{\def\@firstauthor{#1}}
\newcommand{\femail}[1]{\def\@femail{#1}}
\newcommand{\allemails}[1]{\def\@allemails{#1}}
\newcommand{\firstauthorlanguage}{First Author: }

\newcommand{\rhoinfo}{
    \centering\rhoinfofont
        \vskip5pt
            {\ifx\@corres\undefined\else\textcolor{rhocolor}{\bfseries\ignorespaces\correslanguage}\@corres\fi} 
            {\ifx\@email\undefined\else\textcolor{rhocolor}{\itshape\ignorespaces\emaillanguage}\@email\fi}
            \quad\textcolor{rhocolor}{|}\quad
            {\ifx\@firstauthor\undefined\else\textcolor{rhocolor}{\bfseries\ignorespaces\firstauthorlanguage}\@firstauthor\fi} 
            {\ifx\@femail\undefined\else\textcolor{rhocolor}{\itshape\ignorespaces\emaillanguage}\@femail\fi\par}
            {\ifx\@allemails\undefined\else\textcolor{rhocolor}{\itshape E-mails: }\@allemails\par\fi}
            {\ifx\@doi\undefined\else\textcolor{rhocolor}{\bfseries DOI: }\@doi\fi\par}
            {\ifx\@received\undefined\else\textcolor{rhocolor}{\bfseries\ignorespaces\receivedlanguage}\@received\hspace{10pt}\fi}
            {\ifx\@revised\undefined\else\textcolor{rhocolor}{\bfseries\ignorespaces\revisedlanguage}\@revised\hspace{10pt}\fi} 
            {\ifx\@accepted\undefined\else\textcolor{rhocolor}{\bfseries\ignorespaces\acceptedlanguage}\@accepted\hspace{10pt}\fi}
            {\ifx\@published\undefined\else\textcolor{rhocolor}{\bfseries\ignorespaces\publishedlanguage}\@published\fi\par}
                \vskip3pt
            {\ifx\@license\undefined\else\@license\fi\par}
         \vskip1pt
}

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
    \begin{tcolorbox}[
        enhanced,
        colback=white,
        arc=5pt,
        boxrule=0.8pt,
        left=10pt, right=10pt, top=12pt, bottom=8pt,
        colframe=rhocolor,
        title={\centering\bfseries\color{rhocolor}\abstractname},
        coltitle=rhocolor,
        fonttitle=\sffamily\fontsize{10}{12}\selectfont,
        attach boxed title to top center={yshift=-\tcboxedtitleheight/2},
        boxed title style={colback=white, colframe=white, boxrule=0pt, arc=0pt, left=6pt, right=6pt, top=1pt, bottom=1pt}
    ]
        \justify\absfont\theabstract
        \ifx\@keywords\undefined\else
            \vskip6pt
            {\color{black!20}\rule{\linewidth}{0.3pt}}
            \vskip4pt
            \noindent\keywordsfont\textcolor{rhocolor}{\bfseries Keywords:}\hspace{0.3em}\@keywords
        \fi
    \end{tcolorbox}
}

%----------------------------------------------------------
% TITLE STYLE
%----------------------------------------------------------

% New commands
\newcommand{\journalname}[1]{\def\@journalname{#1}}
\newcommand{\dates}[1]{\def\@dates{#1}}
\newcommand{\datesfont}{\fontsize{7.5}{9}\selectfont}

\renewcommand{\@maketitle}{
    \bgroup\setlength{\parindent}{0pt}
    \global\let\@savedtitle\@title
    {
        \centering
        {\ifx\@journalname\undefined\vskip-10pt\else\vskip-5pt\sffamily\bfseries\fontsize{8}{14}\selectfont\@journalname\par\fi}
        \vskip10pt
        {\color{black}\bfseries\fontsize{18}{22}\selectfont\@title\par}
        \vskip6pt
        {\color{rhocolor}\rule{\textwidth}{0.4pt}}\par
        \vskip8pt
        {\bfseries\@author\par}
        \vskip6pt
            {\ifx\@dates\undefined\vskip2pt\else\datesfont\@dates\par\vskip8pt\fi}
        \ifbool{corres-info}{\rhoinfo}{}
        \vskip8pt
        \ifbool{rho-abstract}{\rhoabstract}{}
        \ifx\@graphicalabstract\undefined\else
            \vskip15pt
            \centering
            \@graphicalabstract
            \par
        \fi
    } 
    \egroup
    \vskip12pt
    \thispagestyle{firststyle}
}
\apptocmd{\maketitle}{\thispagestyle{firststyle}}{}{}


% 图形化摘要命令 (Graphical Abstract)
% 使用方法：\graphicalabstract{图片命令}{描述文字}
% 示例：\graphicalabstract{\includegraphics[width=0.8\linewidth]{fig.pdf}}{描述内容}
\newcommand{\graphicalabstract}[2]{%
    \def\@graphicalabstract{%
        #1\par\vskip6pt
        \noindent\begin{minipage}{\linewidth}
            \small\textcolor{rhocolor}{\bfseries Graphical Abstract:} #2
        \end{minipage}%
    }%
}

%----------------------------------------------------------
% AFFILIATION SETUP
%----------------------------------------------------------

\setlength{\affilsep}{9pt}
\renewcommand\Authfont{\fontsize{9}{11}\bfseries\selectfont}
\renewcommand\Affilfont{\fontsize{7}{8.5}\it\selectfont}
\renewcommand\AB@affilsep{\reset@font\protect\Affilfont}
\renewcommand\AB@affilsepx{\reset@font\protect\\\protect\Affilfont}

% Authands language
\renewcommand\Authand{\ignorespaces\andlanguage }
\renewcommand\Authands{\ignorespaces\andlanguage }

%----------------------------------------------------------
% SECTION STYLE
%----------------------------------------------------------

\setcounter{secnumdepth}{5}

\titleformat{\section}
    {\color{rhocolor}\sffamily\large\bfseries}
    {\thesection}
    {0.5em}
    {#1}
    []

\titleformat{name=\section,numberless}[block]
    {\color{rhocolor}\sffamily\large\bfseries}
    {}
    {0em}
    {#1}
    []
  
\titleformat{\subsection}[block]
    {\sffamily\bfseries}
    {\thesubsection}
    {0.5em}
    {#1}     
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
% TABLE OF CONTENTS
%----------------------------------------------------------

\newlength{\tocsep} 
\setlength\tocsep{1.5pc}
\newlength{\tocsubsecsep} \setlength{\tocsubsecsep}{3pc}
\newlength{\tocsubsubsecsep} \setlength{\tocsubsubsecsep}{4.5pc}
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
% FIGURE-, TABLE-, LISTINGS- CAPTION STYLE
%----------------------------------------------------------

% General captions
\RequirePackage[
    labelfont={bf,sf,color=rhocolor},
    list=no,
    labelsep=period,
    singlelinecheck=off,
    font=footnotesize,
    justification=justified
]{caption}

% Table caption
\captionsetup[table]{position=below}
\newcommand{\tabletext}[1]{{\setlength{\leftskip}{9pt}\fontsize{7}{9}\vskip2pt\selectfont#1}}
\AtBeginEnvironment{table}{\footnotesize}
\AtBeginEnvironment{table*}{\footnotesize}
\AtBeginEnvironment{longtable}{\footnotesize}
\AtBeginEnvironment{supertabular}{\footnotesize}

% Listings caption
\newcommand{\captioncodelanguage}{
    \iflanguage{spanish}{
        {C\'odigo}%
    }{%
        {Code}%
    }%
}
\captionsetup[lstlisting]{font=footnotesize, labelfont={bf,sf,color=rhocolor}, belowskip=3pt, position=below, labelsep=period}
\renewcommand\lstlistingname{\captioncodelanguage}
\renewcommand\lstlistlistingname{\captioncodelanguage}

%----------------------------------------------------------
% LISTINGS STYLE
%----------------------------------------------------------

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
% FOOTNOTE STYLE
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

\addbibresource{ref.bib} % Default standard name

%----------------------------------------------------------

\endinput
