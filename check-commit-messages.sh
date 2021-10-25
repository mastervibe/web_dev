#!/bin/bash

REGEX="^(build|feat|fix|refactor|material|review|style|test)(\(/?([[:alnum:]/-]+)\))?: [[:alnum:]# ]+"

git fetch origin $1
git fetch origin master
git log origin/$1 ^origin/master --pretty="%s" --no-merges | while read -r commit_message
do
  if [[ ! $commit_message =~ $REGEX ]]
  then
    echo "invalid commit message: " $commit_message 1>&2
    exit 1;
  elif [ ! -d ${BASH_REMATCH[3]} ]
  then
    echo "invalid scope definiton: " ${BASH_REMATCH[3]}  1>&2
    exit 1;
  fi
done
