# Select usage
clear
echo "\n\n\n"
echo "Welcome Please select your choice:"

############################# Define Choices Start ##############################################################
c1="A Single EC2 instance"
c2="A single RDS"
c3=" Ec2 Instances 4 | (Dev,Qa & 2-staging) | with 3 RDS & load balancer"
c4=" Ec2 Instances 4 | (Dev,Staging & 2-qa) | with 3 RDS & load balancer"
c5="quit"
choice=("$c1" "$c2"  "$c3" "$c4" )

############################# Define Choices End ##############################################################
############################# Confirmation Function start #######################################################
f_name=confirm
function confirm ()
{
	read x
	if [[ $x =~ ^[yY]$ ]]
	then
		echo "proceeding"
	else [[ $x =~ ^[nN]$ ]]
		echo "exiting"
		exit
	fi
}
############################# Confirmation Function End #########################################################
select result in  "${choice[@]}" # Create menu via select command and above declared Array
do
	case $result in
		#Case 1 | If user selected 1st option then do this
		"$c1")
		echo "Creating a Single instance, Continue (Y/n)?"
		$f_name
		break
		;;
		#Case 2 | If user selected 2nd option then do this

		"$c2")
		echo "Creating a Single RDS, Continue (Y/n)? "
		$f_name
		break
		;;

		#Case 3 | If user selected 3rd option then do this
		"$c3")
		echo "Creating  Ec2 Instances (Dev,Qa & 2-staging) with 3 RDS & load balancer. Continue(Y/n)?"
		$f_name
		break
		;;
		#Case 4 | Choice to quit
		"$c4")
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
