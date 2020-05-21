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
		--cursors|-c)
					shift
					param="-c"
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
	echo "Compiling $i with parameter $param..."
	./theme-script.sh $i $param
	echo "Done!"

done
echo "Compiled EVERYTHING with parameter $param!"
