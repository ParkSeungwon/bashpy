#!/bin/bash

ls */*.{cc,h,cpp,hpp} > cscope.files 2> /dev/null
cscope -cb
ctags --fields=+i -n -R -L cscope.files
cqmakedb -s codequery.db -c cscope.out -t tags -p
