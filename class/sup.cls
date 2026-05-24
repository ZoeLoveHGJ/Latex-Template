%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --------------------------------------------------------
% Supplementary Material Class
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

\RequirePackage{class/academicbase}

%----------------------------------------------------------
% CORRESPONDING AUTHOR SECTION-, ABTRACT-, NEWBOOL
%----------------------------------------------------------

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
\AtEndDocument{\label{SupplementaryLastPage}}

\RequirePackage{nameref}
\RequirePackage{xr-hyper}
\RequirePackage[colorlinks=true, allcolors=rhocolor]{hyperref}
\RequirePackage{orcidlink}
\RequirePackage{cleveref}
\RequirePackage{bookmark}

%----------------------------------------------------------
% FIRST PAGE-, HEADER AND FOOTER
%----------------------------------------------------------

% Cross-Referencing setup (xr-hyper is loaded before hyperref)
\newcommand{\setupxr}[1]{
    \externaldocument{#1}
}

\pagestyle{fancy}
   \pagenumbering{arabic}

\fancypagestyle{firststyle}{
    \fancyfoot[R]{}
    \fancyfoot[L]{}
    \fancyfoot[C]{\footerfont\textbf{1\textendash\pageref{SupplementaryLastPage}}}
    \fancyhead[L]{\ifx\@institution\undefined\else\footerfont\textbf{\@institution}\fi}
    \fancyhead[R]{\ifx\@paperversion\undefined\footerfont\textit{Supplementary \textendash\ Version \today}\else\footerfont\textit{\@paperversion}\fi}
    \fancyhead[C]{\sffamily\fontsize{7}{9}\selectfont\bfseries Supplementary Material}
    \renewcommand{\headrulewidth}{0.4pt}
    \renewcommand{\headrule}{\hbox to\headwidth{\color{rhocolor}\leaders\hrule height \headrulewidth\hfill}}
    \renewcommand{\footrulewidth}{0pt}
}

\fancyhead[L]{\ifx\@savedtitle\undefined\else\footerfont\@savedtitle\fi}
\fancyhead[R]{\ifx\@leadauthor\undefined\else\footerfont\@leadauthor\fi}

% Footer
\fancyfoot[L]{\ifx\@institution\undefined\else\footerfont\@institution\fi}
\fancyfoot[R]{\ifx\@paperversion\undefined\footerfont\textit{Supplementary \textendash\ \today}\else\footerfont\textit{\@paperversion}\fi}
\fancyfoot[C]{\footerfont\textbf{\thepage\textendash\pageref{SupplementaryLastPage}}}

\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\headrule}{\hbox to\headwidth{\color{rhocolor}\leaders\hrule height \headrulewidth\hfill}}
\renewcommand{\footrulewidth}{0pt}

\renewcommand{\@maketitle}{
    \bgroup\setlength{\parindent}{0pt}
    \global\let\@savedtitle\@title
    {
        \centering
        {\ifx\@journalname\undefined\vskip-10pt\else\vskip-5pt\sffamily\bfseries\fontsize{8}{14}\selectfont\@journalname\par\fi}
        \vskip10pt
        {\color{themecolor}\bfseries\fontsize{16}{20}\selectfont\@title\par}
        \vskip6pt
        {\color{themecolor}\rule{\textwidth}{0.4pt}}\par
        \vskip8pt
        {\bfseries\@author\par}
        \vskip6pt
            {\ifx\@dates\undefined\vskip2pt\else\datesfont\@dates\par\vskip8pt\fi}
        \ifbool{corres-info}{\articleinfo}{}
        \vskip8pt
        \ifbool{abstract-enabled}{\articleabstractbox}{}
    } 
    \egroup
    \vskip12pt
    \thispagestyle{firststyle}
}
\apptocmd{\maketitle}{\thispagestyle{firststyle}}{}{}

\setacademictoctabs{2.5pc}{3.5pc}{5.0pc}
\academictocsetup

%----------------------------------------------------------

\endinput
