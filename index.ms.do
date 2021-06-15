redo-ifchange $(find piosenki -type f -name '*.txt')

cat source.tmac > index.ms
for f in `find piosenki -type f -name '*.txt' | sort`; do
  filename=$(basename $f .txt)
  cp $f piosenki/$filename.ms
  echo .SOURCE piosenki/$filename.ms >> index.ms
done
