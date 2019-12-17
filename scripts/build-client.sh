#!/bin/bash

# https://cli.angular.io/

mkdir hello-world-client
cd hello-world-client

npm install -g npm
npm install -g @angular/cli@1.7.4
ng new client --skipGit=true --verbose=true

# Running client...
# $ cd client
# $ ng serve --open
