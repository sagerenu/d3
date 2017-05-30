
#!/bin/bash -x
# GETTING INPUT FROM USER

clear
echo starting

read x #-p "Are you sure (Yes/No)?" -n 1 -r
if [[ $x =~ ^[yY][eE][sS]$ ]]
then
	echo "Working"
elif [[ $x =~ ^[nN][oO]$ ]]
then
	echo "NoT Workin"
else
	echo "please either type 'yes' or 'no' "

	#this part is pending need to work on it
fi
