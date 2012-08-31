#!/bin/bash

git log --name-only --format="format:" | 
grep "^$" -v | 
sort | uniq -c | sort |
awk '{print $1 "," $2}'


