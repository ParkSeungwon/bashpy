#!/bin/bash

while read line; do
	i=$(echo $line | awk '{print $(NF-1)}')
	TO_PRINT=$(echo $line | awk '{for(i=4; i<NF-2; i++) {print $i}}')
	DATE=$(date +%s --date $i);
	NOW=$(date +%s);
	if(($NOW - $DATE < 86400 * 3)); then 
		/home/zeta/bin/cronnotify.sh $TO_PRINT;
		echo $TO_PRINT > /tmp/notify.log
	fi
done < <(/home/zeta/bin/creative.py)
