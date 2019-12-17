#!/bin/bash

export swaggerApiBaseDir="hello-world-swaggerApi"
export angularCliAppBaseDir="hello-world-client"

source ./scripts/common.sh

echo "### Creating base directory $swaggerApiBaseDir..."
if [ ! -d $swaggerApiBaseDir ] ; then
    mkdir -p $swaggerApiBaseDir
fi
cd $swaggerApiBaseDir


# NOTE: We are not going to use this, but making it to illustrate that there is a package that
# can do some of the grunt work above.

if [ ! -d node_modules ] ; then
    echo "### Installign ng-swagger-gen.."
    npm install ng-swagger-gen
fi    

# https://www.npmjs.com/package/ng-swagger-gen
if [ ! -d ngclient ] ; then
    echo "### Building ngclient using ng-swagger-gen..."
    mkdir -p ngclient
    # Generate a json file from the yaml file...
    #java -jar lib/$codegenJar generate -l swagger -i ../api/swagger.yml -o spec

    node_modules/.bin/ng-swagger-gen -i ../../api/swagger.yml -o ngclient
fi

echo "Done!"
