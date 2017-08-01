#!/bin/sh

git rev-parse --is-inside-work-tree > /dev/null 2>&1

if [ $? -eq 0 ]; then
  echo "Pull..."
  /root/pull/run.sh
elif [ ! "$(ls -A)"]; then
  echo "Clone..."
  /root/clone/run.sh
else
  echo "You canot clone into not empty directory"
  exit 1
fi
