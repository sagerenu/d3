
echo "create new pem file (Yes/no)"
read x
function f1()
{
  read y
  if [[ $y =~ ^[Yy][eE][sS]$ ]]
  then
    echo "Please enter the name of key-pair to be created:"
    read kp
    aws ec2 create-key-pair --key-name $kp --query 'KeyMaterial' --output text > $kp.pem
    echo -e "\n\n\n"
    echo "Key-pair Created SuccessFully.\n  "
    chmod 400 $kp.pem
    mv $kp.pem ~/
  elif [[ $y =~ ^[nN][oO] ]]
  then
    echo "enter name of pem file | Just name - don't include .pem extension"
    read kp
    echo $kp.pem

  else
    echo "Please type yes or no"
    f1
  fi
}

echo    # (optional) move to a new line
if [[ $x =~ ^[Yy][eE][sS]$ ]]
then
  echo "Please enter the name of key-pair to be created:"
  read kp
  aws ec2 create-key-pair --key-name $kp --query 'KeyMaterial' --output text > $kp.pem
  echo  "\n\n\n"
  echo "Key-pair Created SuccessFully.\n  "
  chmod 400 $kp.pem
  mv $kp.pem ~/
elif [[ $x =~ ^[nN][oO] ]]
then
  echo "enter name of pem file | Just name - don't include .pem extension"
  read kp
  echo $kp.pem

else
  echo "Please type yes or no"
  f1
fi
