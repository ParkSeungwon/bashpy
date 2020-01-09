#!/bin/bash
for a in $*; do
	until youtube-dl "$a"; do 
		sleep 10;
	done
done
