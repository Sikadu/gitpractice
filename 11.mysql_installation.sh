#!/bin/bash

USERID=$(id -u)

if [[ $USERID -ne 0 ]]

then 

echo " user have root access to run the script "
exit 1

else 

echo " user have root access "

fi

dnf list installed mysql

if [[ $? -ne 0 ]]

then
    echo " please install mysql "
    dnf install mysql -y
    else
    echo " my sql not installed "
    exit 1

fi