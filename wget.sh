#!/bin/bash

trap "exit" SIGINT
for i in $*; do
	until wget -T 10 -c -t 0 --limit-rate=500k $i; do
		sleep 10
	done
done
