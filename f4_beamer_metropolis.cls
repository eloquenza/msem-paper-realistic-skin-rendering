\typeout{Beamer class for talks, Style: HsH F4 infused with metropolis <2018-10-31> Dennis Grabowski}
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{f4_beamer_metropolis}[2018-10-31 Beamer HsH F4 infused with metropolis]

% Define packages required to use this class
\RequirePackage{ifthen}
\RequirePackage{etex}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{amsmath}
\RequirePackage{FiraSans}
\RequirePackage{xspace}
\RequirePackage{booktabs}
\RequirePackage{pgfplots}
\RequirePackage{pgfpages}

% Sprachpaket für Deutsch (Umlaute, Trennung,deutsche Überschriften)
\RequirePackage[ngerman, english]{babel}
\RequirePackage{blindtext}
%Graphikeinbindung, Hyperref (alles klickbar, Bookmarks),
%Math. Symbole aus AmsTeX
\RequirePackage{graphicx,amssymb,url,atbegshi,etoolbox}

\RequirePackage[backend=biber,natbib=true, style=numeric, citestyle=reading, maxnames=7, minnames=1, maxcitenames=2, url=true]{biblatex}
% Umlaute und über Tastatur einzugeben
\RequirePackage[utf8]{inputenc}
% add table of contents and other tables automatically
\RequirePackage[nottoc]{tocbibind}
\RequirePackage[toc,page]{appendix}
\RequirePackage{appendixnumberbeamer}

%% json related packages
% dont use bera, can't get it at the work PC
%\RequirePackage{bera} % optional: just to have a nice mono-spaced font
\RequirePackage{listings}
\RequirePackage{textcomp}
\RequirePackage{tabularx}
\RequirePackage{pifont}
\RequirePackage{pdfpages}
\RequirePackage{float}

\RequirePackage{xcolor,colortbl}

\RequirePackage{xr-hyper}

\RequirePackage{multirow}
\RequirePackage{makecell}
\RequirePackage{array, booktabs}
\RequirePackage{tikz}

\RequirePackage[autostyle=true,german=quotes,thresholdtype=words,threshold=20]{csquotes}

\usepgfplotslibrary{dateplot}
%\RequirePackage{url,hyperref}

 \DeclareOption{ngerman}{%
 \PassOptionsToPackage{\CurrentOption}{babel}
 }

 \DeclareOption{english}{%
 \PassOptionsToPackage{\CurrentOption}{babel}
}

\ExecuteOptions{ngerman}
\ProcessOptions

% Load the default beamer class and initialize page size and other options
\LoadClass[german,compress,unknownkeysallowed,10pt]{beamer}

\hypersetup{
    colorlinks,
    linkcolor={hsh-f4-orange},
    citecolor={hsh-f4-orange},
    urlcolor={blue!80!black}
}

% Must be defined here, else the pages go crazy
\RequirePackage{geometry}
% Define page size
\geometry{paperwidth=16cm,paperheight=9cm}

\RequirePackage{contour}

% allow notes to be present
\setbeameroption{show notes on second screen=right}

% Add new command to change size of a hrulefill
\makeatletter
   \def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}
\makeatother
% zero space
\newcommand{\zsp}{\rule{0pt}{0pt}}

\mode<presentation>{%
\hypersetup{pdffitwindow=true,pdfpagelayout=SinglePage,%pdfpagemode=FullScreen,
breaklinks=true,urlcolor=Blue}
\usetheme[subsectionpage=progressbar]{metropolis}
\setbeamercovered{invisible}
\setbeamertemplate{theorems}[numbered]
\setbeamertemplate{captions}[numbered]
 \raggedright
\setbeamertemplate{items}[circle]
\setbeamertemplate{section in toc}[sections numbered]
\setbeamertemplate{subsection in toc}[subsections numbered]
\setbeamertemplate{section in toc shaded}[default][50]
\setbeamertemplate{subsection in toc shaded}[default][30]
%\setbeamertemplate{itemize items}[ball]
% disable the continuation counting
\setbeamertemplate{frametitle continuation}{}
% allow the page frame to be bigger by setting smaller margins
\setbeamersize{text margin left=5mm,text margin right=5mm}

% Define the HsH Wortmarke graphic
\titlegraphic{\vspace*{-0.25cm}\includegraphics[width=0.15\textwidth]{Wortmarke_WI_schwarz.pdf}}

% Define the HsH F4 color
\definecolor{hsh-f4-orange}{rgb}{0.862745098, 0.235294118, 0.019607843}
\setbeamercolor{background canvas}{bg=white}

% define font sizes and colors
\setbeamerfont{title}{size=\huge, series=\bfseries}
\setbeamerfont{section title}{size=\LARGE, series=\bfseries}
\setbeamerfont{subsection title}{size=\Large, series=\bfseries}
\setbeamerfont{standout}{size=\LARGE, series=\bfseries}

\setbeamercolor{alerted text}{%
  fg=hsh-f4-orange
}

\setbeamercolor{frametitle}{bg=hsh-f4-orange}

\let\frametitleformat\MakeUppercase

\newcommand{\frametitlestart}{
  \rule{0pt}{1.3ex +%
    \totalheightof{%
      \ifcsdef{frametitleformat}{\frametitleformat X}{X}%
    }%
  }%
}

\newcommand{\frametitleend}{
  \rule[-1.3ex]{0pt}{1.1pt}
}

\contourlength{0.05em}

\setbeamertemplate{frametitle}{
  \nointerlineskip%
  \begin{beamercolorbox}[%
    wd=\paperwidth,%
    sep=0pt,%
    leftskip=1.3ex,%
    rightskip=1.3ex,%
  ]{frametitle}%
    \frametitlestart
    \contour*{black}{\insertframetitle}
    \nolinebreak%
    \frametitleend
  \end{beamercolorbox}%
}

\newlength{\hshHelferPage}
% Increase the size of the progressbar
\setbeamertemplate{progress bar in section page}{
  \setlength{\hshHelferPage}{%
    \textwidth * \ratio{\insertframenumber pt}{\inserttotalframenumber pt}%
  }%
  \tikzexternaldisable%
  \begin{tikzpicture}%
    \fill[bg] (0,0) rectangle (\textwidth, 0.1);
    \fill[fg] (0,0) rectangle (\hshHelferPage, 0.1);
  \end{tikzpicture}%
  \tikzexternalenable%
}

\setbeamercolor{progress bar in section page}{
  fg=alerted text.fg,
  bg=alerted text.fg!50!black!30
}

% Define the layout of the title page - almost default metropolis
% Added a few vfills and pars to make it look like the normal HsH layout
\setbeamertemplate{title page}{
  \begin{minipage}[b][\paperheight]{\textwidth}
    \ifx\inserttitlegraphic\@empty\else\usebeamertemplate*{title graphic}\par\vfill\vfill\fi
    \ifx\inserttitle\@empty\else\usebeamertemplate*{title}\par\fi
    \ifx\insertsubtitle\@empty\else\usebeamertemplate*{subtitle}\par\fi
    \ifx\beamer@shortauthor\@empty\else\usebeamertemplate*{author}\par\fi
    \ifx\insertdate\@empty\else\usebeamertemplate*{date}\par\fi
    \ifx\insertinstitute\@empty\else\usebeamertemplate*{institute}\par\fi
  \end{minipage}
}

\AtBeginDocument{%
  \begin{frame}[plain, noframenumbering]
    \begin{columns}
        \begin{column}{0.85\linewidth}
            \maketitle
        \end{column}
        \begin{column}{0.15\columnwidth}
            \vspace{1.5cm} \vfill\par
            \includegraphics[width=3cm]{H_WI_TITEL.png}
        \end{column}
    \end{columns}
  \end{frame}
}

\AtBeginSection[]
{
  \begin{frame}<beamer>
    \centering
    \begin{minipage}{22em}
      \raggedright
      \usebeamercolor[fg]{section title}
      \usebeamerfont{section title}
      \tableofcontents[sectionstyle=show/hide,subsectionstyle=hide]\\[-1ex]
      %\insertsectionhead\\[-1ex]
      \usebeamertemplate*{progress bar in section page}
      \par
      \ifx\insertsubsectionhead\@empty\else%
        \usebeamercolor[fg]{subsection title}%
        \usebeamerfont{subsection title}%
        \\[1.5ex]\tableofcontents[sectionstyle=hide,subsectionstyle=show/shaded/hide]
      \fi
    \end{minipage}
    \par
  \vspace{\baselineskip}
  \end{frame}
}

\AtBeginSubsection[]
{
  \begin{frame}<beamer>
    \centering
    \begin{minipage}{22em}
      \raggedright
      \usebeamercolor[fg]{section title}
      \usebeamerfont{section title}
      \tableofcontents[sectionstyle=shaded/hide,subsectionstyle=hide]\\[-1ex]
      %\insertsectionhead
      \usebeamertemplate*{progress bar in section page}
      \par
      \ifx\insertsubsectionhead\@empty\else%
        \usebeamercolor[fg]{subsection title}%
        \usebeamerfont{subsection title}%
        \\[1.5ex]\tableofcontents[sectionstyle=hide,subsectionstyle=show/shaded/hide]
        %\insertsubsectionhead
      \fi
    \end{minipage}
    \par
  \vspace{\baselineskip}
  \end{frame}
}

  % Frame layout
  \pgfdeclareimage[height=1.7cm]{fhh-logo}{H_WI_TITEL.png}
  \logo{\pgfuseimage{fhh-logo}}

\renewcommand{\alert}[1]{{\textcolor{hsh-f4-orange}{#1}}}
  \setbeamertemplate{navigation symbols}{%
    \insertslidenavigationsymbol{}
    \insertframenavigationsymbol{}
    \insertbackfindforwardnavigationsymbol{}%
  }

  \setbeamertemplate{sidebar left}{}
  \setbeamertemplate{footline}{%

  \hspace{0.325cm}%
	\parbox{0.95\textwidth}{{\fontsize{6pt}{8pt}
  \mbox{~}\textcolor{hsh-f4-orange}{\vhrulefill{2pt}\vspace*{0.125cm}}\mbox{}\\
  \vspace*{0.125cm}
  \mbox{~}{\bfseries Hochschule Hannover}, Fak. IV
  \hfill
  \insertshorttitle{}
  \hfill slide \insertframenumber{} of \inserttotalframenumber
	\vspace*{4pt}
	}}
%    \parbox{4cm}{%
      %\insertlogo{}%
%      \vskip2pt%
%    }%
%    \hfill
%    \parbox{4cm}{%
%      \centering\fontsize{6}{8}%
%      \textcolor{lightgray}{\insertshorttitle{}}\\[2pt]
%      \textcolor{lightgray}{\insertshortauthor{} -- \insertdate{}}%
%      \vspace*{2pt}%
%    }
%    \hfill
%    \parbox{4cm}{%
%      \raggedleft\fontsize{6}{8}%
%      \textcolor{lightgray}{\insertlecture{} --  \insertsectionhead{} --
%      \insertframenumber{}}\\ \usebeamertemplate***{navigation symbols}%
%      \vspace*{2pt}%
%    }
    \hspace{0.1cm}\zsp
  }

\setbeamersize{sidebar width right=1.5cm}
 \setbeamertemplate{sidebar right}{~ \vfill \insertlogo \vspace*{10pt}

	~}

\setbeamercolor{structure}{fg=hsh-f4-orange}

\setbeamertemplate{bibliography item}{%
  \ifboolexpr{ test {\ifentrytype{book}} or test {\ifentrytype{mvbook}}
    or test {\ifentrytype{collection}} or test {\ifentrytype{mvcollection}}
    or test {\ifentrytype{reference}} or test {\ifentrytype{mvreference}} }
    {\setbeamertemplate{bibliography item}[book]}
    {\ifentrytype{online}
       {\setbeamertemplate{bibliography item}[online]}
       {\setbeamertemplate{bibliography item}[article]}}%
  \usebeamertemplate{bibliography item}}

\defbibenvironment{bibliography}
  {\list{}
     {\settowidth{\labelwidth}{\usebeamertemplate{bibliography item}}%
      \setlength{\leftmargin}{\labelwidth}%
      \setlength{\labelsep}{\biblabelsep}%
      \addtolength{\leftmargin}{\labelsep}%
      \setlength{\itemsep}{\bibitemsep}%
      \setlength{\parsep}{\bibparsep}}}
  {\endlist}
  {\item}
}
