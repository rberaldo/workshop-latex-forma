%
% galaxia.cls
%
% Workshop de LaTeX do SciELO
%
% Demonstra:
% - Como implementar um arquivo de classe para uma revista científica
% - Separação entre conteúdo e estilo
% - Como criar comandos customizados para metadados
%
% OBS: Esta classe é baseada em https://github.com/RocketshipGames/gapd.cls

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{galaxia}[2017/06/14 Classe da revista Galaxia]

% Não precisamos de opções específicas, portanto passar todas elas para a
% classe article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
% Basear na classe article
\LoadClass[a4paper,twoside,onecolumn]{article}

% Pacotes
\RequirePackage[l2tabu, orthodox]{nag}
\RequirePackage{titling}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[hmargin=2.5cm,vmargin=3cm]{geometry}
\RequirePackage{microtype}
\RequirePackage{sectsty}
\RequirePackage{titling}
\RequirePackage{calc}
\RequirePackage{fancyhdr}
\RequirePackage{indentfirst}
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{ccicons}
\RequirePackage{lastpage}

% Título
\pretitle{%
  \begin{flushright}
  \Huge\bfseries
}
\posttitle{%
  \par
  \end{flushright}
  \vspace{0.5em}
}
\preauthor{%
  \begin{flushright}
  \large
}
\postauthor{%
  \par
  \end{flushright}
}
\date{} % Não teremos uma data no título
\thanksmarkseries{arabic} % \thanks com números e não símbolos

% Seções sem numeração
\setcounter{secnumdepth}{-2}

% Cabeçalhos e rodapés
\fancyhead{} % limpar cabeçalho
\fancyhead[EC]{\scriptsize\bfseries\thetitle}
\fancyhead[OC]{\scriptsize\bfseries\theauthor}
\fancyfoot{} % limpar rodapé
\fancyfoot[LE,RO]{\bfseries\large\thepage}
\fancyfoot[CE,CO]{\scriptsize \emph{Galaxia} (São Paulo, \emph{online}),
ISSN~1982-2553, n.~\@number, \@month., \@year, p.~\@pages.
\url{http://dx.doi.org/\@doi}}
\renewcommand{\headrulewidth}{0.0pt}

% Cabeçalhos para a primeira página
\fancypagestyle{paginaum}{
  \fancyhead{} % limpar cabeçalho
  \fancyhead[CE,CO]{
      \begin{minipage}{1cm}
        \Large
        \ccLogo
        \ccAttribution
      \end{minipage}
      \begin{minipage}{.8\textwidth}
      \tiny\itshape\noindent
      Este é um artigo publicado em acesso aberto (Open Access) sob a licença
      Creative Commons Attribution, que permite uso, distribuição e reprodução
      em qualquer meio, sem restrições desde que o trabalho original seja
      corretamente citado.
      \end{minipage}
  }
}

% Redefinição do ambiente abstract
\renewenvironment{abstract}[2][Palavras-chave] % o ambiente leva um argumento
{ % comandos que são executados no começo
  \newcommand{\keywordsname}{#1}
  \newcommand{\keywords}{#2}
  \noindent\begin{minipage}[t]{\widthof{\abstractname:}+10pt}
  \noindent\abstractname:\end{minipage}
  \begin{minipage}[t]{\textwidth - \widthof{\abstractname:} - 10pt}}
{ % comandos executados ao fim
  \end{minipage}\par\medskip
  \noindent\textbf{\keywordsname}: \keywords\par\bigskip
}

% Metadados
% Inicializa número, mês, ano e DOI
\newcommand{\@number}{?}
\newcommand{\@month}{?}
\newcommand{\@year}{\the\year}
\newcommand{\@doi}{?}

% Definir a edição: \issue{número}{mês(es)}{ano}
\newcommand{\issue}[3]{%
  \renewcommand{\@number}{#1}%
  \renewcommand{\@month}{#2}%
  \renewcommand{\@year}{#3}%
}

% Define as páginas: \pages{primeira}{última}
\newcommand{\@pages}{\thepage--\pageref{LastPage}}
\newcommand{\pages}[2]{%
  \renewcommand{\@pages}{#1--#2}%
  \setcounter{page}{#1}%
}

% Define o DOI
\newcommand{\doi}[1]{\renewcommand{\@doi}{#1}}
