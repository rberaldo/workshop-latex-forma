# Introdução ao LaTeX

- Conteúdo do curso
- Público-alvo
- Para quem é o LaTeX?
- Quem usa LaTeX?
- Objetivos

## Conteúdo

1. [História e filosofia](#história-e-filosofia)
2. [LaTeX: uma linguagem de marcação](#latex-uma-linguagem-de-marcação)
3. [Exemplo: um artigo](#exemplo-um-artigo)
4. [Comandos do LaTeX](#comandos-do-latex)
5. [Símbolos especiais](#símbolos-especiais)
6. [Preâmbulo do documento](#preâmbulo-do-documento)
7. [O corpo do documento](#o-corpo-do-documento)
8. [Pacotes](#pacotes)
9. [Fontes](#fontes)
10. [Layouts de página](#layouts-de-página)
11. [Posição do texto](#posição-do-texto)
12. [Listas](#listas)
13. [Tabelas e tabulares](#tabelas-e-tabulares)
14. [Imagens](#imagens)
15. [Matemática](#matemática)
16. [A classe `abntex2`](#a-classe-abntex2)
17. [Bibliografias](#bibliografias)
18. [Macros](#macros)
19. [Linguística](#linguística)
20. [Referências](#referências)

## História e filosofia

- Donald Knuth nasceu em Milwaukee, Wisconsin, em 1938.
- Seu pai tinha uma pequena editora, por isso conhecia as tradições da
  tipografia.
- Na Caltech, foi contratado como professor associado. Começou a escrever um
  livro sobre compiladores, mas logo notou que o escopo da obra seria muito
  maior. Planejou um livro de doze capítulos que seria chamado *The Art of
  Computer Programming*.
- 1977: segunda edição do segundo volume do *TAoCP* não agradou Knuth
- ASCII não foi projetado para publicar livros
- Pelos próximos 10 anos, ele trabalha no TeX
- TeX: tau epsilon chi
- [TeXBook](http://www.ctex.org/documents/shredder/src/texbook.pdf)
- Leslie Lamport criou uma série de macros para usar o TeX, conhecidas como
  LaTeX.

## LaTeX: uma linguagem de marcação

Assim como HTML, XML ou Markdown, o LaTeX é uma linguagem de *markup* (marcação
de texto). Em outras palavras, o usuário instrui o computador sobre como o
texto deve ser formatado e o programa segue as instruções. Ao contrário das
linguagens anteriores, o LaTeX é mais *semântico*. Por exemplo, o que os
comandos a seguir devem fazer?

```latex
\tableofcontents
\section{Introdução}
```

Muito embora você talvez nunca tenha visto um comando em LaTeX, fica claro que
o primeiro insere o sumário e o segundo indica o começo da seção “Introdução”.
Logo veremos como esses comandos geram elementos visuais. Como se pode ver, os
arquivos-fonte `.tex` não são textos formatados, mas arquivos em texto plano.
Isso meramente significa que o arquivo contém apenas os 95 caracteres ASCII
imprimíveis (UTF-8 também está se tornando lugar comum).

## Exemplo: um artigo

Para entender como comandos se transformam no produto final, abriremos nosso
primeiro arquivo `.tex`, localizado em [`exemplos/artigo.tex`](exemplos/artigo.tex).

Nesse arquivo, veremos:

- Estrutura e capacidades de um documento LaTeX
- Compilação usando diferentes programas (`lualatex` e `pdflatex`)
- Comandos: `\section, \LaTeX, \tableofcontents, \url`
- Classes: `article`, `minimal` e seu efeito em `\section`
- Erros de compilação
- Arquivos auxiliares e o comando `latexmk -c`

## Comandos do LaTeX

Comandos simples, como `\tableofcontents`, devem estar separados do texto por
espaço em branco. Por exemplo:

```latex
\tableofcontents Embora isso funcione, o próximo exemplo ganha mais pontos por
estilo e ajuda na leitura do código. Por quê?
```

```latex
\tableofcontents
Esse exemplo é melhor, mas como espaço em branco não faz diferença, talvez
valesse a pena colocar mais uma linha entre o parágrafo e o comando.
```

Há, também, comandos que aceitam argumentos, como `\section{Introdução}`.
Argumentos sempre ficam entre `{ chaves }`:

```latex
\section{Introdução}\label{introducao}Este exemplo funciona, mas o código não é
muito legível. O resultado será perfeito, entretanto.
```

### Exemplo

Vamos voltar ao arquivo [`exemplos/artigo.tex`](exemplos/artigo.tex) para
aprender na prática sobre esses comandos.

### Espaço em branco

Em LaTeX, múltiplos espaços em branco (espaços, TABs, novas linhas) são
condensados para apenas *um* espaço em branco. Assim, o exemplo a seguir terá o
mesmo efeito do anterior:

```latex
\section      {Introdução}
        \label{introducao}

        Este exemplo funciona, mas o código não é
muito legível.      O resultado será perfeito, entretanto.
```

#### Exemplo e exercício

Voltemos a [`exemplos/artigo.tex`](exemplos/artigo.tex) para aprender mais
sobre espaços em branco e como usá-lo para tornar o código mais legível.

Agora, vamos a [`exercicios/espaco-branco.tex`](exercicios/espaco-branco.tex) e
resolver o problema proposto nos comentários. Quando o arquivo for compilado a
primeira vez, haverá um problema de hifenização. Por quê?

## Símbolos especiais

### Aspas

Em LaTeX, não usamos as chamadas “aspas burras” (`""`):

```latex
``Devemos abrir aspas com dois acentos graves e fechar com duas aspas
simples.''
```

### Hífen, travessão e a meia-risca

Existe uma diferença entre o hífen, o travessão e a meia-risca:

```latex
Leve um guarda-chuva --- ouvi na rádio que pode chover entre 10h--13h.
```

### Espaços não quebráveis

Às vezes, é necessário que um espaço não se quebre ao fim de uma linha, por
exemplo:

```latex
Às 10~horas de ontem…
Fui à casa do Sr.~Silva…
Veja mais na página~40.
```

### Caracteres reservados

Como veremos no decorrer de nosso curso, os símbolos a seguir estão reservados
para o uso do LaTeX:

```latex
# $ % ^ & _ { } ~ \
```

Devemos escapá-los para que sejam impresso da maneira correta:

```latex
\# \$ \% \^{} \& \_ \{ \} \~{} \textbackslash
```

### Exercício

[`exercicios/caracteres-reservados.tex`](exercicios/caracteres-reservados.tex)
não escapa os símbolos acima. Corrija o problema e compile o arquivo
corretamente.

## Preâmbulo do documento

Voltaremos ao documento [`exemplos/artigo.tex`](exemplos/artigo.tex) novamente,
para aprender mais sobre classes de documento.

Documentos LaTeX são divididos em duas partes: o *preâmbulo* e o documento em
si, que fica entre `\begin{document}` e `\end{document}`. No preâmbulo de
`artigo.tex`, a primeira linha que nos chama a atenção é:

```latex
\documentclass[11pt,a4paper,oneside]{article}
```
Anteriormente discutimos duas classes LaTeX: `article` e `minimal`. A
distribuição vem, no entanto, com mais classes por padrão. Por exemplo:

- `article`: para escrever artigos
- `report`: para escrever relatórios
- `book`: para livros
- `letter`: para redigir cartas
- `memoir`: baseada na classe book, traz vários comandos úteis
- `beamer`: para apresentações de slide

O que são essas palavras entre os dois colchetes? São algumas das opções que a
classe `article` nos oferece. Aqui estão as opções de classe mais comuns:

- `10pt, 11pt, 12pt`
- `a4paper, letterpaper, ...`
- `fleqn`: equações são alinhadas à esquerda ao invés de seres centralizadas.
- `leqno`: a numeração das equações fica à esquerda ao invés da direita.
- `titlepage, notitlepage`
- `twocolumn`
- `twoside, oneside`: arruma as margens para a impressão nos dois lados do
  papel ou apenas um.
- `landscape`: o documento é impresso em formato paisagem.
- `openright, openany`: não funciona com a classe `article`, pois ela não
  fornece o comando `chapter`.
- `draft`: indica problemas de hifenização e justificação imprimindo um pequeno
  quadrado na margem direita. Também suprime a colocação das imagens, colocando
  um quadro em branco em seu lugar. O tempo de compilação é bem menor.

Ressaltamos que as classes padrão (`article`, `report`, `book` e `letter`) não
foram escritas para serem usadas em produção e devem ser ajustadas para
resultados mais profissionais.

Além disso, no preâmbulo também carregamos os *pacotes*, como veremos a seguir.

### Exemplo

Vamos abrir [`exemplos/artigo.tex`](exemplos/artigo.tex) para testar as classes
e opções acima. Veremos também os comandos `\title`, `\author` e `\date`.

## O corpo do documento

Enquanto que o preâmbulo contém a declaração do tipo de documento, carrega os
pacotes e configura algumas opções (como veremos a seguir), o corpo do
documento contém o texto, dividido ou não em partes, capítulos, seções e
parágrafos.

O corpo do documento é delimitado por:

```latex
\begin{document}
…
\end{document}
```

Neste *ambiente* que criamos, podemos estruturar nosso documento usando os
comandos a seguir (os números são a *profundidade* da subdivisão):

- `\part`: -1
- `\chapter`: 0 (apenas `book` e `report`)
- `\section`: 1
- `\subsection`: 2
- `\subsubsection`: 3
- `\paragraph`: 4
- `\subparagraph`: 5

Nenhum dos comandos de secionamento está disponível na classe `letter`.

O valor de *profundidade* é usado internamente pelo LaTeX. Na classe `article`,
por exemplo, o contador `secnumdepth`, que define qual a parte mais profunda a
ser numerada, é configurado para o valor `3`. Ou seja, `\paragraph` e
`\subparagraph` não são numerados. É possível mudar esse comportamento com os
comandos a seguir, que devem ir no preâmbulo:

```latex
\setcounter{secnumdepth}{1}
```
Também é possível controlar o que será incluído no sumário com o comando:

```latex
\setcounter{tocdepth}{2}
```

Alternativamente, os comandos acima possuem uma versão estrelada (`\section*`),
que produz uma versão não numerada e que não aparece no sumário.

Às vezes, o título de uma seção ou capítulo pode ser longo demais para o
sumário. Por isso, é possível usar a seguinte sintaxe para controlar o nome que
aparecerá no sumário:

```latex
\section[Seção muito longa]{Seção muito longa: provavelmente não ficará muito
boa no sumário}
```

Parágrafos são criados deixando uma linha em branca entre eles. Entretanto,
essa linha em branca apenas indica ao LaTeX o começo de um parágrafo novo e
*não significa que uma linha em branco será impressa no documento*. O
espaçamento entre parágrafos é controlado pelo valor de `\parskip`:

```latex
\setlength{\parskip}{1cm} % espaçamento fixo
\setlength{\parskip}{1cm plus4mm minus3mm} % espaçamento variável
```

Finalmente, parágrafos que ocorrem imediatamente após uma subdivisão do
documento não são indentados, por motivos de tradição tipográfica. No entanto,
esse comportamento pode ser modificado carregando o pacote `indentfirst`.

### Exemplo e exercício

Vejamos esses conceitos demonstrados, mais uma vez, em
[`exemplos/artigo.tex`](exemplos/artigo.tex).

De posse desses conhecimentos sobre como documentos LaTeX são estruturados e o
que deve ir no preâmbulo e no corpo do documento, vamos resolver
[`exercicios/meu-artigo.tex`](exercicios/meu-artigo.tex).

## Pacotes

Em alguns exercícios, vimos que a hifenização estava errada. Por padrão, o
LaTeX é configurado para hifenizar de acordo com a língua inglesa. Para
resolver esse problema, devemos carregar nosso primeiro *pacote*.

Existem várias coisas que não são possíveis com o LaTeX básico — ao menos não
trivialmente — mas durante sua vida como usuário desse sistema você descobrirá
dezenas de pacotes muito úteis, que tornam tarefas tediosas e difíceis muito
mais agradáveis de resolver. Para carregar um pacote, usamos a seguinte sintaxe
no *preâmbulo* do nosso arquivo:

```latex
\usepackage[opções]{pacote}
```

Para resolver o problema da localização do nosso arquivo, utilizaremos o pacote
`polyglossia`:

```latex
\usepackage{polyglossia}
  \setdefaultlanguage{brazil}
  \setotherlanguage{english}
```

Algumas das capacidades do `polyglossia` são:

- Ajustar datas de acordo com a língua
- Ajustar convenções tipográficas para a língua escolhida
- Hifenização
- Strings do documento (como em `\today`)

### Exercício

Em [`exercicios/pacotes.tex`](exercicios/pacotes.tex), treinaremos como
carregar pacotes.

### Documentação no CTAN

O [CTAN](https://ctan.org) é o repositório de pacotes e documentação do LaTeX.
Antes de resolver alguma tarefa manualmente, é uma boa ideia conferir se alguém
já não resolveu o problema com um pacote. Além disso, é possível encontrar a
documentação de todos os pacotes lá. Vejamos [a documentação do
`polyglossia`](https://www.ctan.org/pkg/polyglossia), por exemplo.

## Fontes

Antigamente, arquivos LateX compilados usando o programa `pdflatex` não podiam
usar qualquer fonte. Existem catálogos de fontes suportadas por esse programa,
como por exemplo [The LaTeX Font Catalogue](http://www.tug.dk/FontCatalogue/).
Atualmente, no entanto, é possível usar o `lualatex` ou ainda o `xelatex`, que
oferecem suporte aos formatos de fonte mais comuns.

Para isso, devemos carregar o pacote `fontspec`:

```latex
\usepackage{fontspec}
  \setmainfont{Times New Roman}
```

### Itálicos, negritos e outros tipos

Fontes geralmente vêm em famílias que contém diversos tipos: romanas maiúsculas
e minúsculas, itálicos, negritos e versaletes, além dos algorismos de título e
texto. A fonte usada por padrão no LaTeX, chamada de Computer Modern e
projetada pelo próprio Knuth, é bastante completa nesse respeito. Para acessar
esses tipos, temos os comandos a seguir à nossa disposição.

- `\emph{}`: itálico quando em texto romano, romando quando em texto itálico
- `\textbf{}`: negrito
- `\textsc{}`: versaletes (em inglês: *small caps*)
- `\texttt{}`: fonte de teletipo

### Tamanhos

Assim como diferentes tipos carregam diferentes significados, os tamanhos das
fontes também devem revelar alguma intenção semântica, alguma relação entre si:
uma escala.

O LaTeX leva essas questões em consideração automaticamente quando usamos
comandos como `\section`, por exemplo. Nós também podemos acessar esses
tamanhos utilizando os seguintes comandos:

- `\tiny`: 5pt
- `\scriptsize`: 7pt
- `\footnotesize`: 8pt
- `\small`: 9pt
- `\normalsize`: 10pt
- `\large`: 12pt
- `\Large`: 14pt
- `\LARGE`: 17pt
- `\huge`: 20pt
- `\Huge`: 25pt

Tenha em mente que os valores acima valem apenas para as classes quem vem por
padrão no LaTeX e quando o valor de `normalsize` é igual a 10pt. Outras classes
podem trazer outros valores, de acordo com a decisão de seu designer. Além
disso, é importante dizer que o tamanho do ponto no TeX é diferente do tamanho
usado atualmente pela maior parte dos programas. Quando Knuth projetou o
sistema, a editoração digital não era comum e muito menos acessível. Durante a
infância em Milwaukee, Wisconsin, seu pai era dono de uma editora. Assim, Knuth
cresceu dentro da tradição anglo-saxã de tipografia, que define um ponto como
0.35145980 mm. No entanto, com o advento do PostScript da Adobe, o ponto foi
redefinido para 0.3527 mm (1/72 in).

### Selecionar fontes diferentes

Uma das maiores vantagens de utilizar o `fontspec`, como vimos acima, é o fácil
acesso à de seleção de fontes. Antigamente, era necessário carregar um pacote
que implementasse a fonte desejada em MetaFont. Hoje, é possível usar arquivos
`ttf` e `otf`.

Para selecionar uma fonte instalada no sistema nos diretórios padrões, basta
usar o comando:

```latex
\setmainfont{Linux Libertine}
```

Caso você esteja trabalhando com um dos editores online de LaTeX, é possível
fazer o upload das fontes para o serviço e especificar o caminho. Por exemplo:

```latex
\setmainfont{Linux Libertine}[
  Path = fonts/
]
```

Uma funcionalidade muitas vezes ignorada sobre as fontes são as ligaduras. Elas
acontecem em sequências de caracteres que colidem naturalmente e são uma
tradição tipográfica muito antiga, que ganhamos de graça usando o LaTeX.

### Exemplo e exercício

Vejamos o exemplos em
[`exemplos/fontes.tex`](exemplos/fontes.tex)
e depois, vamos resolver
[`exercicios/sonhos-noites-verao.tex`](exercicios/sonhos-noites-verao.tex).

## Layouts de página

Usando a solução do exercício anterior, vamos mudar a opção de classe
`onecolumn` para `twocolumn` e visualizar o efeito dessa mudança no layout da
página. Também carregaremos o pacote `showframe`. As enormes margens parecem
uma perda de papel — e são —, mas existe um motivo por trás delas: quando lemos
uma linha longa demais, perdemos a noção de onde ela havia começado. O tamanho
de linha ideal fica por volta de 66 caracteres, incluindo espaços.  Esse é o
mesmo motivo pelo qual jornais são divididos em diversas colunas. Para resolver
esse problema das margens, existem algumas soluções:

- Dividir o texto em duas colunas (melhor solução)
- Carregar o pacote `fullpage`
- Carregar o pacote `fullpage` com espaçamento grande entre as linhas

Para arrumar o espaçamento entre as linhas, devemos utilizar o pacote
`setspace`. Ele vem com os seguintes comandos:

- `\singlespacing`
- `\onehalfspacing`
- `\doublespacing`

Quando você utilizar o comando `\onehalfspacing`, por exemplo, o documento
seguirá esse espaçamento até que outro espaçamento seja especificado.

Outro fator que influencia o layout da página é seu estilo. O LaTeX vem com
dois comandos, `\pagestyle{}` e `\thispagestyle{}`, que aceitam os seguintes
argumentos:

- `empty`: sem texto no cabeçalho e no rodapé
- `plain`: cabeçalho limpo, mas o número da página aparece centralizado no
  rodapé
- `headings`: rodapé limpo, informações como o nome da seção e número da página
  aparecem no cabeçalho

Mais à frente, veremos como customizar os cabeçalhos e rodapés usando o pacote
`fancyhdr`.

### Exemplo e exercício

Vejamos alguns exemplos em
[`exemplos/layouts-pagina.tex`](exemplos/layouts-pagina.tex).

Em [`exercicios/certificado.tex`](exercicios/certificado.tex), vamos começar a
escrever um certificado de conclusão do workshop. No momento, não vamos nos
preocupar com a posição exata do texto no papel. Algumas ideias de como
implementar:

- Um certificado em modo de paisagem é muito mais convincente.
- Quais seriam os tamanhos dos diferentes textos? Qual a relação hierárquica
  entre eles? Justifique sua decisão.

(A ideia para este exercício foi tirada do livro *LaTeX Tutorials: a Primer*.)

## Posição do texto

Se quisermos que nosso certificado fique mais parecido com um de verdade,
precisamos aprender a colocar nosso texto nas regiões do papel que desejamos.
Por padrão, as caixas de texto em LaTeX são justificadas, mas há outras opções
comuns como textos centralizados, alinhados à esquerda ou à direita.

Para determinar a posição horizontal do texto, precisamos encontrar nosso
primeiro *ambiente.* Na verdade, um dos primeiros construtos que encontramos em
nossa jornada foi o ambiente `document`, delimitado por dois comandos: `\begin`
e `\end`.

O ambiente `center`, com o nome sugere, se encarrega de centralizar texto na
página:

```latex
\begin{center}
  Este texto será centralizado.
\end{center}
```

De maneira similar, os ambiente `flushleft` e `flushright` alinham texto ao
lado esquerdo e direito do papel, respectivamente.

Além disso, é possível controlar o espaço dentro de uma linha com o comando
`\hspace{comprimento}`, por exemplo:

```latex
Essa frase\hspace{2cm} está esticada.
```

Algumas unidades que o LaTeX reconhece são:

- `mm`
- `cm`
- `in`
- `pt`
- `em` (comprimento da letra “m”)
- `ex` (altura da letra “x”)
- `\textheight` e `\textwidth` (altura e comprimento da corpo do texto)
- `\pageheight` e `\pagewidth` (altura e comprimento da página toda)

Ainda é possível utilizar o comando `\hfill`, que preenche todo o espaço
disponível na linha:

```latex
Começo\hfill meio\hfill fim
```

Finalmente, o espaço vertical entre os parágrafos pode ser controlado da mesma
maneira, com os comandos `\vspace{comprimento}` e `\vfill`.

### Exemplo e exercício

Vejamos mais no exemplo
[`exemplos/posicao-texto.tex`](exemplos/posicao-texto.tex).
Depois, vamos resolver
[`exercicios/certificado-posicionado.tex`](exercicios/certificado-posicionado.tex).

## Listas

O LaTeX vem com três ambientes para descrever listas: `itemize`, `enumerate` e
`description`. Eles permitem a criação de listas itemizadas, enumeradas e de
descrição, respectivamente.

```latex
\begin{itemize}
  \item O ambiente \code{itemize} é geralmente usado para listas cuja ordem
  não é importante.
  \item A numeração que listas do tipo \code{enumerate} trazem pode indicar
  os passos necessários para completar uma tarefa, ou sua ordem de
  importância.
  \item A lista do tipo \code{description} é excelente para explicar
  conceitos relacionados. Que oportunidade perdida de usá-la!
\end{itemize}
```

### Exemplo

Esses conceitos são explorados no arquivo
[`exemplos/listas.tex`](exemplos/listas.tex). Veremos como criar listas dentro
de listas e a sintaxe do ambiente `description`.

### O pacote `enumerate`

Uma maneira muito elegante de customizar listas ordenadas é o pacote
[`enumerate`](https://www.ctan.org/pkg/enumerate). Ele adiciona um argumento
adicional ao ambiente de mesmo nome, permitindo customizar a lista facilmente:

```latex
\begin{itemize}[A)]
  \item Tales de Mileto
  \item Pitágoras
  \item Xenófanes
  \item Empédocles
  \item Aristóteles
\end{itemize}
```

### Exercício

Para treinar, resolveremos o exercício
[`exercicios/receita.tex`](exercicios/receita.tex), editando a lista de
ingredientes para uma receita de panqueca. Entretanto, há um problema: os
contadores resetam quando uma lista é terminada. Podemos criar um novo contador
`\newcounter{ingredients}` e, ao fim da primeira lista, salvar o valor de
`enumi` com `\setcounter{ingredients}{\value{enumi}}`. No começo da lista que
queremos continuar, podemos usar o comando
`\setcounter{enumi}{\value{ingredients}}`.

## Tabelas e tabulares

Tabelas são difíceis de escrever em qualquer tipo de editor de texto e, embora
o LaTeX tenha ferramentas para lidar com esse tipo de construto textual, não
devemos tentar imitar a abordagem de programas WYSIWYG.

No LaTeX, assim como na tradição tipográfica, há uma distinção entre uma tabela
“formal” (`table`), que é legendada e numerada e uma tabulação “informal”
(`tabular`), que é apenas uma disposição de texto alinhado em linhas e colunas.
Por exemplo:

```latex
\begin{tabular}{lcr}
1 & 2 & 3\\
4 & 5 & 6\\
7 & 8 & 9
\end{tabular}
```

O ambiente `tabular` não deve ser encarado simplesmente como uma maneira de
fazer tabelas, mas primeiramente de alinhar textos na horizontal e na vertical.
Sua sintaxe é `\begin{tabular}{alinhamentos}`. Os valores de alinhamento
básicos são `c` (centro), `l` (esquerda) e `r` (direita). É possível, também,
especificar linhas verticais com `|` e parágrafos com tamanhos definidos com
`p{comprimento}` (alinhado ao topo), `m{comprimento}` (alinhado no meio) e
`b{comprimento}` (alinhado em baixo).

Linhas horizontais podem ser especificadas com `\hline`:

```latex
\begin{tabular}{l|c|r}
\hline
1 & 2 & 3\\
4 & 5 & 6\\
7 & 8 & 9\\
\hline
\end{tabular}
```

Linhas, sejam elas horizontais ou verticais, devem ser usadas com moderação. O
objetivo da tabela é passar informação, portanto o texto deve ser o enfoque
central. É melhor deixar que a informação respire, do que cercá-la. Nas
palavras de Robert Bringhurst, em *Elementos do Estilo Tipográfico:*

> Assim como o texto, as tabelas ficam canhestras quando abordadas de forma
> puramente técnica. Boas soluções tipográficas não costumam surgir em resposta
> a perguntas do tipo “Como posso enfiar essa quantidade de caracteres naquele
> tanto de espaço?”. (p. 81)

### Exemplo

Veremos alguns exemplos de tabelas empregando essas ideias em
[`exemplos/tabelas.tex`](exemplos/tabelas.tex):

- A sintaxe do ambiente `tabular`
- Como fazer tabelas que respiram e dão ênfase ao conteúdo
- Quebras de linhas em tabelas
- O pacote [`booktabs`](https://www.ctan.org/pkg/booktabs)
- O comando `\multicolumn`
- O pacote [`longtable`](https://www.ctan.org/pkg/longtable) e o comando `\endhead`; existem outros comandos que não exploraremos aqui

### Flutuando com `table`

Até agora, temos colocado nossas tabelas em meio ao texto usando o ambiente
`tabular`. É muito comum, no entanto, colocar tabelas em páginas dedicadas,
para que não atrapalhem o fluxo do texto. O LaTeX é capaz de fazer isso usando
uma abstração conhecida como *float*.

Em LaTeX, os dois ambientes do tipo float mais comuns são `table` e `figure`:

```latex
\begin{table}[posição]
  …
\end{table}
```

As posições possíveis são:

- `h`: aqui (here)
- `t`: topo da página
- `b`: base da página
- `p`: página dedicada a floats
- `!`: sobrescreva as restrições de float

O padrão é `tbp`.

Nossa primeira tabela poderia ser reescrita desta maneira:

```latex
\begin{table}
  \centering
  \begin{tabular}{lcr}
  1 & 2 & 3\\
  4 & 5 & 6\\
  7 & 8 & 9
  \end{tabular}
  \caption{Números de 1 a 9}
  \label{tab:numerosUmNove}
\end{table}
```

Três comandos a notar: `\centering` pode ser usado ao invés do ambiente
`center`, pois seu escopo estará limitado; `caption{legenda}` pode ser usado
para adicionar uma legenda à tabela e `\label{referencia}` permite que
referenciemos a tabela usando `\ref{referencia}`.

### Exemplo e exercício

Vamos voltar à [`exemplos/tabelas.tex`](exemplos/tabelas.tex) e testar o
ambiente `table`. Então, resolver
[`exercicios/robos.tex`](exercicios/robos.tex).

### Ferramentas para tabelas

As tabelas que discutimos durante esta introdução não precisaram de muito
espaço horizontal. No entanto, há ocasiões nas quais desejamos escrever uma
tabela com tamanho dinâmico e que tome a página toda. Para isso, existe o
pacote [`tabularx`](https://www.ctan.org/pkg/tabularx), que define um novo
ambiente que aceita o alinhamento `X`, que é flexível.

Como em tudo em LaTeX, quantidade de pacotes e detalhes que podemos discutir é
grande demais para este pequeno workshop. Deixo aqui alguns links úteis:

- [Tutorial do Wikibooks](https://en.wikibooks.org/wiki/LaTeX/Tables), do qual tiramos muitas ideias
- [Descrição de vários pacotes para tabelas, seus usos e conflitos](http://tex.stackexchange.com/q/12672)
- [Lista de ferramentas para ajudar a criação de tabelas](http://tex.stackexchange.com/q/49414)
- [Table Generator](http://www.tablesgenerator.com/)
- [Table Editor](http://truben.no/table/)

## Imagens

É possível importar gráficos em formatos como `png` e `jpg` usando o pacote
`graphicx`. O pacote inclui uma série de comandos para redimensionar e
rotacionar textos e gráficos, bem como o comando `\includegraphics`.

```latex
\includegraphics[opções]{imagem}
```

O comando aceita uma série de opções. Durante este curso, veremos:

- `width` e `height`: para controlar o comprimento e altura da imagem. Aceita
  valores como `\textwidth` e `\pageheight`
- `keepaspectratio`: um valor booleano (`true` ou `false`)
- `scale`: por exemplo, o valor de 0.5 reduz a imagem pela metade

Geralmente, usamos o ambiente `figure`, um float como o `table`:

```latex
\begin{figure}
  \centering
  \includegraphics{imagem}
  \caption{Uma imagem de exemplo}
  \label{fig:imagem}
\end{figure}
```

### Exemplo e exercício

Demonstraremos esses conceitos no arquivo
[`exemplos/imagens.tex`](exemplos/imagens.tex). Vamos aprender a colocar duas
imagens lado-a-lado com o ambiente `minipage`. É importante mencionar que, em
alguns casos, é necessário rodar o comando `lualatex` mais de uma vez para que
o documento compile corretamente. Como vimos anteriormente, documentos são
compilados em apenas uma passada, geralmente gerando arquivos como `aux`, `log`
etc. Eles precisam ser lidos para que referências e bibliografias apareçam
corretamente.  Nesses casos, podemos usar o comando `latexmk --lualatex`.

Para treinar o que aprendemos, copiar a solução do exercício anterior para
[`exercicios/ilustrado.tex`](exercicios/ilustrado.tex). Adicionar uma imagem de
sua escolha para ilustrar a tabela.

## Matemática

Uma das principais vocações do LaTeX é a matemática. Até agora, temos
trabalhado no chamado “modo de texto”. No “modo de matemática”, a maneira como
o LaTeX compreende o que estamos digitando muda consideravelmente. Por exemplo,
letras comuns são tratadas como variáveis, que são sempre escritas em itálico.

O modo de matemática vem em dois sabores: *inline* e *displayed*. O primeiro é
útil quando queremos falar sobre várias variáveis em uma mesma linha. O segundo
cria um novo parágrafo. Os comandos para acessar esses modos são:

- Inline: `\begin{math} … \end{math}` ou `\( … \)`
- Displayed: `\begin{displaymath} … \end{displaymath}` ou `\[ … \]`
- Displayed com equações numeradas: `\begin{equation} … \end{equation}`

(Nota: alguns livros e materiais ensinam o uso de `$ … $` para o modo
matemático inline e `$$ … $$` para o modo matemático displayed. Essa sintaxe
pertence ao TeX e foi depreciada no LaTeX. Para mais informações, [veja este
tópico sobre melhores práticas no
StackExchange](https://tex.stackexchange.com/q/510/4541).)

Há uma infinidade de comandos para descrever matemática, portanto não seria
possível ver todos eles nesse workshop. Porém, vamos explorar rapidamente os
principais conceitos que devem deixar a vida de quem quer aprender muito mais fácil.

Para uma lista relativamente completa, recomendamos o [artigo sobre LaTeX na
Wikibooks](https://en.wikibooks.org/wiki/LaTeX/Mathematics).

### Símbolos

Em nossos teclados, há vários símbolos usados na notação matemática. Por
exemplo:

```latex
+ - = ! / ( ) [ ] < > | ' :
```

No modo de matemática, o LaTeX os trata da maneira correta. Para outros
símbolos que não estão em nosso teclado, existem comandos:

```latex
2 \times 2 = 4
```

### Alfabeto grego

Há comandos fáceis de lembrar para acessar letras gregas:

```latex
\alpha, \beta, \pi
```

### Operadores

Funções trigonométricas, logaritmos e exponenciais, limites, módulo etc. são
alguns dos operadores que já estão definidos por padrão.

```latex
\cos (2\theta) = \cos^2 \theta - \sin^2 \theta

\log xy = \log x + \log y
```

A Cifra de César funciona da seguinte maneira:

```latex
E_n(x) = (x + n) \bmod 26
```

### Potências e subscritos

Potências são representadas com acentos circunflexos, `2^8`. Subscritos são
representados com underlines, `a_b`. Como em muitos outros casos no modo de
matemática, é possível agrupar valores usando chaves `{}`: `2^{32}`.

```latex
f(n) = 4n + n^2
```

### Frações

O comando `\frac{numerador}{denominador}` cria frações:

```latex
F = G \frac{m_1 m_2}{d^2}
```

É possível colocar frações dentro de frações:

```latex
\frac{\frac{1}{x}+\frac{1}{y}}{y-z}
```

### Raízes

O comando `\sqrt{n}` permite escrever raízes:

```latex
\sqrt{10^2} = 10

\sqrt[3]{\frac{a}{b}}
```

### Exemplo e exercício

Vejamos exemplos em [`exemplos/matematica.tex`](exemplos/matematica.tex).
Depois, vamos resolver [`exercicios/equacao.tex`](exercicios/equacao.tex).

## A classe `abntex2`

A descrição oficial do [abnTeX2](http://www.abntex.net.br/) segue abaixo:

> O abnTeX2, evolução do abnTeX (ABsurd Norms for TeX), é uma suíte para LaTeX
> que atende os requisitos das normas da ABNT (Associação Brasileira de Normas
> Técnicas) para elaboração de documentos técnicos e científicos brasileiros,
> como artigos científicos, relatórios técnicos, trabalhos acadêmicos como
> teses, dissertações, projetos de pesquisa e outros documentos do gênero.
>
> A suíte abnTeX2 é composta por uma classe, por pacotes de citação e de
> formatação de estilos bibliográficos, por exemplos, modelos de documentos e
> por uma ampla documentação.

Para utilizar o abnTeX2, devemos utilizar a classe `abntex2`:
`\documentclass{abntex2}`. A classe implementa uma série de comandos e
ambientes novos, como por exemplo:

- `\titulo`
- `\autor`
- `\orientador`
- `\instituicao`
- `\imprimircapa`
- `citacao` (ambiente)
- `resumo` (ambiente)

…entre outros. Não faremos um exercício de abnTeX2, porém vamos explorar a
anatomia de uma monografia ficcional. Veja o [manual](http://repositorios.cpai.unb.br/
ctan/macros/latex/contrib/abntex2/doc/abntex2.pdf) para mais informações sobre
a organização do arquivo.

### Exemplo

Estudaremos [`exemplos/abntex2/trabalho-normatizado.tex`](exemplos/abntex2/trabalho-normatizado.tex).

### Classes úteis para alunos da Unicamp

No site da Pró-reitoria de Pós-Graduação da Unicamp, encontramos mais
informações sobre o [formato padrão das dissertações e
teses](http://www2.prpg.gr.unicamp.br/prpg/?page_id=741) defendidas na
universidade. Infelizmente, no momento não existe uma implementação de classe
LaTeX ideal para todos os alunos da Unicamp. Veja abaixo uma lista de templates
que podem ajudar, porém deverão ser adaptados pelo usuário:

- [Modelo de tese do IMECC](https://github.com/lpoo/modelo_tese_imecc), desatualizado em relação à última versão da norma, CCPG/001/2015
- [Mais dois modelos desatualizados no site da FEEC](https://www0.fee.unicamp.br/cpg/Modelos.html)
- [Modelo específico para o Instituto de Computação](https://www.ic.unicamp.br/ensino/pg/info/estilomonografia), atualizado porém não é facilmente customizável

## Bibliografias

Bibliografias em LaTeX não são tão complicadas quanto parecem. A ideia é a
seguinte: no diretório do texto, há um arquivo `bib` que contém uma entrada
bibliográfica. Por exemplo:

```bibtex
@article{greenwade93,
  author  = "George D. Greenwade",
  title   = "The {C}omprehensive {T}ex {A}rchive {N}etwork ({CTAN})",
  year    = "1993",
  journal = "TUGBoat",
  volume  = "14",
  number  = "3",
  pages   = "342--351"
}
```

No arquivo principal, no local em que desejamos incluir a bibliografia, usamos
o comando `\bibliography{arquivo}`. No decorrer do texto, podemos utilizar os
comandos `\cite[p.~20]{greenwade93}` e `\citeonline` para fazer referência à
entrada bibliográfica desejada. Um arquivo `bst` fica responsável pelo estilo
correto da citação e da bibliografia. O pacote `abntex2cite`, por exemplo,
implementa um estilo `bst` que corresponde ao estilo de citações da ABNT.

### Exemplo

Vejamos o arquivo [`exemplos/abntex2/trabalho-normatizado.tex`](exemplos/abntex2/trabalho-normatizado.tex).

## Macros

Uma das maiores vantagens do LaTeX em relação aos outros editores de texto é a
sua extensibilidade. É possível adicionar funcionalidades ao sistema por meio
de *macros*. O próprio LaTeX não passa de um conjunto (bastante complexo) de
macros do TeX.

Essas macros são programas que automatizam certas funções e permitem que o
autor foque em escrever, ao invés de realizar tarefas tediosas repetidamente.

### Macros de substituição

O tipo mais simples de macro é o de substituição:

```latex
\newcommand{\forma}{ForMA}
```

Declarações do tipo `\newcommand` devem ficar no preâmbulo do documento. Após
declarar o comando anterior, podemos usar `\forma` por todo o documento com a
garantia de que o texto nunca terá erros de digitação.

Ao utilizar esta macro, é necessário incluir um espaço antes do resto do texto,
ou o espaço em branco será engolido: `\forma{} texto`. Isso ocorre, pois o
LaTeX está esperando um argumento. No entanto, é possível carregar o pacote
`xspace`, que adiciona esse espaço de maneira automática:

```latex
\usepackage{xspace}
\newcommand{\forma}{ForMA\xspace}
```

### Macros com argumentos

Já encontramos muitos comandos que levam argumentos, como por exemplo
`\textbf{}`. Digamos, por exemplo, que nosso texto é repleto de palavras em
inglês, que desejamos diferenciar do resto do texto usando itálico (ou romanas,
quando o texto ao redor for itálico) e, além disso, garantir que serão
hifenizadas de acordo com as regras da língua inglesa, quando ocorrerem ao fim
de uma linha. Podemos declarar um comando `\eng{}` facilmente, da seguinte
maneira:

```latex
\newcommand{\eng}[1]{%
  \emph{\textenglish{#1}}%
}
```

Onde `1` indica a quantidade de argumentos que nosso comando irá receber e `#1`
será substituído pelo argumento provido pelo usuário:

```latex
Texto em português \eng{with some English text that will be hypenated
correctly} caso o texto quebre naquela parte.
```

### Novos ambientes

Também é possível definir novos ambientes em LaTeX. A sintaxe é:

```latex
\newenvironment{nome}[num]{antes}{depois}
```

Por exemplo, o ambiente a seguir deixa o texto em itálico:

```latex
\newenvironment{italics}{\itshape}{}
```

### Exemplo e exercício

Temos exemplos no arquivo [`exemplos/macros.tex`](exemplos/macros.tex). A
seguir, resolver o exercício [`exercicios/automatizando.tex`](exercicios/automatizando.tex).

## Linguística

O LaTeX traz uma série de pacotes que ajudam em tarefas de tipografia comuns
para linguistas. Veremos abaixo como escrever transcrições fonéticas com o IPA
de maneira fácil; como inserir árvores sintáticas que não são imagens e por
isso não perdem resolução ao serem impressas; e como inserir exemplos, glosas e
fazer referências a esses elementos no texto.

### Transcrições fonéticas com o `tipa`

O [`tipa`](https://ctan.org/pkg/tipa) permite que você escreva usando o
Alfabeto Fonético Internacional (IPA) sem ter que procurar e inserir símbolos a
partir de uma lista. Tudo o que for escrito dentro do comando `\textipa{}` será
convertido automaticamente, seguindo uma tabela de referência intuitiva. Por
exemplo, para produzir [lĩŋ.ˈgʷis.tɐs], basta digitar:

```latex
\textipa{l\~\i N.\textprimstress g\super wis.t5s}

```

Alguns exemplos de vogais orais:

```latex
\textipa{[i e E a O o u]}
\textipa{[I U 5]}
```

E vogais nasais:

```latex
\textipa{\~o}
\textipa{\~\textschwa}
\textipa{\~5}
```

E também algumas vogais do português brasileiro:

```latex
\textipa{S}
\textipa{Z}
\textipa{L}
\textipa{\textltailn}
\textipa{N}
\textipa{\textfishhookr}
\textipa{\textturnr}
\textipa{\t{tS}}
\textipa{\t{dZ}}
```

Ainda é possível inserir diagramas de vogais de maneira bastante simples,
usando o pacote `vowel`:

```latex
\begin{vowel}
\putcvowel[l]{i}{1}
\putcvowel[r]{y}{1}
\putcvowel[l]{e}{2}
\putcvowel[r]{\o}{2}
...
\putcvowel{\textsci\ \textscy}{13}
\putcvowel{\textupsilon}{14}
\putcvowel{\textturna}{15}
\putcvowel{\ae}{16}
\end{vowel}
```

Veja a tabela de referência [exemplos/tipachart.pdf](exemplos/tipachart.pdf)
para aprender como acessar todos os símbolos do IPA.

### Exemplo e exercício

Temos exemplos no arquivo [`exemplos/linguistica.tex`](exemplos/linguistica.tex). A
seguir, resolver o exercício [`exercicios/transcricao.tex`](exercicios/transcricao.tex).

### Árvores sintáticas com o `forest`

Existem muitos pacotes para a inserção de árvores sintáticas no LaTeX, mas
provavelmente o melhor e mais poderoso é o
[`forest`](https://ctan.org/pkg/forest). Para inserir uma árvore, basta iniciar
o ambiente `forest` e inserir uma sentença com os constituintes delimitados por
chaves. Ela será convertida automaticamente para uma árvore.

```latex
\begin{forest}
  [CP [C] [IP [I] [VP [V] [NP] ] ] ]
\end{forest}
```

Por motivos de legibilidade do código, devemos pular linhas e indentar os
constituintes que estão em níveis mais baixos da árvore (`␣` representa um
espaço em branco):

```latex
\begin{forest}
␣␣[CP
␣␣␣␣[C]
␣␣␣␣␣␣[IP
␣␣␣␣␣␣␣␣[I]
␣␣␣␣␣␣␣␣[VP
␣␣␣␣␣␣␣␣␣␣[V]
␣␣␣␣␣␣␣␣␣␣[NP]
␣␣␣␣␣␣␣␣]
␣␣␣␣␣␣]
␣␣]
\end{forest}
```

A árvore a seguir é um exemplo com todos os nós rotulados e com os nós
terminais precedidos de linhas. Note como os nós terminais estão marcados como
constituintes dentro de outros constituintes, por exemplo em `[DP [O menino]]`.
Note, ainda, que `$_i$` significa que estamos entrando no modo de matemática
(`$…$`) e inserindo um _i_ subscrito (`_i`):

```latex
\begin{forest}
  [IP
    [DP [O menino$_i$]]
    [I$'$
      [I [chegou$_j$]]
      [VP
      [V$'$
        [V [t$_j$]]
        [DP [t$_i$]]
      ]
      ]
    ]
  ]
\end{forest}
```

É bastante usual omitirmos as linhas que levam aos nós terminais, pois algumas
pessoas as consideram redundantes. Isso é possível usando uma sintaxe
ligeiramente diferente. Note que, agora, há uma quebra de linha e apenas um
constituinte em `[DP\\ O menino]`, por exemplo:

```latex
\begin{forest}
  [IP
    [DP\\ O menino$_i$]
    [I$'$
      [I\\ chegou$_j$]
      [VP
        [V$'$
          [V\\ t$_j$]
          [DP\\ t$_i$]
        ]
      ]
    ]
  ]
\end{forest}
```

O pacote `forest` é baseado no
[PGF/TikZ](https://en.wikipedia.org/wiki/PGF/TikZ), um conjunto de poderosas
bibliotecas gráficas para o LaTeX. Como consequência, as árvores aceitam uma
série de customizações que não discutiremos no momento. Porém, vejamos um
exemplo para ilustrar o que se pode esperar encontrar no manual do `forest`. A
árvore a seguir não tem todos os nós rotulados e isso causa um comportamento
estranho quando a árvore é disposta na página. No entanto, podemos usar a opção
`for tree = nice empty nodes` para remediar a situação:

```latex
\begin{forest}
  for tree=nice empty nodes
  [
    [
      [a]
      [menina]
    ]
    [
      [comeu]
        [
          [o]
          [bolo]
        ]
    ]
  ]
\end{forest}
```

Essa opção, porque se encontra dentro do ambiente `forest`, irá se aplicar
somente para a árvore em questão. Veja o manual do pacote para mais opções.

Às vezes, desejamos omitir informações irrelevantes em alguma árvore.
Explicitamos nossa decisão desenhando um triângulo sobre o constituinte que não
foi esmiuçado. Para isso, usamos a opção `roof`, que se aplica a um
constituinte em nossa árvore. Veja no exemplo a seguir, onde o constituinte
_chutada pelo menino_ está simplificado:

```latex
\begin{forest}
  [IP
    [DP\\ a bola]
    [I$'$
      [I\\ foi]
      [VP
        [V$'$
          [V]
          [PartP [chutada pelo\\ menino, roof]]
        ]
      ]
    ]
  ]
\end{forest}
```

### Exemplo e exercício

Temos exemplos no arquivo [`exemplos/linguistica.tex`](exemplos/linguistica.tex). A
seguir, resolver o exercício [`exercicios/arvores.tex`](exercicios/arvores.tex).

### Exemplos numerados e glosas com o `linguex`

Outra tarefa especialmente comum para o linguista é apresentar seus dados em
formato de exemplos de sentenças, que são numeradas à esquerda. Não existe uma
implementação perfeita em LaTeX para isso, pois cada uma tem suas vantagens e
defeitos. O [`linguex`](https://ctan.org/pkg/linguex) é um desses pacotes com
suporte a exemplos e glosas. Você pode aprender sobre outros pacotes para
linguistas nesse [artigo da WikiBooks](https://en.wikibooks.org/wiki/LaTeX/Linguistics),
caso o `linguex` não tenha as funcionalidades de que precisa.

Escolhemos o `linguex` pois sua sintaxe é relativamente simples e poderosa.
Vejamos alguns exemplos básicos:

```latex
\ex. Chegou o menino.

\ex. Chegou a carta.

\ex.* A chegou carta.

```

Sempre deixe uma linha em branco para indicar o fim de um exemplo. É possível
mostrar também subexemplos:

```latex
\ex.
  \a. Chegou o menino.
  \b. O menino chegou.

```

Novamente, certifique-se de colocar uma linha em branco ao fim dos exemplos.

Também é possível escrever glosas usando o comando `\exg.`. As palavras serão
alinhadas automaticamente:

```latex
\exg.
  Gila abur-u-n ferma hamišaluǧ güǧüna amuq’-da-č.\\
  now they-OBL-GEN farm forever behind stay-FUT-NEG\\
  ``Now their farm will not stay behind forever.''

```

#### Referências cruzadas

Já vimos que os comandos `\label` e `\ref` permitem criar referências que são
automaticamente numeradas e atualizadas pelo LaTeX. Esses comandos também
funcionam nos exemplos e glosas do `linguex`:


```latex
  \ex.\label{ex:gram} Chegou o menino.

  \ex.*\label{ex:agram} A chegou carta.

  Em~\ref{ex:gram}, temos uma sentença bem formada, ao contrário
  de~\ref{ex:agram}, que é uma sentença agramatical.
```

### Exemplo e exercício

Temos exemplos no arquivo [`exemplos/linguistica.tex`](exemplos/linguistica.tex). A
seguir, resolver o exercício [`exercicios/exemplos-glosas.tex`](exercicios/exemplos-glosas.tex).

## Referências

- [Sobre a tipografia do *TAoCP* antes do TeX](https://www.reddit.com/r/compsci/comments/2ksmde/what_did_the_art_of_computer_programming_look/)
- [Guia do Wikibooks](https://en.wikibooks.org/wiki/LaTeX)
- [LaTeX Tutorials: a Primer](https://www.tug.org/twg/mactex/tutorials/ltxprimer-1.0.pdf)
- *Elementos do Estilo Tipográfico versão 3.0*, por Robert Bringhurst. Cosac Naify, 2008.
- [*A beginner’s introduction to typesetting with LaTeX*](https://www.ctan.org/pkg/beginlatex), por Peter Flynn
