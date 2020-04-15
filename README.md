# Swagger Codegen Demo

> The purpose of this repository is to create THE MOST minimal end-to-end example of a web client using <a href="https://cli.angular.io/">Angular CLI</a> communicating with a <a href="https://spring.io/projects/spring-boot">Spring Boot</a> server generated from a <a href="https://swagger.io/docs/open-source-tools/swagger-codegen/">Swagger Codegen</a> <a href="https://en.wikipedia.org/wiki/YAML">yml</a> API model.

## Step One: Build the Angular CLI node client
From the project directory you can rebuild a generic Angular CLI client ...

```
$ source ./scripts/common-exports.sh
$ rm -rf $angularCliAppBaseDir
$ ./scripts/build-client.sh
...
Project 'client' successfully created.
```

Then start the node server for the AngularCLI client available at 'http://localhost:4200/' ...

```
$ cd $angularCliAppBaseDir/client; ng serve --open
```

Stop the node server with '^C'.

## Step Two: Create the client node nodule for accessing the server REST API from the YML file
From the project directory, create a directory **api** and copy **./scripts/swagger.yml** to that directory. Then to build the REST API client and install it as a node module in the AngularCLI client created earlier ...

```
$ rm -rf $swaggerApiBaseDir
$ ./scripts/build-angular-typescript-swagger-codegen-api.sh
```

Again, start the client available at 'http://localhost:4200/'

```
$ cd $angularCliAppBaseDir/client; ng serve --open
```

## Step Three: Create the Spring Boot REST API server from the YML file
In the  module named **hello-world-server** you will need to open **File / Project Structure...** and set **/ Project Settings / Project / Project SDK:** to **1.8**, and **Project language level:** to **8 - Lambdas, type annotations etc.**.

Then refresh the gradle dependencies, and under the gradle tab **hello-world / Tasks / build** run the tasks **clean**, and then **jar**.

After that (also in IntelliJ) you can run (right click and select run) the class **io.swagger.Swagger2SpringBoot** found in **hello-world-server/build/hello-world-server/src/main/java**, or run the JAR file found at **hello-world-server/build/hello-world-server/libs/hello-world-server-0.0.1-SNAPSHOT.jar**.

You can test the server REST API endpoint using the following the **curl** utility from the command line:

```
$ brew install curl
$ curl -v -X GET -H "Content-Type: application/json" "http://localhost:8080/hello"
{"message":"Hello!"}
$ curl -v -X GET -H "Content-Type: application/json" "http://localhost:8080/hello?name=Froto"
{"message":"Hello Froto!"}
```

## Step Four: Putting it all together
Go to the AnngularCLI/ app running on http://localhost:4200 and enter a string in the text box next to the button that says "Send to Server" and click on the button.
The OpenAPI Angular/typescript client will send a message to the Java SpingBoot server and display the returned message below the box with the word "Hello " before the word that you entered and "!" after it.

