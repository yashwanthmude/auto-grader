#!/bin/bash

f="mock_grading/roll_list"
dir=mock_grading/submissions
str=$(cat $f)
mkdir organised
for e in $str
do
  cd organised 
  mkdir $e
  cd $e
  for file in $(ls ../../mock_grading/submissions)
  do
      regex=$e
      if [[ $file =~ $regex ]];then
      ln -s ../../mock_grading/submissions/$file 
      fi
  done
  cd ..
  cd ..
done
