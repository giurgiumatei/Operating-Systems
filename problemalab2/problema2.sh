#!/bin/bash

average=0
file_counter=0



for filename in `find -type f`
do
	if [ -f $filename ]
	then
		average=`expr (cat $filename | wc -l) + average  `
		file_counter=`expr $file_counter + 1`

	
