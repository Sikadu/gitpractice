#!/bin/bash

LOGS_FOLDER="\var\log\shell_script"
SCRIPT_NAME=$(echo $0 | cut -d '.' -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE=$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log
mkdir -p $LOGS_FOLDER

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

CHECK_ROOT()
{
    if [[ $USERID -ne 0 ]]
    then 
    echo -e " $G Please run the script with root access $N" | tee -a $LOG_FILE
    exit 1
    fi
}

VALIDATE()
{
    if [[ $1 -ne 0 ]]
        then 
        echo -e " $2 its $R failed $N " | tee -a $LOG_FILE
        exit 1
        else
        echo -e " $2 its $G success $N " | tee -a $LOG_FILE
     fi   
        
}

USAGE()
{
    echo -e " $G USAGE:: $N sudo sh 16.redirectors.sh package1 package2..."
    exit 1
}

echo -e " $Y script started exection at $(date) $N"

CHECK_ROOT

if [ $# -eq 0 ]
then
USAGE
fi

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