#!/bin/bash
declare -a color=("aqua" "blue" "brown" "deepblue" "green" "grey" "mate" "orange" "pink" "purple" "red" "yellow")
param=$1
while [ ! -z "$1" ]; do
	case "$1" in
		--all|-a)
					shift
					param="-a"
					;;
		--icons|-i)
					shift
					param="-i"
					;;
		--noicons|-n)
					shift
					param="-n"
					;;
		*)
					break
					;;
	esac
done

for i in "${color[@]}"
do
	echo $param
	./theme-script.sh $i $param
done


echo -e "Everything compiled!"
