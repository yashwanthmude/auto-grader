#!/bin/bash

touch distribution.txt
touch marksheet.csv
cd organised
for dir in *
do
  cd $dir
  mkdir student_outputs
  for file in *.cpp
  do
    g++ -o executable $file 2>/dev/null
    SCORE=0
    for f in $(ls ../../mock_grading/inputs)
    do
      timeout 5 ./executable < ../../mock_grading/inputs/$f > student_outputs/"${f%.*}".out 2>/dev/null
      if cmp -s ../../mock_grading/outputs/"${f%.*}".out student_outputs/"${f%.*}".out
      then
        (( SCORE++ ))
      fi
    done
  done
  echo "$SCORE" > /dev/null >> ../../distribution.txt
  echo ""$dir",$SCORE" > /dev/null  >> ../../marksheet.csv
  cd ..
done
cd .. 
sort distribution.txt > /dev/null
sort marksheet.csv > /dev/null

