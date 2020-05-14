#!/bin/bash

with_icons=$1
if [[ $with_icons == "icons" ]] ; then
	./theme-script.sh Aqua all
	sleep 1
	./theme-script.sh Blue all
	sleep 1
	./theme-script.sh Brown all
	sleep 1
	theme-script.sh Deepblue all
	sleep 1
	./theme-script.sh Green all
	sleep 1
	./theme-script.sh Grey all
	sleep 1
	./theme-script.sh MATE all
	sleep 1
	./theme-script.sh Orange all
	sleep 1
	./theme-script.sh Pink all
	sleep 1
	./theme-script.sh Purple all
	sleep 1
	./theme-script.sh Red all
	sleep 1
	./theme-script.sh Yellow all
	sleep 1
elif [[ $with_icons == "iconsonly" ]] ; then
  	./theme-script.sh Aqua icons
  	sleep 1
  	./theme-script.sh Blue icons
  	sleep 1
  	./theme-script.sh Brown icons
  	sleep 1
  	theme-script.sh Deepblue icons
  	sleep 1
  	./theme-script.sh Green icons
  	sleep 1
  	./theme-script.sh Grey icons
  	sleep 1
  	./theme-script.sh MATE icons
  	sleep 1
  	./theme-script.sh Orange icons
  	sleep 1
  	./theme-script.sh Pink icons
  	sleep 1
  	./theme-script.sh Purple icons
  	sleep 1
  	./theme-script.sh Red icons
  	sleep 1
  	./theme-script.sh Yellow icons
  	sleep 1
else
	./theme-script.sh Aqua noicons
	sleep 1
	./theme-script.sh Blue noicons
	sleep 1
	./theme-script.sh Brown noicons
	sleep 1
	theme-script.sh Deepblue noicons
	sleep 1
	./theme-script.sh Green noicons
	sleep 1
	./theme-script.sh Grey noicons
	sleep 1
	./theme-script.sh MATE noicons
	sleep 1
	./theme-script.sh Orange noicons
	sleep 1
	./theme-script.sh Pink noicons
	sleep 1
	./theme-script.sh Purple noicons
	sleep 1
	./theme-script.sh Red noicons
	sleep 1
	./theme-script.sh Yellow noicons
	sleep 1
fi
echo -e "Everything compiled!"
