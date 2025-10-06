% By John Ortiz <john.ortiz@aunar.edu.co>
% Versión 2.0 realesed 19/10/2020
% Se incluyeron las tablas de presupuestos y se añadió la explicación a ciertas secciones
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{aunarAPA}[19/10/2020 v2.0 aunar APA class]
%-------------------------- initial code -----------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
%\LoadClass[a4paper]{report}
% As an alternative to the above could use next line for twosided output
% \LoadClass[letterpaper,twoside,openright]{report}
% \LoadClass[letterpaper,twoside]{report}
\LoadClass[letterpaper]{report}

\RequirePackage{graphicx} % needed for latest frontpage logo
\RequirePackage{ifthen}   % needed for option parsing for logo

\raggedbottom
\newcommand{\submittedtext}{{}}

% Estos macros son usados para declarar los argumentos necesarios para la construcción del titulo y otros preámbulos.
\def\fecha#1{\gdef\@fecha{#1}} % fecha de presentación
\def\yeardef#1{\gdef\@yeardef{#1}} % año de presentación
\def\institucion#1{\gdef\@institucion{#1}} %Universidad
\def\facultad#1{\gdef\@facultad{#1}} % Facultad
\def\programa#1{\gdef\@programa{#1}} % programa
\def\ciudad#1{\gdef\@ciudad{#1}} % programa
\def\grado#1{\gdef\@grado{#1}} % programa
\def\asesortec#1{\gdef\@asesortec{#1}} % programa
\def\asesormet#1{\gdef\@asesormet{#1}} % programa

%
% definición de margenes 
%
\setlength{\topmargin}{-6mm}
\setlength{\headheight}{4mm}
\setlength{\headsep}{2mm}
\setlength{\marginparsep}{0.0mm}
\setlength{\marginparwidth}{0.0cm}
\setlength{\oddsidemargin}{0.0cm}
\setlength{\evensidemargin}{-5.4mm} % si se quiere usar impresión de ambos lados
\setlength{\textheight}{22.86cm}
\setlength{\textwidth}{16.51cm}

% Este macro define un ambiente para las paginas principales(Portada, subportada, agradecimiento, etc) que es una sola columna incluso en documentos con dos columnas.
\newenvironment{alwayssingle}{%
       \@restonecolfalse
       \if@twocolumn\@restonecoltrue\onecolumn
       \else\if@openright\cleardoublepage\else\clearpage\fi
       \fi}%
       {\if@restonecol\twocolumn
       \else\newpage\thispagestyle{empty}\fi\onecolumn}

%%%%% define el formato de la PORTADA
\newcommand{\portada}{
\begin{alwayssingle}
    % \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}    
    \begin{center}
      	{\@title \par}
        % \vspace*{45mm}
        \vfill
        {\@author \par}
        {\vspace*{\fill}
        {\@institucion \par}
        {Facultad de \@facultad \par}
        {\@programa \par} 
        {\@ciudad \par}
        {\@yeardef}}
    \end{center}
\end{alwayssingle}}

%%%%%% define el formato de la subportada
\newcommand{\subportada}{
\begin{alwayssingle}
    % \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{plain}    
    \begin{center}
      	{\@title \par}
        % \vspace*{45mm}
        \vfill
        {\@author \par}
        \vfill
        {Trabajo de grado para optar al titulo de \@grado \par}
        \vfill
        {Asesor Técnico\par \@asesortec \par}
        \vfill
        {Asesor Metodológico\par \@asesormet \par}
        
        {\vspace*{\fill}
        {\@institucion \par}
        {Facultad de \@facultad \par}
        {\@programa \par} 
        {\@ciudad \par}
        {\@yeardef}}
    \end{center}
\end{alwayssingle}}

%%%%%% define el formato de la Nota de aceptación
\newcommand{\aceptacion}{
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{plain}    
    \twocolumn
    \mbox{}  % empty space for first column
    \newpage % start next column
    \begin{center}
      	{Nota de Aceptación\par}
      	\vspace*{5mm}
      	\hrule
      	\vspace*{5mm}
      	\hrule
      	\vspace*{5mm}
      	\hrule
      	\vspace*{5mm}
      	\hrule
      	\vspace*{5mm}
      	\hrule
      	\vspace*{5mm}
      	\hrule
      	\vfill
      	\vspace*{30mm}
      	\hrule
      	{Firma del presidente de jurado}
      	\vspace*{20mm}
      	\hrule
      	{Firma del jurado}
      	\vspace*{20mm}
      	\hrule
      	{Firma del jurado}
      	\vfill
    \end{center}
    \onecolumn
}

% DEDICATION
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedicatoria}
{
\begin{alwayssingle}
    \thispagestyle{plain}
    \vspace{0.5cm}
    % \begin{verse}
    \begin{center}
    \textbf{Dedicatoria}\par
    \vspace{0.5cm}
    % \end{center}
}
{
    \end{center}
    % \end{verse}
\end{alwayssingle}
}

% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{agradecimientos}
{
\begin{alwayssingle} 
    \thispagestyle{plain}
    \begin{center}
        \textbf{Agradecimientos}
    \end{center}
    % \vspace{0.5cm}
    \begin{quote}
}
{
    \end{quote}
\end{alwayssingle}
}

% The acknowledgementslong environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgement itself 
% does not appears in a quote environment so you can get more in.


%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\newenvironment{RAE} 
{
\begin{alwayssingle}
    \setlength{\parindent}{0.5cm}
    \thispagestyle{plain}
    \begin{center}
        {\textbf{RESUMEN ANALÍTICO DE ESTUDIO}}
        
        {\textbf{R.A.E}}
        
        {\textbf{CORPORACIÓN UNIVERSITARIA AUTÓNOMA DE NARIÑO.}}
    \end{center}
}
{
\end{alwayssingle}
}

\newenvironment{Resume} {\begin{alwayssingle} \thispagestyle{plain}
		\begin{center}
			\vspace*{1.5cm}
			{\Large \bfseries  R\'{e}sum\'{e}}
		\end{center}
		\vspace{0.5cm}
		\begin{quote}}
		{\end{quote}\end{alwayssingle}}

\newenvironment{ListPubli} {\begin{alwayssingle} \thispagestyle{plain}
		%\begin{left}
			\vspace*{3cm}
			{\Huge \bfseries  \hspace*{-0.8cm} List of Publications }
		%\end{left}
		\vspace{0.5cm}}
	{\end{alwayssingle}}

%ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

\newenvironment{romanpages}
{\cleardoublepage\setcounter{page}{1}\renewcommand{\thepage}{\roman{page}}}
{\cleardoublepage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}

