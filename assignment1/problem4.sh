#!/usr/bin/bash

echo $(cat $1 | grep -v "^>" | tr -d "\n" | wc -m)/$(cat $1 | grep "^>" | wc -l) | bc
