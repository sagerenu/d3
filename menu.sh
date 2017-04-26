# Select usage
clear
echo "\n\n\n"
echo "Welcome Please select your choice:"
# Array where the choice are stored
choice=("A Single EC2 instance" "1 RDS"  "4 Ec2 Instances (Dev,Qa & 2-staging) with 3 RDS & load balancer" "quit" )


select result in  "${choice[@]}" # Create menu via select command and above declared Array
do
	case $result in
		#Case 1 | If user selected 1st option then do this
		"A Single EC2 instance")
		echo "Creating a Single instance, Continue (Y/n)?"

		read x

		if [[ $x =~ ^[yY]$ ]]
		then
			echo "proceeding"

		else [[ $x =~ ^[nN]$ ]]

			echo "exiting"
			exit


		fi

		break
		;;
		#Case 2 | If user selected 2nd option then do this

		"1 RDS")
		echo "Creating a Single RDS, Continue (Y/n)? "

		read x

		if [[ $x =~ ^[yY]$ ]]
		then
			echo "proceeding"

		else [[ $x =~ ^[nN]$ ]]

			echo "exiting"
			exit


		fi

		break
		;;

		#Case 3 | If user selected 3rd option then do this
		"4 Ec2 Instances (Dev,Qa & 2-staging) with 3 RDS & load balancer")
		echo "Creating  Ec2 Instances (Dev,Qa & 2-staging) with 3 RDS & load balancer. Continue(Y/n)?"

		read x
		if [[ $x =~ ^[yY]$ ]]
		then
			echo "proceeding"

		else [[ $x =~ ^[nN]$ ]]

			echo "exiting"
			exit


		fi

		break
		;;
		#Case 4 | Choice to quit
		"quit")
		echo "quiiiit"
		break
		;;
		#Case * | if anything else is entered then reexecute the script
		*)
		echo "Please enter a valid choice"
		exec bash $0
		;;
	esac
done
