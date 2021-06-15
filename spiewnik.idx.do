redo-ifchange index.ms
cat spiewnik.ms | soin | pic | tbl | eqn | roff -mpost -ms 2> spiewnik.preidx > /dev/null
cat spiewnik.preidx | grep '^INDEX' | sed 's/^INDEX//' > spiewnik.idx
