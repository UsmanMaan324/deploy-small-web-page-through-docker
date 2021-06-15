#!/bin/bash

echo "Enter the image or repositery name"
read repositery
echo "Enter the container name"
read container
echo "Enter the Tag"
read Tag
echo "Enter the user name of the docker hub"
read username
echo "Enter the password of the docker hub"
read password


if ! docker build -t docker.io/${username}/${repositery}:${Tag} .; then
	echo "There is some error in docker build! Please recheck your build command. Thank You"
	exit 1
fi

#if ! docker run --name "$container" -d -p 56734:80 ${repositery}:${Tag}; then
#	echo "There is some error in docker build! Please recheck your build command. Thank You"
#	exit 1
#fi



if ! docker login --username="$username" --password="$password"; then
	echo "There is a ploblem in login process. PLease recheck your user name and password and also varify the command"
	exit 1
fi

#docker commit ${container} ${username}/${repositery}:${Tag}

if ! docker push ${username}/${repositery}:${Tag}; then
	echo "There are some problems in push process. Please recheck the command"
	exit 1
fi

echo "THe image is pushed of the docker hub repositery successfuly"



