#!/bin/bash

while read branch; do
  upstream=$(git rev-parse --abbrev-ref $branch@{upstream} 2>/dev/null)
  if [[ $? == 0 ]]; then
    echo $branch tracks $upstream
  else
    echo $branch has no upstream configured
  fi
done < <(git for-each-ref --format='%(refname:short)' refs/heads/*)

