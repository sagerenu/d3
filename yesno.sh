#set -x
echo "hi"
read choice
function yesno()
{
  read   choic

  echo function called
  case "$choic" in
   [yY][eE][sS] )
   echo "Please enter the name of key-pair to be created:"
   read kp
   aws ec2 create-key-pair --key-name $kp --query 'KeyMaterial' --output text > $kp.pem
   echo -e "\n\n\n"
   echo "Key-pair Created SuccessFully.\n  "
   chmod 400 $kp.pem
   mv $kp.pem ~/
   ;;
   [nN][oO] )
   echo "enter name of pem file | Just name - don't include .pem extension"
   read kp
   echo $kp.pem
   ;;
   *) echo 'Please type either "yes" or "no"' ;yesno ;;
  esac

}


#while true; do
  case "$choice" in
   [yY][eE][sS] )
   echo "Please enter the name of key-pair to be created:"
   read kp
   aws ec2 create-key-pair --key-name $kp --query 'KeyMaterial' --output text > $kp.pem
   echo -e "\n\n\n"
   echo "Key-pair Created SuccessFully.\n  "
   chmod 400 $kp.pem
   mv $kp.pem ~/
   ;;
   nN][oO] )
   echo "enter name of pem file | Just name - don't include .pem extension"
 	read kp
 	echo $kp.pem
   ;;
   * ) echo 'Please type either "yes" or "no"'; yesno ;;
  esac
#done
