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
  echo "XXXXXXX - should show homework-3 branch"
  git branch -a
  git checkout homework-3
  echo "YYYYYYY - should have review-url file"
  ls -l
  cat review-url
  cd ../
  rm -rf oss-2016-homework
  echo -e "ZZZZZZZZZZZZ\nEnd of a student\n\n\n"
  break
done < "$1"
