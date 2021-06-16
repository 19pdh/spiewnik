.\" Page setup
.pl 8.27i
.ps 11
.nr PS 11
.vs 9
.nr VS 9
.ll 4.83i
.nr LL 4.83i
.po 0.5i
.nr PO 0.5i
.nr HM 0.5i
.nr FM 0.8i
.fp - R NimbusRoman-Regular
.fp - B NimbusRoman-Bold
.fp - I NimbusRoman-Italic
.\" macros used for building the toc
.so tmac.toc
.ds toc.tl Spis treści
.\" Change headings to work with toc
.rn SH SH_
.de SH
.  ps +3
.  B "\\$*"
.  ps
.	 toc.mark "\\$*"
..
.de blank
.  nr blankreg +1
.  sp 0.2
.  if \\n[blankreg]>1 .sp 0.5
..
.blm blank
.de C
.  if \\n[blankreg] \{
.    sp 0.6
.    nr blankreg 0
\}\c
.I \v'-1.1em'\\$1\h'-\w'\\$1'u'\h'-42u'\v'1.1em'
..
.de PIOSENKA
. SH "\\$*"
..
.
.de AKORDY
\\$1

.sp -1.67
\h'23'\\$2
..
.
.ds CH
.ad c
19 Poznańska Drużyna Harcerzy “Puszcza”
.sp 16
.ps +16
Śpiewnik
.ps
.br
.sp 36
Obóz Spore 2021
.br
.ad b
.bp
.ds LF \v'-0.2i'\l'4.83i'
.ds CF \v'1.5'%

.so index.ms

.\" This is an index that is generated on the first pass of this file
.so spiewnik.idx
.toc
