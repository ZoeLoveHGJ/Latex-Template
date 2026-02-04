%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --------------------------------------------------------
% Rho Cover Letter Class
% LaTeX Class
% Version 1.0.0 (2026/02/04)
% 
% Based on Rho Academic Theme
% --------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------
% 类配置 (Class Configuration)
%----------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rho-class/cover}[2026/02/04 Rho Cover Letter Class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper,11pt]{article}

%----------------------------------------------------------
% 基础宏包 (Required Packages)
%----------------------------------------------------------

\RequirePackage[utf8]{inputenc}
\RequirePackage{geometry}
\RequirePackage{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{tikz}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{ragged2e}

%----------------------------------------------------------
% 页面布局 (Page Layout)
%----------------------------------------------------------

\geometry{
    left=3cm,
    right=3cm,
    top=3.5cm,
    bottom=3cm,
    headsep=1.2cm
}

\setlength{\parindent}{0pt}
\setlength{\parskip}{1em}

%----------------------------------------------------------
% 颜色定义 (Colors - Rho Theme)
%----------------------------------------------------------

\definecolor{rhocolor}{rgb}{0.0,0.25,0.5}  % Academic Navy

%----------------------------------------------------------
% 字体设置 (Fonts)
%----------------------------------------------------------

\RequirePackage[notextcomp]{stix2}
\RequirePackage[scaled]{helvet}
\renewcommand{\ttdefault}{lmtt}

%----------------------------------------------------------
% 超链接样式
%----------------------------------------------------------

\hypersetup{
    colorlinks=true,
    linkcolor=rhocolor,
    urlcolor=rhocolor,
    citecolor=rhocolor
}

%----------------------------------------------------------
% 信件命令定义 (Letter Commands)
%----------------------------------------------------------

% 发件人信息
\newcommand{\sendername}[1]{\def\@sendername{#1}}
\newcommand{\senderaffiliation}[1]{\def\@senderaffiliation{#1}}
\newcommand{\senderaddress}[1]{\def\@senderaddress{#1}}
\newcommand{\senderemail}[1]{\def\@senderemail{#1}}
\newcommand{\senderphone}[1]{\def\@senderphone{#1}}

% 收件人信息
\newcommand{\recipientname}[1]{\def\@recipientname{#1}}
\newcommand{\recipienttitle}[1]{\def\@recipienttitle{#1}}
\newcommand{\recipientjournal}[1]{\def\@recipientjournal{#1}}
\newcommand{\recipientaddress}[1]{\def\@recipientaddress{#1}}

% 信件内容
\newcommand{\subject}[1]{\def\@subject{#1}}
\newcommand{\opening}[1]{\def\@opening{#1}}
\newcommand{\closing}[1]{\def\@closing{#1}}

%----------------------------------------------------------
% 页眉页脚 (Header & Footer)
%----------------------------------------------------------

\pagestyle{fancy}
\fancyhf{}

\fancyhead[L]{
    \color{rhocolor}
    \sffamily\bfseries\small
    Cover Letter
}

\fancyhead[R]{
    \color{rhocolor}
    \sffamily\small
    \ifx\@sendername\undefined\else\@sendername\fi
}

\fancyfoot[C]{
    \color{black!60}
    \sffamily\footnotesize
    \thepage
}

\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\headrule}{{\color{rhocolor}\hrule width\headwidth height\headrulewidth}}
\renewcommand{\footrulewidth}{0pt}

% 首页无页眉
\fancypagestyle{firstpage}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot[C]{
        \color{black!60}
        \sffamily\footnotesize
        \thepage
    }
}

%----------------------------------------------------------
% 信头设计 (Letter Header)
%----------------------------------------------------------

\newcommand{\makeheader}{
    \thispagestyle{firstpage}
    
    % 发件人信息块
    \begin{flushright}
        \color{rhocolor}
        \sffamily
        {\bfseries\large\@sendername}\\[0.3em]
        \normalsize
        \ifx\@senderaffiliation\undefined\else\@senderaffiliation\\[0.2em]\fi
        \ifx\@senderaddress\undefined\else\@senderaddress\\[0.2em]\fi
        \ifx\@senderemail\undefined\else Email: \@senderemail\\[0.2em]\fi
        \ifx\@senderphone\undefined\else Phone: \@senderphone\fi
    \end{flushright}
    
    \vspace{1.5em}
    
    % 日期
    \color{black}
    \today
    
    \vspace{1.5em}
    
    % 收件人信息块
    \color{rhocolor}
    \sffamily
    \ifx\@recipientname\undefined\else{\bfseries\@recipientname}\\[0.2em]\fi
    \ifx\@recipienttitle\undefined\else\@recipienttitle\\[0.2em]\fi
    \ifx\@recipientjournal\undefined\else{\itshape\@recipientjournal}\\[0.2em]\fi
    \ifx\@recipientaddress\undefined\else\@recipientaddress\fi
    
    \vspace{1.5em}
    
    % 主题行
    \ifx\@subject\undefined\else
        \color{rhocolor}
        \sffamily\bfseries
        Subject: \@subject
        \vspace{1em}
    \fi
    
    % 称呼
    \color{black}
    \rmfamily
    \ifx\@opening\undefined Dear Editor,\else\@opening\fi
    
    \vspace{1em}
}

%----------------------------------------------------------
% 结束语 (Closing)
%----------------------------------------------------------

\newcommand{\makeclosing}{
    \vspace{1.5em}
    
    \ifx\@closing\undefined Sincerely,\else\@closing\fi
    
    \vspace{3em}
    
    \color{rhocolor}
    \sffamily\bfseries
    \@sendername
    
    \ifx\@senderaffiliation\undefined\else
        \vspace{0.3em}
        \normalfont\normalsize
        \@senderaffiliation
    \fi
}

%----------------------------------------------------------

\endinput
