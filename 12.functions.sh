#!/bin/bash

USERID=$(id -u)

CHECK_ROOT()
{
    if [[ $USERID -ne 0 ]]
    then 
    echo " Please run the script with root access "
    exit 1
    fi
}

VALIDATE()
{
    if [[ $1 -ne 0 ]]
        then 
        echo " $2 its not success "
        exit 1
        else
        echo " $2 its success"
     fi   
        
}

CHECK_ROOT

dnf list installed git

if [[ $? -ne 0 ]]
then
    echo " git is not installed...going to install git "
    dnf install git -y
    VALIDATE $? "installing git"
    else
    echo " git already installed "
 fi

dnf list installed mysql

if [[ $? -ne 0 ]]
then
echo " sql not installed...going to install "
dnf install mysql -y
VALIDATE $? "installing mysql"
else
    echo " sql already installed "

fi