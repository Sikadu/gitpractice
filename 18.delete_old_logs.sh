#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs

if [ -d $SOURCE_DIR ]
then
echo "source dir $SOUCE_DIR exists"
else
echo "source dir $SOURCE_DIR doesn't exists"
exit 1
fi


FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)
echo "files:$FILES"


while IFS= read -r file #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
do
    echo "Deleting file: $file"
    rm -rf $file
done <<< $FILES