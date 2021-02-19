#1/bin/bash

cd $1


for filename in `find`
do
	
	if [ -f $filename ]
	then 
		if  grep -q "100[0-9][0-9]*" $filename 
		then

			echo $filename
		fi
	fi
done
cd ..
