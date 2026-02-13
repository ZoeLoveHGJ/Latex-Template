%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --------------------------------------------------------
% Cover Letter Class (Based on Rho)
% LaTeX Class
% Version 2.1.0 (Standardized)
% --------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------
% CLASS CONFIGURATION
%----------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{class/cover_letter}[2026/02/13 Standardized Cover Letter Class v2.1]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper,11pt]{article}

%----------------------------------------------------------
% REQUIRED PACKAGES
%----------------------------------------------------------

\RequirePackage[utf8]{inputenc}
\RequirePackage{geometry}
\RequirePackage[table]{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{ragged2e}
\RequirePackage{enumitem}
\RequirePackage{lastpage}
\RequirePackage{etoolbox}

%----------------------------------------------------------
% 主题色预设 (Theme Color Presets)
% 使用方法：\rhotheme{red} / \rhotheme{purple} / \rhotheme{blue}
%----------------------------------------------------------

\definecolor{rho-red}{HTML}{B00000}           % 学术红
\definecolor{rho-purple}{HTML}{6A1B9A}        % 优雅紫
\definecolor{rho-blue}{HTML}{1565C0}          % 经典蓝

% 默认主题色
\colorlet{rhocolor}{rho-red}

% 主题切换命令
\newcommand{\rhotheme}[1]{%
    \colorlet{rhocolor}{rho-#1}%
}

%----------------------------------------------------------
% PAGE LAYOUT
%----------------------------------------------------------

\geometry{
    left=3cm,
    right=3cm,
    top=3.5cm,
    bottom=3cm,
    headsep=1.2cm
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

\RequirePackage[colorlinks=true, allcolors=rhocolor]{hyperref}

%----------------------------------------------------------
% LETTER COMMANDS（信件命令）
%----------------------------------------------------------

% === 论文信息（定义一次，全局复用）===
% 投稿论文标题
\newcommand{\papertitle}[1]{\def\@papertitle{#1}}
% 目标期刊全称
\newcommand{\journalname}[1]{\def\@journalname{#1}}

% 便捷引用命令：在正文中用 \thepapertitle / \thejournalname 直接调用
\newcommand{\thepapertitle}{\textbf{``\@papertitle''}}
\newcommand{\thejournalname}{\textit{\@journalname}}

% === 发件人信息 (Sender) ===
\newcommand{\sendername}[1]{\def\@sendername{#1}}
\newcommand{\senderaffiliation}[1]{\def\@senderaffiliation{#1}}
\newcommand{\senderaddress}[1]{\def\@senderaddress{#1}}
\newcommand{\senderemail}[1]{\def\@senderemail{#1}}
\newcommand{\senderphone}[1]{\def\@senderphone{#1}}
% 机构 Logo（显示在页眉左侧）
\newcommand{\institutionlogo}[1]{\def\@institutionlogo{#1}}

% === 收件人信息 (Recipient) ===
\newcommand{\recipientname}[1]{\def\@recipientname{#1}}
\newcommand{\recipienttitle}[1]{\def\@recipienttitle{#1}}
\newcommand{\recipientaddress}[1]{\def\@recipientaddress{#1}}

% === 信件内容 (Content) ===
\newcommand{\subject}[1]{\def\@subject{#1}}
\newcommand{\opening}[1]{\def\@opening{#1}}
\newcommand{\closing}[1]{\def\@closing{#1}}

%----------------------------------------------------------
% HEADER & FOOTER
%----------------------------------------------------------

\newcommand{\footerfont}{\normalfont\sffamily\fontsize{7}{9}\selectfont}

\pagestyle{fancy}
\fancyhf{}

% 非首页
\fancyhead[L]{\footerfont\bfseries Cover Letter}
\fancyhead[R]{\ifx\@sendername\undefined\else\footerfont\@sendername\fi}
\fancyfoot[C]{\footerfont\textbf{\thepage\textendash\pageref{LastPage}}}

\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\headrule}{\hbox to\headwidth{\color{rhocolor}\leaders\hrule height \headrulewidth\hfill}}
\renewcommand{\footrulewidth}{0pt}

% 首页样式（左侧显示机构 Logo，中间 Cover Letter，右侧日期）
\fancypagestyle{firstpage}{
    \fancyhf{}
    \fancyhead[L]{%
        \ifx\@institutionlogo\undefined
            \ifx\@sendername\undefined\else\footerfont\textbf{\@sendername}\fi
        \else
            \raisebox{-3pt}{\includegraphics[height=14pt]{\@institutionlogo}}%
        \fi
    }
    \fancyhead[C]{\sffamily\fontsize{7}{9}\selectfont\bfseries Cover Letter}
    \fancyhead[R]{\footerfont\textit{\today}}
    \fancyfoot[C]{\footerfont\textbf{1\textendash\pageref{LastPage}}}
    \renewcommand{\headrulewidth}{0.4pt}
    \renewcommand{\headrule}{\hbox to\headwidth{\color{rhocolor}\leaders\hrule height \headrulewidth\hfill}}
    \renewcommand{\footrulewidth}{0pt}
}

%----------------------------------------------------------
% MAKE HEADER（信头）
%----------------------------------------------------------

\newcommand{\makeheader}{
    \thispagestyle{firstpage}
    
    % 发件人信息块（右对齐，紧凑）
    \begin{flushright}
        \sffamily\small
        {\color{rhocolor}\bfseries\normalsize\@sendername}\\[0.15em]
        \color{black!70}\footnotesize
        \ifx\@senderaffiliation\undefined\else\@senderaffiliation\\[0.1em]\fi
        \ifx\@senderaddress\undefined\else\@senderaddress\\[0.1em]\fi
        \ifx\@senderemail\undefined\else\textcolor{rhocolor}{Email:} \@senderemail\\[0.1em]\fi
        \ifx\@senderphone\undefined\else\textcolor{rhocolor}{Phone:} \@senderphone\fi
    \end{flushright}
    
    \vspace{0.3em}
    
    % 日期
    \color{black}
    \today
    
    \vspace{0.6em}
    
    % 收件人信息块（左对齐）
    {\sffamily
    \ifx\@recipientname\undefined\else{\color{rhocolor}\bfseries\@recipientname}\\[0.15em]\fi
    \ifx\@recipienttitle\undefined\else\color{black!70}\@recipienttitle\\[0.1em]\fi
    \ifx\@journalname\undefined\else{\itshape\@journalname}\\[0.1em]\fi
    \ifx\@recipientaddress\undefined\else\@recipientaddress\fi
    \par}
    
    \vspace{0.6em}
    
    % 主题行（自动使用 \papertitle 和 \journalname）
    \ifx\@subject\undefined
        % 如果没有自定义 subject，自动生成
        \ifx\@papertitle\undefined\else
            {\color{rhocolor}\sffamily\bfseries Re:}
            { Submission of Manuscript \thepapertitle%
            \ifx\@journalname\undefined\else\ to \thejournalname\fi}
            \par
            \vspace{0.3em}
        \fi
    \else
        {\color{rhocolor}\sffamily\bfseries Re:} {\@subject}
        \par
        \vspace{0.3em}
    \fi
    
    % 称呼
    \color{black}
    \rmfamily\mdseries
    \ifx\@opening\undefined Dear Editor,\else\@opening\fi
    
    \vspace{0.3em}
}

%----------------------------------------------------------
% MAKE CLOSING（结束语）
%----------------------------------------------------------

\newcommand{\makeclosing}{
    \vspace{1em}
    
    \ifx\@closing\undefined Sincerely,\else\@closing\fi
    
    \vspace{1.5em}
    
    {\color{rhocolor}\sffamily\bfseries
    \@sendername
    
    \ifx\@senderaffiliation\undefined\else
        \vspace{0.3em}
        \normalfont\normalsize\color{black!70}
        \@senderaffiliation
    \fi
    \par}
}

%----------------------------------------------------------

\endinput
