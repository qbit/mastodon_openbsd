#!/bin/sh

ID=4AEE18F83AFDEB23

gpg2 --list-keys "$ID" > /dev/null

if [ $? == 2 ]; then
	gpg2 --receive-keys "${ID}"
	exit $?
else
	exit 0;
fi
