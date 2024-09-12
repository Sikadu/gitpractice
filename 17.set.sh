#!/bin/bash

set -e

failure(){
    echo "failure at $1:$2"
}

trap 'failure{"$line"} "$bash_command"' ERR

echo "Hello World"
echooo "helo wodrld"
echo "whats up"