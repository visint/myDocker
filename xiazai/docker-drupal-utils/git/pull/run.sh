#!/bin/sh

git pull --all 2>&1

if [ $? -ne 0 ]; then
	echo "Clone error"
	exit 1
fi

git checkout ${BRANCH} > /dev/null 2>&1

if [ $? -ne 0 ]; then
	echo "Checkout error: Unable to switch branch to ${BRANCH}";
  exit 1
fi

git checkout ${SHA} > /dev/null 2>&1

if [ $? -ne 0 ]; then
	echo "Checkout error: Unable to checkout commit";
  exit 1
fi

git reset ${SHA} > /dev/null 2>&1

# Check if error.
if [ $? -ne 0 ]; then
	echo "Reset error"
  exit 1
fi
