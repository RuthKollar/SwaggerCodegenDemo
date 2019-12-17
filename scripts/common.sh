#!/bin/bash

export codegenJar="swagger-codegen-cli.jar"
export codegenCliVersion="2.4.10"


if [ ! -d lib ] ; then
    echo "### Downloading swagger-codegen into lib directory..."
    mkdir -p lib
    pushd lib
    curl https://repo1.maven.org/maven2/io/swagger/swagger-codegen-cli/${codegenCliVersion}/swagger-codegen-cli-${codegenCliVersion}.jar > swagger-codegen-cli-${codegenCliVersion}.jar
    ln -s swagger-codegen-cli-${codegenCliVersion}.jar $codegenJar
    popd
fi

if [ ! -d api ] ; then
    echo "### copying swagger spec into api directory..."
    mkdir -p api
    cp scripts/swagger.yml api
fi

echo "### Updating npm..."
npm install npm -g
