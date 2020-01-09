#!/bin/bash

echo usage: $0 titleID episode_start episode_end
site="https://comic.naver.com/webtoon/detail.nhn?titleId=${1}&no="
for ((k=$2; k<= $3; k++)); do 
	for i in `curl $site$k | sed -En "s/.*(https:\/\/image.+${1}.+\.jpg).*/\1/p"`; do
		pdir='';
		if [ $k -lt 10 ]; then pdir+='0'; fi;
		if [ $k -lt 100 ]; then pdir+='0'; fi;
		pdir+=$k;
		wget --user-agent="Mozilla" $i -P $pdir;
	done
done
#python -c "import re, sys
#for i in re.findall('https://image.+' + sys.argv[1] + '.+\.jpg', sys.stdin.read()): print i" $1);
