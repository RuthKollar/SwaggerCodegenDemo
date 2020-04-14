#!/bin/bash

# https://cli.angular.io/

which npm > /dev/null
result="$?"
if [ "$result" -ne 0 ]; then
    # https://brew.sh/
    echo "Please install npm with 'brew install npm'"
    exit 1
fi

mkdir hello-world-client
cd hello-world-client

npm install -g npm
npm install -g @angular/cli@1.7.4
ng new client --skipGit=true --verbose=true

echo "$ cd hello-world-client/client"
echo "Running client..."
echo "$ ng serve --open"
echo "Running client with WebStorm..."
echo "$ ng serve --open --inspect"
