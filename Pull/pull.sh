#!/bin/bash

echo "Enter the image or repositery name"
read repositery
echo "Enter the container name"
read container
echo "Enter the Tag"
read Tag
echo "Enter the user name of the docker hub"
read username
#echo "Enter the password of docker hub"
#read password

#please login in the case of permession denied
#if ! docker login --username="$username" --password="$password"; then
#	echo "There is a ploblem in login process. PLease recheck your user name and password and also varify the command"
#	exit 1
#fi

if ! docker pull ${username}/${repositery}:${Tag}; then
	echo "There are some problems occur during pull the image form docker hub"
	exit 1
fi

if ! docker run --name "$container" -d -P 80:80 ${repositery}:${Tag}; then
	echo "There is some error in docker run! Please recheck your build command. Thank You"
	exit 1
fi

if ! curl 127.0.0.1:80; then
	echo "There is a problem in curl process"
	exit 1
fi