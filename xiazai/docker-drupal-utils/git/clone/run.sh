#!/bin/sh

git clone --depth=${DEPTH} --branch=${BRANCH} ${CLONE_URL} ./ 2>&1

if [ $? -ne 0 ]; then
	echo "Clone error"
	exit 1
fi

git checkout ${SHA} > /dev/null 2>&1

if [ $? -ne 0 ]; then
	echo "Checkout error";
  exit 1
fi

git reset ${SHA} > /dev/null 2>&1

# Check if error.
if [ $? -ne 0 ]; then
	echo "Reset error"
  exit 1
fi
