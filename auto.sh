#!/bin/bash

# restart
if [[ -f "output" || -f "input" ]]; then
rm -f output input
fi

# Assign the filename
ls > input

filename="input"

value="$(<$filename)"

if [[ -f "output" ]]; then
rm output
fi

for val in $value
do
    if [[ $val != "" && $val != "input" && $val != "output" ]]; then
    replace="https://cdn.jsdelivr.net/gh/baddate/imagedb/$val"
        if [[ ! -f "output" ]]; then
        echo "$replace" > output
        else
        echo "$replace" | tee -a output
        fi
    fi
done
git config --global user.email "badgatex@outlook.com"
git config --global user.name "baddate"
git add .
git commit -m "update"
git push origin master
