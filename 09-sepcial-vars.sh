#!/bin/bash

echo "allow all the variables to the script: $@"
echo "number of variables passed: $#"
echo "name of the script: $0"
echo "current working directory: $PWD" #CAPS
echo "home directory of current user: $HOME"
echo "PID of the script: $$"
sleep 100 &
echo "PID of last background command: $!"