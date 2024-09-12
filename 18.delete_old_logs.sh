#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs

if [ -d $SOURCE_DIR ]
then
echo "source dir doesn't exists"
exit 1
else
echo "source dir $SOURCE_DIR exists"
fi

files . *.log -mtime

FILES=$(find $SOURCE_DIR "*.log" -mtime +14)
echo "files:$FILES"