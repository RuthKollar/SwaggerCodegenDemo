# Swagger Codegen Demo

> The purpose of this repository is to create THE MOST minimal end-to-end example of a web client using <a href="https://cli.angular.io/">Angular-CLI</a> communicating with a <a href="https://spring.io/projects/spring-boot">Spring Boot</a> server generated from a <a href="https://swagger.io/docs/open-source-tools/swagger-codegen/">Swagger Codegen</a> <a href="https://en.wikipedia.org/wiki/YAML">yml</a> API model.

## Step One (create the client)
Cd to the project directory and run './scripts/build-client.sh' to build a generic Angular-CLI client.

## Step Two (create the client API to the server from the YML file)
Cd to the project directory and create a directory 'api' and copy './scripts/swagger.yml' to that directory. Then run './scripts/build-angular-typescript-swagger-codegen-api.sh' to build the server API and install it in the client module created earlier. Then "cd hello-world-client/client; ng serve" to start <a href="http://localhost:4200/">client</a>.

##Step Three (create the Spring Boot MSAPI server from the YML file)
CD to the project directory and using Intellij create a project named 'hello-world-server'


