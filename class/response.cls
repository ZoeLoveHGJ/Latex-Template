%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --------------------------------------------------------
% Response to Reviewers Class (Based on Rho)
% LaTeX Class  —  Version 1.1.0 (2026/02/13)
% --------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------
% CLASS CONFIGURATION
%----------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{class/response}[2026/02/13 Response to Reviewers Class v1.1]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper,11pt]{article}

%----------------------------------------------------------
% REQUIRED PACKAGES
%----------------------------------------------------------

\RequirePackage{geometry}
\RequirePackage[table]{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{ragged2e}
\RequirePackage{enumitem}
\RequirePackage{lastpage}
\RequirePackage{etoolbox}
\RequirePackage[normalem]{ulem}
\RequirePackage{amsmath}
\RequirePackage{tcolorbox}
\tcbuselibrary{skins,breakable}
\RequirePackage[explicit]{titlesec}
\RequirePackage{titletoc}

%----------------------------------------------------------
% 主题色预设
%----------------------------------------------------------

\definecolor{rho-red}{HTML}{B00000}
\definecolor{rho-purple}{HTML}{6A1B9A}
\definecolor{rho-blue}{HTML}{1565C0}

\colorlet{rhocolor}{rho-red}

\newcommand{\rhotheme}[1]{%
    \colorlet{rhocolor}{rho-#1}%
}

% 功能色
\definecolor{commentcolor}{HTML}{1565C0}      % 审稿意见文字（蓝色）
\definecolor{revisedbg}{HTML}{E8F5E9}          % 修改文本背景（浅绿）
\definecolor{addedcolor}{HTML}{B00000}          % 新增文字标记（红色）
\definecolor{deletedcolor}{HTML}{B71C1C}        % 删除文字（深红）

%----------------------------------------------------------
% PAGE LAYOUT
%----------------------------------------------------------

\geometry{
    left=2.5cm,
    right=2.5cm,
    top=3cm,
    bottom=2.5cm,
    headsep=1cm
}

\setlength{\parindent}{0pt}
\setlength{\parskip}{0.6em}

%----------------------------------------------------------
% FONTS
%----------------------------------------------------------

\RequirePackage[notextcomp]{stix2}
\RequirePackage[scaled]{helvet}
\renewcommand{\ttdefault}{lmtt}

%----------------------------------------------------------
% LINKS
%----------------------------------------------------------

\RequirePackage{url}
\RequirePackage[colorlinks=true, allcolors=rhocolor]{hyperref}

%----------------------------------------------------------
% 文档信息命令
%----------------------------------------------------------

\newcommand{\papertitle}[1]{\def\@papertitle{#1}}
\newcommand{\journalname}[1]{\def\@journalname{#1}}
\newcommand{\authorname}[1]{\def\@authorname{#1}}
\newcommand{\manuscriptid}[1]{\def\@manuscriptid{#1}}

\newcommand{\thepapertitle}{\textbf{``\@papertitle''}}
\newcommand{\thejournalname}{\textit{\@journalname}}

%----------------------------------------------------------
% HEADER & FOOTER
%----------------------------------------------------------

\newcommand{\footerfont}{\normalfont\sffamily\fontsize{7}{9}\selectfont}

\pagestyle{fancy}
\fancyhf{}

\fancyhead[L]{\ifx\@papertitle\undefined\else\footerfont\@papertitle\fi}
\fancyhead[R]{\ifx\@authorname\undefined\else\footerfont\@authorname\fi}
\fancyfoot[C]{\footerfont\textbf{\thepage\textendash\pageref{LastPage}}}

\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\headrule}{\hbox to\headwidth{\color{rhocolor}\leaders\hrule height \headrulewidth\hfill}}
\renewcommand{\footrulewidth}{0pt}

% 首页样式
\fancypagestyle{firststyle}{
    \fancyhf{}
    \fancyhead[L]{\ifx\@journalname\undefined\else\footerfont\@journalname\fi}
    \fancyhead[C]{\sffamily\fontsize{7}{9}\selectfont\bfseries Response to Reviewers}
    \fancyhead[R]{%
        \footerfont
        \ifx\@manuscriptid\undefined\else\@manuscriptid\ $\cdot$\ \fi
        \textit{\today}
    }
    \fancyfoot[C]{\footerfont\textbf{1\textendash\pageref{LastPage}}}
    \renewcommand{\headrulewidth}{0.4pt}
    \renewcommand{\headrule}{\hbox to\headwidth{\color{rhocolor}\leaders\hrule height \headrulewidth\hfill}}
    \renewcommand{\footrulewidth}{0pt}
}

%----------------------------------------------------------
% SECTION STYLE（用于审稿人分区 + 自动进入目录）
%----------------------------------------------------------

\setcounter{secnumdepth}{0}  % 不显示编号
\setcounter{tocdepth}{1}     % TOC 深度到 section

% section = Reviewer 分区（黑色粗体 + 主题色底线）
\titleformat{\section}[block]
    {\sffamily\Large\bfseries}
    {}
    {0em}
    {#1}
    []

\titlespacing*{\section}{0pt}{1.5em}{0.8em}

% subsection = 隐藏的 TOC 锚点（不渲染任何内容）
\titleformat{\subsection}[block]
    {}
    {}
    {0em}
    {}
    []

\titlespacing*{\subsection}{0pt}{0pt}{0pt}

% TOC 样式
\contentsmargin{2em}

\titlecontents{section}[0em]
    {\addvspace{6pt}\sffamily\bfseries\color{black}}
    {}
    {}
    {\hfill\thecontentspage}
    []

%----------------------------------------------------------
% 标题区
%----------------------------------------------------------

\newcommand{\makeresponsetitle}{
    \thispagestyle{firststyle}
    \begin{center}
        {\bfseries\LARGE Statements and Response to Reviewer's Comments}
        \par\vskip1em
        \ifx\@papertitle\undefined\else
            {\large\@papertitle}
            \par\vskip0.3em
        \fi
    \end{center}
    \vskip1em
}

%----------------------------------------------------------
% 目录
%----------------------------------------------------------

\newcommand{\makeresponsetoc}{
    {\sffamily\bfseries\large Table of Contents}
    \vskip0.3em
    \@starttoc{toc}
    \vskip1.5em
}

%----------------------------------------------------------
% 审稿人分区
% 用法: \reviewer{1}（自动生成 section 并进入 TOC）
%----------------------------------------------------------

\newcounter{reviewernum}
\newcounter{commentnum}[reviewernum]

\newcommand{\reviewer}[1]{%
    \stepcounter{reviewernum}%
    \setcounter{commentnum}{0}%
    \section{Reviewer \protect\#{#1}}%
}

%----------------------------------------------------------
% 审稿意见环境
%----------------------------------------------------------

\newenvironment{reviewercomment}{%
    \stepcounter{commentnum}%
    \vskip0.3em
    {\bfseries\color{commentcolor} Comment \arabic{reviewernum}.\arabic{commentnum}:}\hspace{0.5em}%
    \color{commentcolor}%
    \rmfamily\ignorespaces
}{%
    \color{black}
    \vskip0.3em
}

%----------------------------------------------------------
% 作者回复环境
%----------------------------------------------------------

\newenvironment{authorresponse}{%
    \vskip0.3em
    {\bfseries\color{black} Response:}
    \vskip0.2em
    \color{black}
    \rmfamily
}{%
    \vskip0.8em
}

%----------------------------------------------------------
% 修改段落展示环境
%----------------------------------------------------------

\newenvironment{revisedtext}{%
    \begin{tcolorbox}[
        enhanced, breakable,
        colback=revisedbg,
        colframe=black!20,
        boxrule=0.4pt,
        arc=2pt, outer arc=2pt,
        left=10pt, right=10pt, top=10pt, bottom=8pt,
        title={\small Revised Manuscript Text},
        fonttitle=\bfseries\sffamily,
        coltitle=black,
        attach boxed title to top center={yshift=-\tcboxedtitleheight/2},
        boxed title style={colback=revisedbg, colframe=black!20, boxrule=0.4pt, arc=1.5pt, left=6pt, right=6pt, top=1pt, bottom=1pt}
    ]
    \color{black}
}{%
    \end{tcolorbox}
}

%----------------------------------------------------------
% 辅助命令
%----------------------------------------------------------

% 新增文字标记（红色斜体，自动检测数学/文本模式）
\newcommand{\added}[1]{%
    \ifmmode
        {\color{addedcolor}{#1}}%
    \else
        {\color{addedcolor}\textit{#1}}%
    \fi
}

% 新增文字标记-加粗版（仅用于正文）
\newcommand{\addedtext}[1]{{\color{addedcolor}\textbf{\textit{#1}}}}

% 删除文字标记（红色删除线）
\newcommand{\deleted}[1]{{\color{deletedcolor}\sout{#1}}}

% 高亮标记
\newcommand{\highlight}[1]{{\colorbox{yellow!30}{#1}}}

%----------------------------------------------------------

\endinput
