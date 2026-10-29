% Created by Murat Can Karacabey
% this is inspired by Michael Pollind's Awesome CV
% Modified: ATS-friendly header (visible URLs, headline, location), no small caps in section titles.
\author{Murat Can Karacabey}
\RequirePackage[dvipsnames]{xcolor}
\LoadClass[11pt]{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{muratcan_cv}[2026/10/29 Muratcan CV Class (ATS-friendly)]
\RequirePackage[sfdefault]{noto}
\RequirePackage{etoolbox}
\RequirePackage{pgffor}
\RequirePackage{titlesec}
\RequirePackage{tikz}
\RequirePackage{fontspec}
\RequirePackage[left=0.5in,top=0.3in,right=0.5in,bottom=0.05in]{geometry}
\RequirePackage{hyperref}
\RequirePackage{mfirstuc}
\RequirePackage{ifthen}
\RequirePackage{array}
\pagestyle{empty}

%Setup
\newcommand*{\setname}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\setposition}[1]{\def\@position{#1}}
\newcommand*{\setlocation}[1]{\def\@location{#1}}
\newcommand*{\setmobile}[1]{\def\@mobile{#1}}
\newcommand*{\setmail}[1]{\def\@mail{#1}}
\newcommand*{\setthemecolor}[1]{\def\@themecolor{#1}}
% {full URL}{text shown on the page} -- the shown text is what ATS parsers read
\newcommand*{\setlinkedinaccount}[2]{\def\@linkedinaccount{#1}\def\@linkedintext{#2}}
\newcommand*{\setgithubaccount}[2]{\def\@githubaccount{#1}\def\@githubtext{#2}}
\newcommand*{\setportfolio}[2]{\def\@portfolio{#1}\def\@portfoliotext{#2}}
\def\@position{}\def\@location{}

\hypersetup{
    colorlinks=true,
    urlcolor=NavyBlue,
}

% Header
\newcommand\headerview{
\begin{center}
    \name \\[0.05cm]
    \ifx\@position\@empty\else{\small\bfseries \@position}\\[0.05cm]\fi
    \contact
\end{center}
}

\newcommand{\linkedinview}{\href{\@linkedinaccount}{\footnotesize \@linkedintext}}
\newcommand{\githubview}{\href{\@githubaccount}{\footnotesize \@githubtext}}
\newcommand{\portfolioview}{\href{\@portfolio}{\footnotesize \@portfoliotext}}

\newcommand{\name}{%
    {\LARGE \color{\@themecolor} \@firstname\ifx\@lastname\@empty\else\ \@lastname\fi}
}

\newcommand{\contact}{%
        {\small \ifx\@location\@empty\else\@location\ \cpshalf\fi \@mail\ \cpshalf \@mobile %
        \\%
        \linkedinview\ \cpshalf \githubview\ \cpshalf \portfolioview \\
        }%
}

% Helper commands
% Section titles: real uppercase letters (small caps broke text extraction, e.g. "PROȷETS")
\newcommand\ruleafter[1]{\MakeUppercase{#1}~{\color{black!60!\@themecolor}\hrulefill}}

\newcommand{\cps}{{\color{\@themecolor} \quad\textbar\quad}}
\newcommand{\cpshalf}{{\color{\@themecolor} \textbar\hspace{0.2em}}}
\newcommand{\coloredbullet}{{\color{\@themecolor} \textbullet}}

\titleformat{\section}
  {\large\bfseries\raggedright\color{\@themecolor}}
  {}{0em}
  {\ruleafter}

\titlespacing*{\section}{-1pt}{-10pt}{0pt}

% Textview commands
\newcommand{\datetext}[1]{%
{\itshape  \footnotesize \mdseries  \color{black} #1 }
}

\newcommand{\datetextbold}[1]{%
{\footnotesize \mdseries  \color{black} \textbf{#1} }
}

\newcommand{\datedexperience}[2]{%
  \begin{small} \mbox { \hspace{1em} \textbf{#1} } \end{small} \hfill \datetextbold{#2}\\[0.01cm] %
}

\newcommand{\explanation}[2]{%
    \mbox { \hspace{1.2em} \footnotesize \emph{#1}} \hfill \datetext{#2}\\[0.01cm] %
}

\newcommand{\explanationdetail}[1]{%
    \indent \indent \begin{minipage}{0.87\linewidth} \footnotesize #1 \end{minipage} \\[0.1cm]
}

\newcommand\createskill[2]{%
    \textbf{#1} & #2
}

\newcommand\createskills[1]{%
\explanationdetail{
  \begin{tabular}{rp{13.5cm}}
    \makeatletter
    \@for\thisitem:=#1\do{\thisitem\\[0.1cm]}
    \makeatother
    \end{tabular}
}
}