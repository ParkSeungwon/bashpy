#!/bin/bash

to_down=(artist glassblock catch private illang blade2 answer sherlock)
for i in ${to_down[*]}; do
	python2 ~/bin/daumwebtoon.py -r webtoon.daum.net/webtoon/rss/$i
done

