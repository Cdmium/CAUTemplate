%% cauthesis.cls
%% Copyright 2018 阎彧萱
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   https://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is 阎彧萱.
%%
%% This work consists of the file cauthesis.cls
%% and the derived files:
%%   Logo.jpg
%%   CAU_Course_Thesis_Template.tex
%%   CAU_Course_Thesis_Template.pdf
%%   gb7714-2015.bbx
%%   中国农业大学课程论文写作格式.doc
%% ---------------------------------------------------------------------------
%% Class Name   : cauthesis
%% Description  : China Agricultural University Course Thesis LaTeX Template
%% Repository   : https://github.com/Cdmium/CAUTemplate
%% Version      : 1.1
%% Copyright    : 2018 阎彧萱
%% E-mail       : yanyuxuan@cau.edu.cn
%% License      : LaTeX Project Public License v1.3c or later
%% License URI  : https://www.latex-project.org/lppl.txt
%% Files        : cauthesis.cls
%%                Logo.jpg
%%                CAU_Course_Thesis_Template.tex
%%                CAU_Course_Thesis_Template.pdf
%%                中国农业大学课程论文写作格式.doc
%% ---------------------------------------------------------------------------
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cauthesis}%
    [2018/10/24 v1.1 China Agricultural University Course Thesis LaTeX Template]
\newif\if@oneside\@onesidefalse
\newif\if@twoside\@twosidefalse
\newif\if@clearaftp\@clearaftpfalse
\newif\if@maketable\@maketablefalse
\DeclareOption{oneside}{%
    \@onesidetrue%
}
\DeclareOption{twoside}{%
    \@twosidetrue%
}
\DeclareOption{maketable}{%
    \@maketabletrue%
}
\DeclareOption*{%
    \ClassWarning{cauthesis}%
        {Unknown option `\CurrentOption'}%
}
\ProcessOptions\relax
\if@oneside%
    \if@twoside%
        \@clearaftpfalse%
        \ClassWarning{You can only choose one of the oneside and twoside options.%
            Automatically set to oneside.}%
    \fi%
\else%
    \if@twoside%
        \@clearaftptrue%
    \fi%
\fi%
\LoadClass[a4paper]{article}%加载article类型
%% ---------------------------------------------------------------------------
%页面布局调节
\RequirePackage{geometry}
\geometry{left=2.5cm,right=2.5cm,top=3.5cm,bottom=2.5cm,footskip=0.8cm}
\pagestyle{plain}
\linespread{1.25}\selectfont
%% ---------------------------------------------------------------------------
\RequirePackage{graphicx}%图片插入
\RequirePackage[section]{placeins}
\def\@captype{figure}
%% ---------------------------------------------------------------------------
\RequirePackage{etoolbox}%编程辅助
\RequirePackage{ifthen}%编程辅助
\RequirePackage[normalem]{ulem}%下划线
\RequirePackage{array}%数学
%% ---------------------------------------------------------------------------
%书签功能，选项去掉链接红色方框,
\RequirePackage[CJKbookmarks,%
    %debug=true,%
    colorlinks=true,%
    bookmarksnumbered=true,%
    pdfstartview=FitH,%
    linkcolor=magenta,%
    anchorcolor=magenta,%
    citecolor=magenta,%
    linkcolor=black,]{hyperref}
%linkcolor=green,blue,red,cyan, magenta,
%yellow, black, gray,white, darkgray, lightgray, brown,
%lime, olive, orange, red,purple, teal, violet.
%下面这两句保证多篇文章一起排时的超链接正确性
\newcounter{Hsection}
\preto\section{\stepcounter{Hsection}}
\RequirePackage{titleref} %标题引用
%% ---------------------------------------------------------------------------
%英文字体控制
\RequirePackage{fontspec}
\setmainfont{Times New Roman}
%% ---------------------------------------------------------------------------
%中文环境
%中文字体控制
\RequirePackage[zihao=-4]{ctex}
\RequirePackage{xeCJKfntef}
\setCJKmainfont[BoldFont={Adobe Heiti Std},ItalicFont={Adobe Kaiti Std}]{Adobe Song Std}
\setCJKsansfont{Adobe Heiti Std}
\setCJKmonofont{Adobe Fangsong Std}
\setCJKfamilyfont{zhsong}{Adobe Song Std}
\setCJKfamilyfont{zhhei}{Adobe Heiti Std}
\setCJKfamilyfont{zhkai}{Adobe Kaiti Std}
\setCJKfamilyfont{zhfs}{Adobe Fangsong Std}
\setCJKfamilyfont{zhli}{LiSu}
\setCJKfamilyfont{zhyou}{YouYuan}
\setCJKfamilyfont{zhsongbf}[FakeBold=4]{Adobe Song Std}
%% ---------------------------------------------------------------------------
%章节标题格式
\RequirePackage{titlesec}
\renewcommand{\contentsname}{\centerline{目\hspace{2em}录}}%目录居中
\titleformat{\section}{\linespread{1.5}\selectfont\bfseries\zihao{-3}}{\thesection\hspace{1em}}{0pt}{}
\titlespacing*{\section}{0pt}{*1}{11pt}
\titleformat{\subsection}{\linespread{1.5}\selectfont\bfseries\zihao{4}}{\thesubsection\hspace{1em}}{0pt}{}
\titlespacing*{\subsection}{0pt}{*1.5}{*1}
\titleformat{\subsubsection}{\linespread{1.5}\selectfont\bfseries\zihao{-4}}{\thesubsubsection\hspace{1em}}{0pt}{}
\titlespacing*{\subsubsection}{0pt}{*1.5}{*1}
%% ---------------------------------------------------------------------------
%无编号section
\newcommand{\specialsection}[1]{%
    \makeatletter\setcounter{secnumdepth}{-2}\makeatother
    \phantomsection
    \section{#1}
    \makeatletter\setcounter{secnumdepth}{3}\makeatother}
%% ---------------------------------------------------------------------------
%数学
\RequirePackage{bbding,pifont} %特殊字体，参考latexfriend
\RequirePackage{xltxtra} %用于输出tex的特殊文本格式，以及上下标的字符
\RequirePackage{mflogo,texnames}%用于输出tex的特殊文本格式，texnames的说明文档没有找到
\RequirePackage{amsmath}%使用宏包{美国数学协会数学}，有个功能可以将章节和方程号联系起来。
\RequirePackage{amssymb} %使用宏包{美国数学协会符号}
\RequirePackage{mathrsfs}%数学字体
%% ---------------------------------------------------------------------------
%绘图和绘制统计图
\RequirePackage{xcolor}
\RequirePackage{pgf,tikz}
%\RequirePackage{pgfplots}
%\RequirePackage{pgfplotstable}
%\pgfplotsset{compat=newest}
%\usepgfmodule{shapes}
%\usetikzlibrary{arrows,decorations.pathmorphing,backgrounds,positioning,fit,petri}
%\usetikzlibrary{math,mindmap,shapes.geometric,calc,intersections,through}
%\usetikzlibrary{knots}
%% ---------------------------------------------------------------------------
%表格
\RequirePackage{float}
\RequirePackage{multirow} %for excel2latex
\RequirePackage{booktabs} %for excel2latex
%\RequirePackage{longtable} %注意longtable无法在multicol中使用
\RequirePackage{supertabular} %使用supertabular来实现可以跨页的表格
\RequirePackage{tabularx}
\newcolumntype{Y}{>{\raggedleft\arraybackslash}X}
%% ---------------------------------------------------------------------------
%图表
\RequirePackage{subfigure}
\RequirePackage{ccaption}
\captiondelim{~} %图序图题中间的间隔符号
\captionnamefont{\zihao{-5}\heiti} %图序样式
\captiontitlefont{\zihao{-5}\heiti} %图题样式
\captionwidth{0.8\linewidth} %标题宽度
\changecaptionwidth
%\captionstyle{<style>} can be used to alter this. Sensible values for
%style are: \centering, \raggedleft or \raggedright
\captionstyle{\centering}
%\precaption{\rule{\linewidth}{0.4pt}\par}
%\postcaption{\rule[0.5\baselineskip]{\linewidth}{0.4pt}}
\setlength{\belowcaptionskip}{0.1cm} %设置caption上下间距
\setlength{\abovecaptionskip}{0.1cm}
\setlength{\abovelegendskip}{0.1cm}  %设置legend上下间距
\setlength{\belowlegendskip}{0.1cm}
%注意用中文的图题时，用\\好像出错，而用\newline就没有问题
%浮动体外使用标题，使用\tabcaptionfix命令产生在浮动体外
%与table中默认的caption一致的标题效果
\newfixedcaption{\tabcaption}{table}
\newfixedcaption{\figcaption}{figure}
%\newfixedcaption{\tabcaptionfix}{table}
%% ---------------------------------------------------------------------------
%参考文献
\RequirePackage{url}
\RequirePackage[backend=biber,%
style=gb7714-2015]{biblatex}%biber
\renewcommand{\bibfont}{\zihao{-5}\songti}
\newcommand{\bibname}{参考文献}
\setlength{\bibitemsep}{2pt}
\defbibheading{bibliography}[\bibname]{%
    \specialsection{#1}}%
%% ---------------------------------------------------------------------------
%分层次enumerate
\RequirePackage{enumitem}
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{%
            \node[shape=circle,draw,inner sep=1pt] (char) {#1};}}
\newenvironment{level}[1]{%
    \ifnumequal{#1}{2}{%
        \begin{enumerate}[label=\protect\circled{\arabic*}]%
    }{%
        \ifnumequal{#1}{1}{}{\ClassWarning{cauthesis}{Invalid argument. Treated as one.}}%
        \begin{enumerate}[label=(\arabic*)]%
    }%
}{%
    \end{enumerate}%
}
%% ---------------------------------------------------------------------------
%封面
\newcommand{\@schoolyear}{20\hspace{1em}-20\hspace{1em}}
\newcommand{\schoolyear}[1]{\renewcommand{\@schoolyear}{#1}}
\newcommand{\@semester}{\hspace{1em}}
\newcommand{\semester}[1]{\renewcommand{\@semester}{#1}}
\DeclareListParser*{\forcsvlista}{;}
\def\tpitem#1{\def\tpitemlist{}%
    \forcsvlista{\listadd\tpitemlist}{#1}}
\def\zhkeywords#1{\def\zhkeywordslist{}%
    \forcsvlista{\listadd\zhkeywordslist}{#1}}
\def\enkeywords#1{\def\enkeywordslist{}%
    \forcsvlista{\listadd\enkeywordslist}{#1}}
\newlength{\@maxlen}
\newlength{\@temporary}
\newcounter{cycling}
\newcounter{exlcyc}
\deflength{\@maxlen}{0pt}
%% ---------------------------------------------------------------------------
%摘要
\newcommand{\@zhabstruct}{}
\newcommand{\zhabstruct}[1]{\renewcommand{\@zhabstruct}{#1}}
\newcommand{\@enabstruct}{}
\newcommand{\enabstruct}[1]{\renewcommand{\@enabstruct}{#1}}
%% ---------------------------------------------------------------------------
%生成封面
\AtBeginDocument{%
    \begin{titlepage}%
    \pagestyle{empty}%
    \begin{flushleft}%
        \includegraphics[width=3.18cm,height=2.41cm]{./Picture/Logo.jpg}%
    \end{flushleft}%
    \centering%
    \begin{tabularx}{\textwidth}{@{}Y@{}c@{}X@{}}%
        &\begin{minipage}[t]{0.75\textwidth}%
            \CJKfamily{zhli}%
            \begin{center}%
                \linespread{1}\selectfont%
                \zihao{0}中国农业大学\par{}课程论文\par%
                \zihao{1}（\textrm{\@schoolyear}学年\@semester{}季学期）\par%
            \end{center}%
            \vspace{66pt}%1%
            \zihao{-2}%
            \CJKfamily{zhsongbf}%
            \defcounter{cycling}{0}%
            \renewcommand*{\do}[1]{%
                \stepcounter{cycling}%
                \ifnumequal{\value{cycling}}{1}{\settowidth{\@temporary}{#1}%
                \ifdimgreater{\@temporary}{\@maxlen}{\deflength{\@maxlen}{\@temporary}}{}}{%
                    \ifnumequal{\value{cycling}}{3}{\defcounter{cycling}{0}}{%
                        \ifnumgreater{#1}{0}{\defcounter{cycling}{0}}{}}}}%
            \dolistloop{\tpitemlist}%
            \centering%
            \begin{minipage}[t]{0.75\textwidth}%
                \centering%
                \linespread{1.75}\selectfont%2%
                \defcounter{cycling}{0}%
                \renewcommand*{\do}[1]{\stepcounter{cycling}\ifnumequal{\value{cycling}}{1}{\makebox[\@maxlen][s]{#1}：}{%
                    \ifnumequal{\value{cycling}}{3}{\uline{#1\hfill}\par\defcounter{cycling}{0}}{%
                        \ifnumgreater{#1}{0}{\defcounter{exlcyc}{0}%
                            \whiledo{\value{exlcyc}<#1}{%
                                \uline{\hfill}\par\stepcounter{exlcyc}}\defcounter{cycling}{0}}{}}}}%
                \dolistloop{\tpitemlist}%
            \end{minipage}%
        \end{minipage}%
        &\begin{minipage}[t]{0.15\textwidth}%
            \vspace{-0.5cm}%
            \linespread{1.5}\selectfont%
            \begin{tabular}[t]{|p{2.1cm}<{\centering}|}%
                \hline%
                \zihao{-4}\CJKfamily{zhsongbf} 成绩\\%
                \hline%
                \zihao{-4} \\\hline%
            \end{tabular}%
            \renewcommand{\arraystretch}{1}%
        \end{minipage}\\%
    \end{tabularx}%
    \end{titlepage}%
    \pagebreak%
    \if@clearaftp%
        \pagestyle{empty}%
        \cleardoublepage%
    \fi%
%% ---------------------------------------------------------------------------
%生成摘要
    \renewcommand\arraystretch{1}%
    \setcounter{page}{1}%
    \pagenumbering{Roman}%
    \maketitle%
    \ifdefempty{\@zhabstruct}{\ClassWarning{cauthesis}{Empty Zhabstruct.}}{%
        \phantomsection%
        \addcontentsline{toc}{section}{摘要}%
        \begin{center}%
            \linespread{1.5}\selectfont%
            \zihao{-3}\textbf{摘\hspace{2em}要}%
            \vspace{11pt}%
        \end{center}%
        \linespread{1.25}\selectfont%
        \setlength{\parindent}{2em}%
        \par\@zhabstruct\\%
        \newline%
        \ifdefvoid{\zhkeywordslist}{\ClassWarning{cauthesis}{Empty Enkeywords.}}{%
            \noindent%
            \textbf{关键词：}%
            \renewcommand*{\do}[1]{\textbf{#1}；}%
            \dolistloop{\zhkeywordslist}\par}}%
    \ifdefempty{\@enabstruct}{\ClassWarning{cauthesis}{Empty Enabstruct.}}{%
        \phantomsection%
        \addcontentsline{toc}{section}{ABSTRUCT}%
        \begin{center}%
            \linespread{1.5}\selectfont%
            \zihao{-3}\textbf{ABSTRUCT}%
            \vspace{11pt}%
        \end{center}%
        \linespread{1.25}\selectfont%
        \setlength{\parindent}{2em}%
        \par\@enabstruct\\%
        \newline%
        \ifdefvoid{\enkeywordslist}{\ClassWarning{cauthesis}{Empty Enkeywords.}}{%
            \noindent%
            \textbf{Key Words: }%
            \renewcommand*{\do}[1]{\textbf{#1}; }%
            \dolistloop{\enkeywordslist}\par}}%
    \clearpage%
    \if@maketable%
        \tableofcontents%
    \fi%
    \clearpage%
    \setcounter{page}{1}%
    \pagestyle{plain}
    \pagenumbering{arabic}%
}
%% ---------------------------------------------------------------------------
