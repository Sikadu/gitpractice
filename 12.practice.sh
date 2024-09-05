#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]

then 

echo " user don't have root access to run the script "
exit 1

else 

echo " user have root access "

fi