#!/bin/bash
# can track git change history of a file
# scroll with jkud, go between versions hl, quit q

HEIGHT=$(stty size | awk '{print $1}')
VER=0
START=1

while true; do
	END=$((START + HEIGHT - 2))
	git --no-pager show HEAD~${VER}:$1 | awk -v end=$END -v start=$START 'NR >= start && NR <= end'
	echo - $VER
	read -n 1 -s KEY
	case $KEY in
		j) ((START++));;
		k) if((START != 1)); then ((START--)); fi;;
		h) ((VER++));;
		l) if((VER != 0)); then ((VER--)); fi ;;
		u) ((START-=HEIGHT)); if((START < 1)); then START=1; fi;;
		d) ((START+=HEIGHT));;
		q) break 
	esac
done
