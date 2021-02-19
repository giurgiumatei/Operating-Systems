#!/bin/bash


input=df.fake
cont=0

while IFS= read -r line
do

	cont=`expr $cont + 1`

if [ $cont != 1 ]
then	
	
	percentage=$(echo $line|sed 's/[M%]//g' |awk '{print  $2}')
	space=$(echo $line|sed 's/[M%]//g' |awk '{print $5}')
	file=$(echo $line | awk '{print $6}')

if [ $percentage -gt 1000 ] || [ $space -lt 20 ]
then 
echo $file
fi


fi	
	
	
	
	#echo $line| awk '{print $6}'

done< "$input"
