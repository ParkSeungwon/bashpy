#!/bin/bash

if ! ping -c 1 google.com; then exit 1; fi #check internet available
cd ~/Programming
for i in `ls -d */`; do
	cd $i
	echo ------------------------------- $i -------------------------------------
	autocommit.sh
	cd ..
done
