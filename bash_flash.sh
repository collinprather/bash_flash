#!/bin/bash

NEWLINE=$'\n'
echo "${NEWLINE}Hello! Welcome to Bash Flash (cards). We're going to be interactively reviewing some of the concepts covered in MSDS-692 Data Acquisition.${NEWLINE}[Press return to continue]" | fold -s

# just here so that user has to hit return between messages.
read

echo "As a warning, this program will be reading and writing to some files in the /tmp/ folder. If this is not cool, you should exit this program now (with ^C).${NEWLINE}[Press return to continue]" | fold -s

read

q1FILE=/tmp/sales.xls
q1ANSWER_KEY=/tmp/q1.xls
q1URL=https://s3.amazonaws.com/bsp-ocsit-prod-east-appdata/datagov/wordpress/2017/10/opendatasites.xls
q1="1. The first step in any sort of data analysis is simply getting the data. Please write a bash command to scrape this sample sales data from the following url: ${q1URL}. Make sure to save it as ${q1FILE}.${NEWLINE}"

# it would look nicer to fold $q1 below, but that introduces a \n, so that
# if you copy/paste it, it will execute the command (not desired)
echo $q1 

read -p "${NEWLINE}Your input: \$ " curl_attempt

# should work on any mac
eval ${curl_attempt} | cat /dev/stdout

read

# the program seems to be pausing here.. not sure why. I have to ^C to kick it back into motion.

if test -f "${q1FILE}"; then
	# creates the answer key
	curl $q1URL > $q1ANSWER_KEY
	# checks the difference between answer key and user's command. Saves diff to file
	if [ "$(diff ${q1FILE} ${q1ANSWER_KEY})" = "" ]; then
		echo "Great job!"
	fi

fi




# curl pdf

# transform pdf to txt

# format txt nicely using `tr` and piping other commands together!
