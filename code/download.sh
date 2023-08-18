#!/bin/bash
if [ $# -eq 2 ]
then
  wget -r --no-parent -nH --cut-dirs=$2 -R html,tmp $1
  if [ $? -ne 0 ]
  then 
    echo "Usage: bash download.sh <link to directory> <cut-dirs argument>"
    exit 1
  fi
  if [[ "$(basename $1)" != "mock_grading" ]]
  then
    mv $(basename $1) mock_grading
  fi
else
  echo "Usage: bash download.sh <link to directory> <cut-dirs argument>"
  exit 1
fi
exit 0
