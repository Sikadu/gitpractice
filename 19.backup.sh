#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USAGE() {
    echo "USAGE:: sh 19.backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS>"
    }

if [ $# -lt 2 ] 
then
    USAGE
    exit 1
fi

if [ ! -d $SOURCE_DIR ]
then
echo "$SOURCE_DIR doesnt exit please check it"
fi

if [ ! -d $DEST_DIR ]
then
echo "$DEST_DIR doesn't exit pleasse check it"
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)

echo FILES=$FILES

if [ ! -z $FILES]
then
echo "files are found"
ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
find ${SOUCE_DIR} -name "*.log" -mtime +14 | zip "$ZIP_FILE" -@

if [ -f $ZIP_FILE]
then
        echo "Successfully zippped files older than $DAYS"

 while IFS= read -r file
do
echo "Deleting files: $file" 
rm -rf $file
done <<<$FILES
else
        echo "Zipping the files is failed"
        exit 1
    fi
else
    echo "No files older than $DAYS"
fi   