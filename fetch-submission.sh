#!/bin/bash

while IFS='' read -r line || [[ -n "$line" ]]; do
  echo "GIT URL: $line"
  if [ -z ${line} ]; then 
    echo "empty URL. continue"
    continue 
  fi
  git clone $line
  access=$(echo $?)
  if [ "$access" != "0" ]; then
    echo "QQQQQQQQQQQQQQQQ access error"
    continue
  fi  
  cd oss-2016-homework
  git log -2
  git branch
  echo "XXXXXXX - should print ID"
  cat *
  git checkout homework-2
  git log -2
  echo "YYYYYYY - should have oss-homework file"
  ls -l
  cd ../
  rm -rf oss-2016-homework
  echo -e "ZZZZZZZZZZZZ\nEnd of a student\n\n\n"
done < "$1"
