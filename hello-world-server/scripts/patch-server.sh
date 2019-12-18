#!/bin/bash

# https://www.howtogeek.com/415442/how-to-apply-a-patch-to-a-file-and-create-patches-in-linux/
#
# cd scripts/hellow-world-server
# diff -u /Users/kollar/Git/swagger-codegen-test/build/hello-world-server/src/main/java/com/kollar/service/api/DefaultApi.java src/api/DefaultApi.java > DefaultApi.patch
# diff -u /Users/kollar/Git/swagger-codegen-test/build/hello-world-server/src/main/java/com/kollar/service/api/DefaultApiController.java src/api/DefaultApiController.java > DefaultApiController.patch
# diff -u /Users/kollar/Git/swagger-codegen-test/build/hello-world-server/.swagger-codegen-ignore .swagger-codegen-ignore > .swagger-codegen-ignore.patch

patch -uN build/hello-world-server/src/main/java/com/kollar/service/api/DefaultApi.java -i scripts/hello-world-server/DefaultApi.patch || true
patch -uN build/hello-world-server/src/main/java/com/kollar/service/api/DefaultApiController.java -i scripts/hello-world-server/DefaultApiController.patch || true
patch -uN build/hello-world-server/.swagger-codegen-ignore -i scripts/hello-world-server/.swagger-codegen-ignore.patch || true
