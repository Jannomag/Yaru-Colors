#!/bin/bash
COLORS="colors.txt"
#declare -a color=("amber" "aqua" "aubergine" "blue" "brown" "cinnamon" "deepblue" "green" "grey" "lavender" "mate" "orange" "pink" "purple" "red" "teal" "yellow")
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

for i in `cat $COLORS`
do
	echo "Compiling $i with parameter $param..."
	./theme-script.sh $i $param
	echo "Done!"

done
echo "Compiled EVERYTHING with parameter $param!"
