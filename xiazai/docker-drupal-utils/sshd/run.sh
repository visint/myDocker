#!/bin/sh

if [ ! -z "$SSH_ROOT_PASSWORD" ]; then
  echo "root:${SSH_ROOT_PASSWORD}" | chpasswd
elif [ ! -z "$SSH_ROOT_RANDOM_PASSWORD" ]; then
  export SSH_ROOT_PASSWORD="$(pwgen -1 32)"
	echo "GENERATED ROOT PASSWORD: $SSH_ROOT_PASSWORD"
  echo "root:${SSH_ROOT_PASSWORD}" | chpasswd
else
  echo "Missing password! You have to set SSH_ROOT_PASSWORD or SSH_ROOT_RANDOM_PASSWORD"
  exit 1
fi

/usr/sbin/sshd -D
