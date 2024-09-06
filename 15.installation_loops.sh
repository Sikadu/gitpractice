#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

CHECK_ROOT()
{
    if [[ $USERID -ne 0 ]]
    then 
    echo -e " $G Please run the script with root access $N"
    exit 1
    fi
}

VALIDATE()
{
    if [[ $1 -ne 0 ]]
        then 
        echo -e " $2 its $R failed $N "
        exit 1
        else
        echo -e " $2 its $G success $N "
     fi   
        
}

CHECK_ROOT

# sh 15-loops.sh git mysql postfix nginx
for package in $@ git mysql postfix nginx
do
dnf list installed $package

if [[ $? -ne 0 ]]
then
    echo -e "$R $package is not installed...going to install $package $N"
    dnf install $package -y
    VALIDATE $? "installing $package"
    else
    echo " $package already installed "
 fi
done