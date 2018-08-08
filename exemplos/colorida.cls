%
% colorida.cls
%
% Workshop de LaTeX do SciELO
%
% Demonstra:
% - Estrutura básica de uma classe
% - Uso de uma classe como base
% - Carregamento de pacotes
% - \newcommand para utilizar opções mais tarde no código
% - \DeclareOption
%

% --- Identificação ---
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{colorida}[2017/06/14 Classe de demonstração para o Workshop de
LaTeX no SciELO]

% --- Declarações preliminares ---

% Basear na classe article
\LoadClass[a4paper]{article}

% Comandos que usaremos mais tarde
\newcommand{\titlecolor}{} % Vazio nesse momento

% Pacotes necessários
\RequirePackage[l2tabu, orthodox]{nag} % Reclama do uso de pacotes obsoletos
\RequirePackage{titling}
\RequirePackage{color}

% --- Opções ---

% Cores do títulos
\DeclareOption{red}{%
  \renewcommand{\titlecolor}{\color{red}}
}
\DeclareOption{green}{%
  \renewcommand{\titlecolor}{\color{green}}
}
\DeclareOption{yellow}{%
  \OptionNotUsed
}
% Passar opções desconhecidas para a classe article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
% O título será vermelho por padrão
\ExecuteOptions{red}
% Processe as opções
\ProcessOptions\relax

% --- Mais declarações ---
\pretitle{%
  \begin{center}
    \titlecolor\bfseries\LARGE
}
\posttitle{%
\end{center}
}
