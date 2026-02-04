%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --------------------------------------------------------
% Rho (Main Paper Class)
% LaTeX Class
% Version 2.1.2 (2025/02/02)
% 
% Optimized for 9pt Two-Column Layout
% Chinese Comments Version by: AntiGravity Agent
% --------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------
% 类配置 (Class Configuration)
%----------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{main}[2025/02/02 Rho Main Class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax
% 默认加载 extarticle 类，强制双栏作为默认值
\LoadClass[twocolumn]{extarticle} 
\AtEndOfClass{\RequirePackage{microtype}}
\linespread{1.05} % 编辑行距优化，增强可读性

% 收紧浮动体间距，使版面更紧凑
\setlength{\textfloatsep}{10pt plus 1.0pt minus 2.0pt}
\setlength{\floatsep}{10pt plus 1.0pt minus 2.0pt}
\setlength{\intextsep}{10pt plus 1.0pt minus 2.0pt}

%----------------------------------------------------------
% 必须加载的宏包 (Required Packages)
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
\RequirePackage{fontawesome5}       % 图标支持
\RequirePackage{chemfig}            % 化学结构式
\RequirePackage{circuitikz}         % 电路图
\RequirePackage{supertabular}
\RequirePackage{matlab-prettifier}
\RequirePackage{csquotes}
\RequirePackage{ragged2e}
\RequirePackage{ccicons}
\RequirePackage{imakeidx}
\RequirePackage{subcaption}
\RequirePackage{stfloats} 
\RequirePackage{authblk}
\RequirePackage{authblk}

%----------------------------------------------------------
% 加载自定义包 (Custom Packages)
%----------------------------------------------------------

% 加载本地同目录下的样式包
\RequirePackage{rhobabel}
\RequirePackage{rhoenvs}

%----------------------------------------------------------
% 全局布尔开关
%----------------------------------------------------------

\newbool{corres-info}
\newbool{rho-abstract}

%----------------------------------------------------------
% 页面布局 (Page Layout)
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
% 图片宏包设置
%----------------------------------------------------------

\usepackage{graphicx}
\RequirePackage{here}
\graphicspath{{figures/}{./}} 

%----------------------------------------------------------
% 盒子工具包
%----------------------------------------------------------

\RequirePackage{adjustbox}
\RequirePackage{colortbl}
\RequirePackage{tcolorbox}

%----------------------------------------------------------
% 数学宏包
%----------------------------------------------------------

\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{mathtools}
% \RequirePackage{amssymb} % 若需其他字体可开启

% 公式间距微调
\newlength{\eqskip}\setlength{\eqskip}{10pt}
\expandafter\def\expandafter\normalsize\expandafter{%
    \normalsize%
    \setlength\abovedisplayskip{\eqskip}%
    \setlength\belowdisplayskip{\eqskip}%
    \setlength\abovedisplayshortskip{\eqskip-\baselineskip}%
    \setlength\belowdisplayshortskip{\eqskip}%
}

%----------------------------------------------------------
% 字体设置 (Fonts)
%----------------------------------------------------------

\usepackage[notextcomp]{stix2}
\RequirePackage[scaled]{helvet}
\renewcommand{\ttdefault}{lmtt}

%----------------------------------------------------------
% URL 样式
%----------------------------------------------------------

\RequirePackage{url}
\RequirePackage{xurl}
\renewcommand\UrlFont{\selectfont}

%----------------------------------------------------------
% 超链接设置
%----------------------------------------------------------

\RequirePackage[colorlinks=true, allcolors=rhocolor]{hyperref}
\RequirePackage{cleveref}
\RequirePackage{bookmark}
\RequirePackage{orcidlink}

%----------------------------------------------------------
% 列表环境
%----------------------------------------------------------

\RequirePackage{enumitem}
\setlist{noitemsep}

%----------------------------------------------------------
% 页眉页脚风格 (Header & Footer)
%----------------------------------------------------------

% 定义页脚字体
\newcommand{\footerfont}{\normalfont\sffamily\fontsize{7}{9}\selectfont}
\newcommand{\institution}[1]{\def\@institution{#1}}
\newcommand{\leadauthor}[1]{\def\@leadauthor{#1}}
\newcommand{\footinfo}[1]{\def\@footinfo{#1}}
\newcommand{\smalltitle}[1]{\def\@smalltitle{#1}}
\newcommand{\theday}[1]{\def\@theday{#1}}

\pagestyle{fancy}
\pagenumbering{arabic}

% 首页专属样式 (firststyle)
\fancypagestyle{firststyle}{
    \fancyfoot[R]{
        {\ifx\@institution\undefined\else\footerfont\@institution\hspace{10pt}\fi}
        {\ifx\@theday\undefined\else\footerfont\bfseries\@theday\hspace{10pt}\fi}
        {\ifx\@smalltitle\undefined\else\footerfont\@smalltitle\hspace{10pt}\fi}
        {\footerfont\textit{Preprint version \textendash\ \today}\hspace{10pt}}
        {\footerfont\textbf\thepage\textendash\pageref{LastPage}}
    }
    \fancyfoot[L]{\ifx\@footinfo\undefined\else\footerfont\@footinfo\fi}
    \fancyfoot[C]{}
    \fancyhead[C]{}
    \fancyhead[R]{}
    \fancyhead[L]{}
    \renewcommand{\headrulewidth}{0pt} % 首页无页眉横线
}

% 通用页眉
\fancyhead[RO,LE]{\ifx\@title\undefined\else\footerfont\@title\fi}
\fancyhead[RE,LO]{\ifx\@leadauthor\undefined\else\footerfont\@leadauthor\fi}

% 通用页脚
\fancyfoot[C]{\footerfont\textit{Preprint version \textendash\ \today}\hspace{20pt}\thepage\textendash\pageref{LastPage}}

% 页眉装饰线
\renewcommand{\headrulewidth}{0.1pt} % 极细灰线
\renewcommand{\headrule}{\hbox to\headwidth{\color{black!15}\leaders\hrule height \headrulewidth\hfill}}
\renewcommand{\footrulewidth}{0pt}   % 无页脚线

%----------------------------------------------------------
% 首字下沉 (Drop Cap)
%----------------------------------------------------------

\newcommand{\dropcapfont}{\color{rhocolor}\bfseries\fontsize{25pt}{28pt}\selectfont}
\newcommand{\rhostart}[1]{\lettrine[lines=2,lraise=0,findent=2pt, nindent=0em]{{\dropcapfont{#1}}}{}}

%----------------------------------------------------------
% 通信作者与第一作者信息栏
%----------------------------------------------------------

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
\newcommand{\firstauthorlanguage}{First Author: }

\newcommand{\rhoinfo}{
    \rhoinfofont
        \vskip5pt
            {\ifx\@corres\undefined\else\textcolor{rhocolor}{\bfseries\ignorespaces\correslanguage}\@corres\fi} 
            {\ifx\@email\undefined\else\textcolor{rhocolor}{\itshape\ignorespaces\emaillanguage}\@email\fi}
            \quad
            {\ifx\@firstauthor\undefined\else\textcolor{rhocolor}{\bfseries\ignorespaces\firstauthorlanguage}\@firstauthor\fi} 
            {\ifx\@femail\undefined\else\textcolor{rhocolor}{\itshape\ignorespaces\emaillanguage}\@femail\fi\par}
            {\ifx\@doi\undefined\else\textcolor{rhocolor}{\bfseries DOI: }\@doi\fi\par}
            {\ifx\@received\undefined\else\textcolor{rhocolor}{\bfseries\ignorespaces\receivedlanguage}\@received\hspace{10pt}\fi}
            {\ifx\@revised\undefined\else\textcolor{rhocolor}{\bfseries\ignorespaces\revisedlanguage}\@revised\hspace{10pt}\fi} 
            {\ifx\@accepted\undefined\else\textcolor{rhocolor}{\bfseries\ignorespaces\acceptedlanguage}\@accepted\hspace{10pt}\fi}
            {\ifx\@published\undefined\else\textcolor{rhocolor}{\bfseries\ignorespaces\publishedlanguage}\@published\fi\par}
                \vskip3pt
            {\ifx\@license\undefined\else\@license\fi\par}
         \vskip1pt
        {\color{rhocolor}\rule{\textwidth}{0.3pt}}
}

%----------------------------------------------------------
% 摘要样式 (Abstract) - 9pt 优化版
%----------------------------------------------------------

\newcommand{\keywords}[1]{\def\@keywords{#1}}
\newcommand{\absfont}{\color{black}\normalfont\sffamily\linespread{1}\fontsize{8}{10}\selectfont}  % 8pt 字体
\newcommand{\absheadfont}{\color{rhocolor}\normalfont\sffamily\fontsize{9}{11}\selectfont}
\newcommand{\keywordsfont}{\normalfont\sffamily\itshape\linespread{1}\fontsize{7}{8.5}\selectfont} % 7pt 字体
\newcommand{\keywordheadfont}{\color{rhocolor}\normalfont\sffamily\fontsize{7.8}{9}\selectfont\bfseries}

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
% 标题区样式 (Title)
%----------------------------------------------------------

\newcommand{\journalname}[1]{\def\@journalname{#1}}
\newcommand{\dates}[1]{\def\@dates{#1}}
\newcommand{\datesfont}{\fontsize{7.5}{9}\selectfont}

\renewcommand{\@maketitle}{
    \bgroup\setlength{\parindent}{0pt}
    {
        {\ifx\@journalname\undefined\vskip-25pt\else\vskip-25pt\RaggedRight\sffamily\bfseries\fontsize{8}{14}\selectfont\@journalname\par\fi}
        {\RaggedRight\color{rhocolor}\sffamily\bfseries\fontsize{16}{22}\selectfont\@title\par}
        \vskip10pt
            {\RaggedRight\@author\par}
        \vskip8pt
            {\ifx\@dates\undefined\vskip2pt\else\RaggedRight\datesfont\@dates\par\vskip15pt\fi}
        \ifbool{rho-abstract}{\justify\rhoabstract}{}
        \ifbool{corres-info}{\RaggedRight\rhoinfo}{}
    } 
    \egroup
    \vskip12pt
}

%----------------------------------------------------------
% 作者机构样式 (Affiliations) - 9pt 优化版
%----------------------------------------------------------

\setlength{\affilsep}{9pt}
\renewcommand\Authfont{\fontsize{9}{11}\bfseries\sffamily\selectfont}
\renewcommand\Affilfont{\fontsize{7}{8.5}\it\selectfont} % 7pt
\renewcommand\AB@affilsep{\reset@font\protect\Affilfont}
\renewcommand\AB@affilsepx{\reset@font\protect\\\protect\Affilfont}

\renewcommand\Authand{\ignorespaces\andlanguage }
\renewcommand\Authands{\ignorespaces\andlanguage }

%----------------------------------------------------------
% 章节样式 (Sections)
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
  
\titleformat{\subsubsection}[block] % Block模式，非runin
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
% 目录样式 (TOC)
%----------------------------------------------------------

\newlength{\tocsep} 
\setlength\tocsep{1.5pc} % Section 缩进
\newlength{\tocsubsecsep} \setlength{\tocsubsecsep}{3pc} % Subsection 缩进
\newlength{\tocsubsubsecsep} \setlength{\tocsubsubsecsep}{4.5pc} % Subsubsection 缩进
\setcounter{tocdepth}{5}

\usepackage{titletoc}
\contentsmargin{2.5em} % 防止长标题文字覆盖页码

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
% 图表与代码标题样式 (Captions)
%----------------------------------------------------------

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
% 代码列表样式 (Listings)
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
% 尾注样式 (Footnotes)
%----------------------------------------------------------

\definecolor{black50}{gray}{0.5}
\renewcommand*{\footnotelayout}{\normalfont\fontsize{6}{8}}
\renewcommand{\footnoterule}{
    \kern -3pt
    {\color{black50} \hrule width 75pt height 0.25pt}
    \kern 2.5pt
}

%----------------------------------------------------------
% 参考文献 (BibLaTeX)
%----------------------------------------------------------

\usepackage[
    backend=biber,
    style=ieee,
    sorting=none
]{biblatex}

\addbibresource{ref.bib} % 默认引用名为 ref.bib

%----------------------------------------------------------

\endinput
