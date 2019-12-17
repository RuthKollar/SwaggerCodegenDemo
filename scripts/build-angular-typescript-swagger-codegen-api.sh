#!/bin/bash

export swaggerApiBaseDir="hello-world-swaggerApi"
export angularCliAppBaseDir="hello-world-client"

source ./scripts/common.sh

echo "### Creating base directory $swaggerApiBaseDir..."
if [ ! -d $swaggerApiBaseDir ] ; then
    mkdir -p $swaggerApiBaseDir
fi
cd $swaggerApiBaseDir

if [ ! -d client ] ; then
    # https://angular.schule/blog/2018-04-swagger-codegen
    echo "### Build the client from the swagger definition..."
    mkdir -p client
    #java -jar ../lib/$codegenJar help generate
    # For the config options...
    #java -jar ../lib/$codegenJar config-help -l typescript-angular

    # The ngVersion in the cliet-options.json file should match the cliet package-lock.json @angular/? verisons.
    export packageLockJson=../$angularCliAppBaseDir/client/package-lock.json
    if [ ! -f $packageLockJson ] ; then
        echo "??? The client/package-lock.json file was not found where expected..."
        echo "??? The client must be built first because we need to copy the ngVersion from it!!!"
        exit
    fi
    echo "### client package-lock.hson file is: $packageLockJson"
    export ngVersion=`jq '.dependencies."@angular/common".version' < $packageLockJson < $packageLockJson`
    echo "### client ngVersion is: $ngVersion"
    export clientOptionsJson=../scripts/client-options.json
    jq ".ngVersion = "$ngVersion"" < $clientOptionsJson 1<> $clientOptionsJson
    echo "### updated $clientOptionsJson file with ngVersion from client app..."
    cat $clientOptionsJson

    echo "### Building the client API..."
    java -jar ../lib/$codegenJar generate -l typescript-angular -i ../api/swagger.yml -o client -c $clientOptionsJson

    echo "### Compile the Angular package to the dist directory..."
    pushd client
    # https://docs.npmjs.com/cli/install
    # Install the dependencies in the local node_modules folder...
    npm install

    if [ ! -f package.json ] ; then
        echo "!!! package.json should be found in the client directory for the build to work???"
        exit
    fi
    # https://docs.npmjs.com/cli/build.html
    echo "### Building npm module..."
    npm build

    # https://docs.npmjs.com/cli/pack.html
    echo "### Packaging npm module..."
    npm pack

    echo "### Installing Swagger API into Angular client app node_modules..."
    # https://medium.com/@the1mills/how-to-test-your-npm-module-without-publishing-it-every-5-minutes-1c4cb4b369be
    # See section "The First Solution"
    #cd ../../$angularCliAppBaseDir/client ; npm install ../../$swaggerApiBaseDir/client
    export npmVersion=`cat ../$clientOptionsJson | node -pe 'JSON.parse(fs.readFileSync(0)).npmVersion'`
    export npmName=`cat ../$clientOptionsJson | node -pe 'JSON.parse(fs.readFileSync(0)).npmName'`
    # https://docs.npmjs.com/cli/install
    # Installs the package hello-world-api in hello-world-client/node_modules.
    # Also, adds reference to api to the hello-world-client/client/package.json file.
    cd ../../$angularCliAppBaseDir/client ; npm install --save-dev ../../$swaggerApiBaseDir/client/${npmName}-${npmVersion}.tgz

    # npm WARN hello-world-api@0.0.1 requires a peer of zone.js@^0.7.6 but none is installed. You must install peer dependencies yourself.
    echo "### Installing peer dependency on zone.js..."
    cd ../../$angularCliAppBaseDir/client ; npm install zone.js@^0.7.8
    # ts is missing from the TypeScript compilation.
    # https://stedolan.github.io/jq/

    # echo "### Modifying TypeScript version to make it compatible with jasmine but now with Angular (horror)..."
    # export packageJson=../../$angularCliAppBaseDir/client/package.json
    # jq '.devDependencies.typescript = "^2.9.2"' < $packageJson 1<> $packageJson

    # @angular/compiler-cli@5.2.11 requires typescript@'>=2.4.2 <2.7.0' but 2.9.2 was found instead.
    # Using this version can result in undefined behaviour and difficult to debug problems.
    # Please run the following command to install a compatible version of TypeScript.
    echo "### Installing Typescript version required by @angular/compiler-cli@5.2.11..."
    cd ../../$angularCliAppBaseDir/client ; npm install typescript@'>=2.4.2 <2.7.0'

    # https://stackoverflow.com/questions/51572640/index-ts-is-missing-from-the-typescript-compilation
    echo "### Adding TypeScript inclusion for the Swagger client module as it is no longer provided..."
    export tsconfigAppJson=../../$angularCliAppBaseDir/client/src/tsconfig.app.json
    jq '. + {"include": [ "../node_modules/hello-world-api/**/*.ts", "./**/*.ts" ]}' < $tsconfigAppJson 1<> $tsconfigAppJson

    echo "### Modifying the API_BASE_PATH for the Swagger Code Gen Client API to match that of the server..."
    # https://angular.schule/blog/2018-04-swagger-codegen
    # Need to add "API_BASE_PATH: 'http://localhost:8080'" after "production: false,"
    export localEnvironmentTs=../../$angularCliAppBaseDir/client/src/environments/environment.ts
    sed "s/  production: false/  production: false, API_BASE_PATH: 'http:\/\/localhost:8080'/" < $localEnvironmentTs 1<> $localEnvironmentTs

    echo "### Copying client/src/app files..."
    cp ../../scripts/client/src/app/* ../../$angularCliAppBaseDir/client/src/app

    echo "### One last npm install..."
    cd ../../$angularCliAppBaseDir/client ; npm install

    echo "###"
    echo "### Start client with...."
    echo "### $ ng serve --open"
    echo "###" 
   popd
fi

echo "Done!"
