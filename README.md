# Swagger Codegen Demo

> The purpose of this repository is to create THE MOST minimal end-to-end example of a web client using <a href="https://cli.angular.io/">Angular-CLI</a> communicating with a <a href="https://spring.io/projects/spring-boot">Spring Boot</a> server generated from a <a href="https://swagger.io/docs/open-source-tools/swagger-codegen/">Swagger Codegen</a> <a href="https://en.wikipedia.org/wiki/YAML">yml</a> API model.

## Step One: Build the client
From the project directory and run './scripts/build-client.sh' to build a generic Angular-CLI client.

NOTE: To rebuild the client

$ source ./scripts/common-exports.sh

$ rm -rf $angularCliAppBaseDir

then build the client...

$ ./scripts/build-client.sh

...

Project 'client' successfully created.

then start the client...

$ cd $angularCliAppBaseDir/client; ng serve --open

The client should be available at 'http://localhost:4200/'

Stop the client '^C'.

## Step Two: Create the client API to the server from the YML file
From the project directory, create a directory 'api' and copy './scripts/swagger.yml' to that directory. Then to build the server API and install it in the client module in the client created earlier run...

$ rm -rf $swaggerApiBaseDir

$ ./scripts/build-angular-typescript-swagger-codegen-api.sh

Again, start the client available at 'http://localhost:4200/'

$ cd $angularCliAppBaseDir/client; ng serve --open

##Step Three: Create the Spring Boot MSAPI server from the YML file and test
CD to the project directory and using Intellij create a project named 'hello-world-server'.

You will need to make sure that the "Project Settings / Project", "Project SDK", and "Project Language Level" are both set to Java '1.8'.

Then refresh the gradle dependencies, and under the gradle 'hello-world / Tasks / build' run the tasks 'clean', and then 'jar'.

After that you can run the class 'io.swagger.Swagger2SpringBoot' found in 'hello-world-server/build/hello-world-server/src/main/java', or run the JAR file found at 'hello-world-server/build/hello-world-server/libs/hello-world-server-0.0.1-SNAPSHOT.jar'

You can test the server REST API endpoint using the following at the command line:

$ curl -v -X GET -H "Content-Type: application/json" "http://localhost:8080/hello"

{"message":"Hello!"}

and

$ curl -v -X GET -H "Content-Type: application/json" "http://localhost:8080/hello?name=Froto"

{"message":"Hello Froto!"}

##Step Four: Putting it all together
Go to the AnngularCLI/ app running on http://localhost:4200 and enter a string in the text box next to the button that says "Send to Server" and click on the button.
The OpenAPI Angular/typescript client will send a message to the Java SpingBoot server and display the returned message below the box with the word "Hello " before the word that you entered and "!" after it.

