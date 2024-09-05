#!/bin/bash

USERID=$(id -u)

if [[ $USERID -ne 0 ]]

then 

echo " user have root access to run the script "
exit 1

else 

echo " user have root access "

fi

dnf list installed git

if [[ $? -ne 0 ]]

then
    echo " please install git "
    dnf install git -y
    else
    echo " my git not installed "
    exit 1

fi