redo-ifchange $(find piosenki -type f -name '*.txt')

cat source.tmac > index.ms
for f in `find piosenki -type f -name '*.txt' | sort`; do
  filename=$(basename $f .txt)
  sed 'G' $f | grep -A1 . | sed 's/--//' > piosenki/.$filename.ms
  echo .SOURCE piosenki/.$filename.ms >> index.ms
done
