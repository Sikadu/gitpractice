#!/bin/bash

SOURCE_DIR=$/home/ec2-user/logs

if [ -d $SOURCE_DIR ]
then
echo "source dir doesn't exists"
exit1
else
echo "source dir $SOURCE_DIR exists"
fi