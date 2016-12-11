#!/bin/bash

##
# Game to have user guess a random number
##

NUM=$RANDOM
i=0
TRIES=1

function increasetries()
{
	TRIES=$(($TRIES+1))
}

function playgame()
{
	if [ -z $i ]			
	then
		true
	elif test $i -gt $NUM
	then
		increasetries
		echo "$i is greater than the number"
		true
	elif test $i -lt $NUM
	then
		increasetries
		echo "$i is less than the number"
		true
	else
		echo
		echo "CONGRATS YOU WON! THE NUMBER IS: $i"
		echo "You found the number in: $TRIES attempts" 
		false
	fi
}

function promptnread()
{
	echo
	echo "ATTEMPT: $TRIES"
	echo -n "Please enter a number: "
	read i
}

promptnread
while playgame
do
	promptnread
done
