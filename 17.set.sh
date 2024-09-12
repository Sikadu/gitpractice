#!/bin/bash

set -e

failure(){
    echo "failure at $1:$2"
}

trap 'failure "{$LINENO}" "$BASH_COMMAND"' ERR

echo "Hello World"
echooo "helo wodrld"
echo "whats up"