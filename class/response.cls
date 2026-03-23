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
\RequirePackage{placeins}
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage[normalem]{ulem}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{tcolorbox}
\RequirePackage{adjustbox}
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

% 主题相关功能色（随主题切换）
\definecolor{rho-red-comment}{HTML}{8D1F1F}
\definecolor{rho-purple-comment}{HTML}{5E35B1}
\definecolor{rho-blue-comment}{HTML}{1565C0}

% 固定功能色（不随主题切换）
\definecolor{revisedbg}{HTML}{FFF3E0}         % Revised Text 橙色浅底
\definecolor{revisedaccent}{HTML}{E67E22}     % Revised Text 橙色强调
\definecolor{addedcolor}{HTML}{B00000}        % highlighted in red 始终红色
\definecolor{deletedcolor}{HTML}{8A0000}      % 删除文字固定红色系
\colorlet{commentcolor}{rho-red-comment}      % 审稿意见文字

\newcommand{\rhotheme}[1]{%
    \colorlet{rhocolor}{rho-#1}%
    \ifstrequal{#1}{red}{%
        \colorlet{commentcolor}{rho-red-comment}%
    }{%
        \ifstrequal{#1}{purple}{%
            \colorlet{commentcolor}{rho-purple-comment}%
        }{%
            \ifstrequal{#1}{blue}{%
                \colorlet{commentcolor}{rho-blue-comment}%
            }{}%
        }%
    }%
}

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

% Global paragraph style: keep indentation in body text and avoid overly loose paragraph gaps.
\setlength{\parindent}{2em}
\setlength{\parskip}{0.2em plus 0.05em minus 0.05em}
% Tighter default table column padding to avoid width overflow in dense response tables.
\setlength{\tabcolsep}{4pt}

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
\RequirePackage{indentfirst}

% Keep tabular-based tables within current line width automatically.
\BeforeBeginEnvironment{tabular}{\begin{adjustbox}{max width=\linewidth}}
\AfterEndEnvironment{tabular}{\end{adjustbox}}
\BeforeBeginEnvironment{tabular*}{\begin{adjustbox}{max width=\linewidth}}
\AfterEndEnvironment{tabular*}{\end{adjustbox}}

% In response letters, table captions are unnumbered by default
% to avoid confusion with manuscript table numbering.
\DeclareCaptionLabelFormat{resptable}{\textbf{Table (Response)}}
\captionsetup[table]{
    labelformat=resptable,
    labelsep=colon,
    labelfont=bf,
    textfont=bf,
    font=small,
    justification=centering,
    singlelinecheck=false,
    skip=6pt
}

%----------------------------------------------------------
% 文档信息命令
%----------------------------------------------------------

\newcommand{\papertitle}[1]{\def\@papertitle{#1}}
\newcommand{\journalname}[1]{\def\@journalname{#1}}
\newcommand{\authorname}[1]{\def\@authorname{#1}}
\newcommand{\manuscriptid}[1]{\def\@manuscriptid{#1}}

% 默认值（避免未定义判断和空内容留白问题）
\papertitle{}
\journalname{}
\authorname{}
\manuscriptid{}

\newcommand{\thepapertitle}{\textbf{``\@papertitle''}}
\newcommand{\thejournalname}{\textit{\@journalname}}

%----------------------------------------------------------
% HEADER & FOOTER
%----------------------------------------------------------

\newcommand{\footerfont}{\normalfont\sffamily\fontsize{7}{9}\selectfont}

\pagestyle{fancy}
\fancyhf{}

\fancyhead[L]{\ifstrempty{\@papertitle}{}{\footerfont\@papertitle}}
\fancyhead[R]{\ifstrempty{\@authorname}{}{\footerfont\@authorname}}
\fancyfoot[C]{\footerfont\textbf{\thepage\textendash\pageref{LastPage}}}

\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\headrule}{\hbox to\headwidth{\color{rhocolor}\leaders\hrule height \headrulewidth\hfill}}
\renewcommand{\footrulewidth}{0pt}

% 首页样式
\fancypagestyle{firststyle}{
    \fancyhf{}
    \fancyhead[L]{\ifstrempty{\@journalname}{}{\footerfont\@journalname}}
    \fancyhead[C]{\sffamily\fontsize{7}{9}\selectfont\bfseries Response Letter}
    \fancyhead[R]{%
        \footerfont
        \ifstrempty{\@manuscriptid}{}{\@manuscriptid}
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
    \vspace*{-0.2em}
    {\centering
        {\bfseries\LARGE Statements and Response to Reviewer's Comments\par}
        \ifstrempty{\@papertitle}{}{%
            \par\vskip1em
            {\large\@papertitle\par}
            \vskip0.3em
        }
    }
    \vskip0.35em
    \noindent
}

%----------------------------------------------------------
% 目录
%----------------------------------------------------------

\newcommand{\makeresponsetoc}{
    \par\noindent{\sffamily\bfseries\large Table of Contents\par}
    \vskip0.3em
    \par\noindent\@starttoc{toc}
    \vskip0.5em
    \par\noindent{\color{rhocolor}\rule{\linewidth}{0.4pt}\par}
    \vskip0.8em
    \clearpage
}

%----------------------------------------------------------
% 审稿人分区
% 用法: \reviewer（自动编号并进入 TOC；兼容旧写法 \reviewer{1}）
%----------------------------------------------------------

\newcounter{reviewernum}
\newcounter{commentnum}[reviewernum]
\newcounter{aecommentnum}

% Visual cue before each reviewer section title.
\newcommand{\reviewermarker}{%
    \textcolor{rhocolor}{\raisebox{0.1ex}{\scalebox{0.78}{$\blacktriangledown$}}}%
}

\newcommand{\reviewer@core}{%
    \stepcounter{reviewernum}%
    \setcounter{commentnum}{0}%
    \section[Reviewer \protect\#\arabic{reviewernum}]{%
        \reviewermarker\hspace{0.45em}Reviewer \protect\#\arabic{reviewernum}%
    }%
}

% 支持 \reviewer 与旧写法 \reviewer{1}（参数会被忽略，统一自动编号）
\newcommand{\reviewer}{\@ifnextchar\bgroup\reviewer@witharg\reviewer@noarg}
\newcommand{\reviewer@witharg}[1]{\reviewer@core}
\newcommand{\reviewer@noarg}{\reviewer@core}

% AE comments 分区（不进入 TOC，建议放在目录上方）
\newcommand{\aecomments}{%
    \setcounter{aecommentnum}{0}%
    \section*{AE Comments}%
}

%----------------------------------------------------------
% 审稿意见环境
%----------------------------------------------------------

% Comment status helpers:
%   \commentdone            -> next comment marked as [DONE] (one-shot)
%   \commentpending         -> next comment marked as [PENDING] (one-shot)
%   \commentstatus{done|pending|custom-label}
%   \commentcustom{LABEL}{color-name}
%   \hidecommentstatus      -> hide all status labels globally (including brackets)
%   \showcommentstatus      -> show all status labels globally
\definecolor{statusdone}{HTML}{2E7D32}
\definecolor{statuspending}{HTML}{EF6C00}
\newif\ifcommentstatusvisible
\commentstatusvisibletrue
\newcommand{\hidecommentstatus}{\commentstatusvisiblefalse}
\newcommand{\showcommentstatus}{\commentstatusvisibletrue}
\newcommand{\commentstatuslabel}{}
\newcommand{\commentstatuscolor}{black}
\newcommand{\commentdefaultlabel}{PENDING}
\newcommand{\commentdefaultcolor}{statuspending}
\newcommand{\commentdefaultpending}{%
    \gdef\commentdefaultlabel{PENDING}%
    \gdef\commentdefaultcolor{statuspending}%
}
\newcommand{\commentdefaultnone}{%
    \gdef\commentdefaultlabel{}%
    \gdef\commentdefaultcolor{black}%
}
\newcommand{\commentresetstatus}{%
    \gdef\commentstatuslabel{}%
    \gdef\commentstatuscolor{black}%
}
\newcommand{\commentpending}{%
    \gdef\commentstatuslabel{PENDING}%
    \gdef\commentstatuscolor{statuspending}%
}
\newcommand{\commentdone}{%
    \gdef\commentstatuslabel{DONE}%
    \gdef\commentstatuscolor{statusdone}%
}
\newcommand{\commentcustom}[2]{%
    \gdef\commentstatuslabel{#1}%
    \gdef\commentstatuscolor{#2}%
}
\newcommand{\commentstatus}[1]{%
    \ifstrequal{#1}{done}{\commentdone}{%
        \ifstrequal{#1}{pending}{\commentpending}{%
            \commentcustom{#1}{black}%
        }%
    }%
}
\newcommand{\commentstatusdisplay}{%
    \ifcommentstatusvisible
        \ifstrempty{\commentstatuslabel}{%
            \ifstrempty{\commentdefaultlabel}{}{\textnormal{\textcolor{\commentdefaultcolor}{\space[\commentdefaultlabel]}}}%
        }{%
            \textnormal{\textcolor{\commentstatuscolor}{\space[\commentstatuslabel]}}%
        }%
    \fi
}

\newenvironment{reviewercomment}{%
    \stepcounter{commentnum}%
    \vskip0.3em
    \begin{tcolorbox}[
        enhanced, breakable,
        colback=black!3,
        colframe=black!35,
        boxrule=0pt,
        leftrule=1.2pt,
        arc=2pt, outer arc=2pt,
        left=10pt, right=10pt, top=8pt, bottom=7pt
    ]
    {\sffamily\bfseries\large\color{rhocolor} Reviewer's Comment \arabic{reviewernum}.\arabic{commentnum}\commentstatusdisplay:}\par\vspace{0.35em}%
    \color{black}%
    % Relax line breaking to avoid overfull boxes in long reviewer sentences.
    \setlength{\emergencystretch}{2em}%
    \sloppy%
    \commentresetstatus%
    \itshape\ignorespaces
}{%
    \color{black}
    \fussy
    \end{tcolorbox}
    \vskip0.3em
}

\newenvironment{aecomment}{%
    \stepcounter{aecommentnum}%
    \vskip0.3em
    {\bfseries\color{commentcolor} AE Comment \arabic{aecommentnum}:}\hspace{0.5em}%
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
    \par\noindent{\bfseries\color{green!50!black} \large Author's Response:}\par
    \vskip0.2em
    \begingroup
    \color{black}
    \setlength{\parindent}{2em}%
    \rmfamily
    \ignorespaces
}{%
    \par\endgroup
    \vskip0.8em
}

%----------------------------------------------------------
% 修改段落展示环境
%----------------------------------------------------------

\newenvironment{revisedtext}{%
    \FloatBarrier
    \begin{tcolorbox}[
        enhanced, breakable,
        colback=revisedbg,
        colframe=revisedaccent!70!black,
        boxrule=0.5pt,
        arc=2pt, outer arc=2pt,
        left=10pt, right=10pt, top=10pt, bottom=8pt,
        borderline west={1.6pt}{0pt}{revisedaccent},
        title={\small \textbf{Changes in Manuscript}},
        fonttitle=\bfseries\sffamily,
        coltitle=revisedaccent!90!black,
        attach boxed title to top left={xshift=8pt,yshift=-\tcboxedtitleheight/2},
        boxed title style={colback=white, colframe=revisedaccent!70!black, boxrule=0.5pt, arc=1.5pt, left=6pt, right=6pt, top=1pt, bottom=1pt}
    ]
    \color{black}
}{%
    \end{tcolorbox}
    \FloatBarrier
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
