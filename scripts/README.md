# Notes for building the hellow-world client

This involves first building tha Angular-cli node server by going to the project root directory and executing

$ ./scripts/build-client.sh

Then build the angular-typescript api to the server by going again to the root directory and executing

$ ./scripts/build-angular-typescript-swagger-codegen-api.sh

This will not only build the api as a node module, but will install it in the Angular-cli client built above. It will also make some changes to use the api.
