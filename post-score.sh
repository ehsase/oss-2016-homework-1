#!/bin/bash

while IFS='' read -r line || [[ -n "$line" ]]; do
  url=$(echo "$line" | awk '{print $1}')
  score=$(echo "$line" | awk '{print $2}')
  echo $url
  echo $score
  git clone $url
  access=$(echo $?)
  if [ "$access" != "0" ]; then
    echo "QQQQQQQQQQQQQQQQ access error"
    continue
  fi
  cd oss-2016-homework
  targetrepo="homework-2"
  git checkout $targetrepo
  hw2exist=$(echo $?)
  if [ "$hw2exist" != "0" ]; then
    git checkout -b hw2-score
    targetrepo="hw2-score"
  fi
  touch $score
  git add $score
  git commit -m "Your homework-2 score"
  git push origin $targetrepo
  cd ..
  rm -rf oss-2016-homework
done < "$1"
