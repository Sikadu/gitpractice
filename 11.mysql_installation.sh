#!/bin/bash

USERID=$(id -u)

if [[ $USERID -ne 0 ]]

then 

echo " user have root access "

exit 1

fi

dnf list installed git

if [[ $? -ne 0 ]]
then
    echo " please install git "
    dnf install git -y
    if [[ $? -ne 0 ]]
    then 
    echo " git installation not done successfully "
    exit 1
    else
    echo " git intallation success"
    fi
    else
    echo " git already installed "
 fi

dnf list installed mysql

if [[ $? -ne 0 ]]
then
echo " sql not installed...going to install "
dnf install mysql -y
 if [[ $? -ne 0 ]]
 then
   echo " sql not installed successfully"
   exit 1
   else
   echo " sql installed successfully"

  fi 
else
    echo " sql already installed "

fi