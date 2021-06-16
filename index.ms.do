redo-ifchange $(find piosenki -type f -name '*.txt')

echo "" > index.ms
for f in `find piosenki -type f -name '*.txt' | sort`; do
  filename=$(basename $f .txt)
  sed 'G' $f | grep -A1 . | sed 's/--//' | sed 's/^\(.*\)|\(.*\)/\.AKORDY "\1" "\2"/' > piosenki/.$filename.ms
  echo .so piosenki/.$filename.ms >> index.ms
  echo .br >> index.ms
  echo .bp >> index.ms
done
