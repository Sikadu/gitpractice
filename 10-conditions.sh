#!/bin/bash

#NUMBER=$1

#if [ $NUMBER -gt 20 ]
#then
#    echo "given number: $NUMBER is greater than 20"
#else
#    echo "given number: $NUMBER is less than 20"
#fi


NUMBER=$1

if [ $NUMBER -gt 20 ] #gt, lt, eq, -ne, -ge, -le
then
    echo "Given number: $NUMBER is greater than 20"
else
    echo "Given number: $NUMBER is less than 20"
fi