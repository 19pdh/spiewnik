redo-ifchange spiewnik.ms index.ms
cat spiewnik.ms | neatroff -mpost -ms 2> spiewnik.preidx > /dev/null
cat spiewnik.preidx | grep '^INDEX' | sed 's/^INDEX//' > spiewnik.idx
