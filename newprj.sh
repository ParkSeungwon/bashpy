#!/bin/bash

cp -r cppbase $1
cd $1
rm -rf .git
git init
