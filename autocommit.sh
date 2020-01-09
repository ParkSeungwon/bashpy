#!/bin/bash

for j in `find . -size +3M -not -path '\./\.*'`; do # ignore +3M files
	j=${j#./}
	if [[ `git check-ignore $j` == "" ]]; then
		while read line; do [[ $line == "$j" ]] && continue 2; done < .gitignore
		echo $j >> .gitignore;
	fi
done

i=`pwd`
i=${i##*/}
if [ ! -d .git ]; then # if new repo
	git init; 
	if [ ! -f README.md ]; then echo "# $i" > README.md; fi
	curl -u "ParkSeungwon:cockcodk0" https://api.github.com/user/repos -d '{"name":"'$i'"}'
	git remote add origin git@github.com:ParkSeungwon/${i}.git
fi
if [[ ! `git status` =~ "커밋할 사항 없음, 작업 폴더 깨끗함" ]]; then #commit needed
	git add .
	git commit -m"`date` ${1:-autocommit}"
fi

if [[ `git log -n 1 --pretty=%D HEAD` == "HEAD" ]]; then #if detached branch
	for (( k=0; ; k++ )); do git checkout -b branch$k && break; done
fi
current_branch=`git branch | grep \* | cut -d ' ' -f2`
if ! git rev-parse --abbrev-ref --symbolic-full-name @{u}; then #if no track
	if ! git branch --set-upstream-to=origin/$current_branch;
	then #if no same name remote branch
		git push -u origin $current_branch
	fi
fi
if [[ `git status` =~ "커밋만큼 앞에 있습니다" ]]; then
	git push --all
fi
