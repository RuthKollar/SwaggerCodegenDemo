# Swagger Codegen Demo

> The purpose of this repository is to create THE MOST minimal end-to-end example of a web client using <a href="https://cli.angular.io/">Angular CLI</a> with a communicating with a <a href="https://spring.io/projects/spring-boot">Spring Boot</a> server generated from a <a href="https://swagger.io/docs/open-source-tools/swagger-codegen/">Swagger Codegen</a> <a href="https://en.wikipedia.org/wiki/YAML">yml</a> API model.

## Fire it up and check it out
Because (I hope) you are impatient to see this thing work, this section shows you how to start up the node and REST API servers and let you play around without rebuilding anything.

First start up the **Spring Boot REST API server** built from the yaml model...
```
$ java -jar hello-world-server/build/hello-world-server/libs/hello-world-server-0.0.1-SNAPSHOT.jar
```

Then rebuild the **node_modules* directory from the **package.json** file, and start up the **Node server with the OpenAPI client** built from the yaml model for communicaton with the server above...
```
$ cd hello-world-client/client; npm install; ng serve --open
```

On the web page that appears enter text in the box to the left of the **Send to Server** button, and click the button. The text that you entered will be sent to the REST API server using an OpenAPI client and the response will be displayed below the text box.

I like to use Chrome Developer Tools to look at the network access and set breakpoints in the browser. If you start the REST API server within IntelliJ in debug mode you can set breakpoints in the server and confirm that the request goes to the server.

Enjoy!

## Step One: Build the Angular CLI node client
From the project directory you can rebuild a generic Angular CLI client ...

```
$ source ./scripts/common-exports.sh
$ rm -rf $angularCliAppBaseDir
$ ./scripts/build-client.sh
...
Project 'client' successfully created.
```

Then start the node server for the AngularCLI client available at [http://localhost:4200/](http://localhost:4200/) ...

```
$ cd hello-world-client/client; npm install; ng serve --open
```

Stop the node server with '^C'.

## Step Two: Create the client Node module (from the YML file) for accessing the server REST API
From the project directory, create a directory **api** and copy **./scripts/swagger.yml** to that directory. Then to build the REST API client and install it as a node module in the AngularCLI client created earlier ...

```
$ mkdir -p ./api
$ cp ./scripts/swagger.yml ./api
$ rm -rf $swaggerApiBaseDir
$ ./scripts/build-angular-typescript-swagger-codegen-api.sh
```

Again, start the client available at [http://localhost:4200/](http://localhost:4200/) ...

```
$ cd hello-world-client/client; npm install; ng serve --open
```

## Step Three: Create the Spring Boot REST API server from the YML file
In the  module named **hello-world-server** you will need to open **File / Project Structure...** and set **/ Project Settings / Project / Project SDK:** to **1.8**, and **Project language level:** to **8 - Lambdas, type annotations etc.**.

Then refresh the gradle dependencies, and under the gradle tab **hello-world / Tasks / build** run the task **clean**, and in **hello-world / Tasks / shadow** run the task **shadowJar**.

After that (also in IntelliJ) you can run (right click and select run) the class **io.swagger.Swagger2SpringBoot** found in **hello-world-server/build/hello-world-server/src/main/java**, or run the JAR file found at **hello-world-server/build/hello-world-server/libs/hello-world-server-0.0.1-SNAPSHOT.jar**. Alternatively, from the command line...

```
$ cd hello-world-server
$ rm -rf build
$ ./gradlew clean shadowJar
$ java -jar build/hello-world-server/libs/hello-world-server-0.0.1-SNAPSHOT.jar
```

You can test the server REST API endpoint [http://localhost:8080/hello](http://localhost:8080/hello) using the following the **curl** utility from the command line:

```
$ brew install curl
$ curl -v -X GET -H "Content-Type: application/json" http://localhost:8080/hello
{"message":"Hello!"}
$ curl -v -X GET -H "Content-Type: application/json" http://localhost:8080/hello?name=Froto
{"message":"Hello Froto!"}
```

As you can see that the REST API endpoint simply returns an object with one attribute **message**. The value of that attribute is the string **Hello!**. If an optional **name** parameter was sent with the HTTP request then the value if the attribute will be **Hello *value-of-name*!**.

## Step Four: Putting it all together
Go to the AnngularCLI/ app running on [http://localhost:4200](http://localhost:4200) and enter a string in the text box to the left of to the button that says **Send to Server** and click on the button.

The OpenAPI Angular/typescript client will send a message to the Java SpingBoot server and display the returned message below the box.
