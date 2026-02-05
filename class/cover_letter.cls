%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --------------------------------------------------------
% Cover Letter Class (Based on Rho)
% LaTeX Class
% Version 1.0.0 (Standardized)
% --------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------
% CLASS CONFIGURATION
%----------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{class/cover_letter}[2025/02/05 Standardized Cover Letter Class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper,11pt]{article}

%----------------------------------------------------------
% REQUIRED PACKAGES
%----------------------------------------------------------

\RequirePackage[utf8]{inputenc}
\RequirePackage{geometry}
\RequirePackage{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{tikz}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{ragged2e}
\RequirePackage{enumitem}

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
\setlength{\parskip}{1em}

%----------------------------------------------------------
% COLORS
%----------------------------------------------------------

\definecolor{rhocolor}{rgb}{0.0,0.25,0.5}  % Academic Navy

%----------------------------------------------------------
% FONTS
%----------------------------------------------------------

\RequirePackage[notextcomp]{stix2}
\RequirePackage[scaled]{helvet}
\renewcommand{\ttdefault}{lmtt}

%----------------------------------------------------------
% LINKS
%----------------------------------------------------------

\hypersetup{
    colorlinks=true,
    linkcolor=rhocolor,
    urlcolor=rhocolor,
    citecolor=rhocolor
}

%----------------------------------------------------------
% LETTER COMMANDS
%----------------------------------------------------------

% Sender
\newcommand{\sendername}[1]{\def\@sendername{#1}}
\newcommand{\senderaffiliation}[1]{\def\@senderaffiliation{#1}}
\newcommand{\senderaddress}[1]{\def\@senderaddress{#1}}
\newcommand{\senderemail}[1]{\def\@senderemail{#1}}
\newcommand{\senderphone}[1]{\def\@senderphone{#1}}

% Recipient
\newcommand{\recipientname}[1]{\def\@recipientname{#1}}
\newcommand{\recipienttitle}[1]{\def\@recipienttitle{#1}}
\newcommand{\recipientjournal}[1]{\def\@recipientjournal{#1}}
\newcommand{\recipientaddress}[1]{\def\@recipientaddress{#1}}

% Content
\newcommand{\subject}[1]{\def\@subject{#1}}
\newcommand{\opening}[1]{\def\@opening{#1}}
\newcommand{\closing}[1]{\def\@closing{#1}}

%----------------------------------------------------------
% HEADER & FOOTER
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

% First page style
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
% MAKE HEADER
%----------------------------------------------------------

\newcommand{\makeheader}{
    \thispagestyle{firstpage}
    
    % Sender Block
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
    
    % Date
    \color{black}
    \today
    
    \vspace{1.5em}
    
    % Recipient Block
    {\color{rhocolor}
    \sffamily
    \ifx\@recipientname\undefined\else{\bfseries\@recipientname}\\[0.2em]\fi
    \ifx\@recipienttitle\undefined\else\@recipienttitle\\[0.2em]\fi
    \ifx\@recipientjournal\undefined\else{\itshape\@recipientjournal}\\[0.2em]\fi
    \ifx\@recipientaddress\undefined\else\@recipientaddress\fi
    \par}
    
    \vspace{1.5em}
    
    % Subject
    \ifx\@subject\undefined\else
        {\color{rhocolor}
        \sffamily\bfseries
        Subject: \@subject
        \par}
        \vspace{1em}
    \fi
    
    % Opening
    \color{black}
    \rmfamily\mdseries
    \ifx\@opening\undefined Dear Editor,\else\@opening\fi
    
    \vspace{1em}
}

%----------------------------------------------------------
% MAKE CLOSING
%----------------------------------------------------------

\newcommand{\makeclosing}{
    \vspace{1.5em}
    
    \ifx\@closing\undefined Sincerely,\else\@closing\fi
    
    \vspace{3em}
    
    {\color{rhocolor}
    \sffamily\bfseries
    \@sendername
    
    \ifx\@senderaffiliation\undefined\else
        \vspace{0.3em}
        \normalfont\normalsize
        \@senderaffiliation
    \fi
    \par}
}

\endinput
