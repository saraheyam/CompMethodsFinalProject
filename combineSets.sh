#!/bin/bash

for i in {0..9}
do
	setfiles=$(sudo find set$i/Subsetted -type f)

	for file in $setfiles
	do
		echo $file
		patientpath=${file:21:13}
		studypath=${file:21:20}
		echo $patientpath
		echo $studypath
		
		echo ${file:21:40}

		if ! sudo find Subset/train/${file:21:40}
		then
			if ! sudo find Subset/train/$patientpath
			then
				mkdir Subset/train/$patientpath
				echo "Made directory for $patientpath"
			fi

			if ! sudo find Subset/train/$studypath
			then
				mkdir Subset/train/$studypath
				echo "Made directory for $studypath"
			fi
		fi

		cp $file Subset/train/${file:21:40}
		echo Copied to Subset/train/${file:21:40}
	done

done

