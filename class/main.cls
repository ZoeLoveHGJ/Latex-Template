%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --------------------------------------------------------
% Main Article Class
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

\RequirePackage{class/academicbase}

%----------------------------------------------------------
% CORRESPONDING AUTHOR SECTION-, ABTRACT-, NEWBOOL
%----------------------------------------------------------

\setlength{\columnsep}{15pt}

\RequirePackage[colorlinks=true, allcolors=rhocolor]{hyperref}
\RequirePackage{orcidlink}
\RequirePackage{cleveref}
\RequirePackage{bookmark}

%----------------------------------------------------------
% FIRST PAGE-, HEADER AND FOOTER
%----------------------------------------------------------

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

\newcommand{\mainabstractbox}{
    \renewcommand{\academicabstractextras}{%
        \ifx\@keywords\undefined\else
            \vskip6pt
            {\color{black!20}\rule{\linewidth}{0.3pt}}
            \vskip4pt
            \noindent\keywordsfont\textcolor{themecolor}{\bfseries Keywords:}\hspace{0.3em}\@keywords
        \fi
    }%
    \articleabstractbox
}

\renewcommand{\@maketitle}{
    \bgroup\setlength{\parindent}{0pt}
    \global\let\@savedtitle\@title
    {
        \centering
        {\ifx\@journalname\undefined\vskip-10pt\else\vskip-5pt\sffamily\bfseries\fontsize{8}{14}\selectfont\@journalname\par\fi}
        \vskip10pt
        {\color{black}\bfseries\fontsize{18}{22}\selectfont\@title\par}
        \vskip6pt
        {\color{themecolor}\rule{\textwidth}{0.4pt}}\par
        \vskip8pt
        {\bfseries\@author\par}
        \vskip6pt
            {\ifx\@dates\undefined\vskip2pt\else\datesfont\@dates\par\vskip8pt\fi}
        \ifbool{corres-info}{\articleinfo}{}
        \vskip8pt
        \ifbool{abstract-enabled}{\mainabstractbox}{}
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
            \small\textcolor{themecolor}{\bfseries Graphical Abstract:} #2
        \end{minipage}%
    }%
}

\setacademictoctabs{1.5pc}{3pc}{4.5pc}
\academictocsetup

%----------------------------------------------------------

\endinput
