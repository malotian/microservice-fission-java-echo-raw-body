#!/bin/bash
set -x #echo on
name=`basename $(pwd)`
zip -r ${name}.zip src pom.xml build.sh
fission route delete --name java-echo-post-raw-body
fission fn delete --name java-echo-post-raw-body
fission pkg delete --name ${name}
fission env delete --name java
fission env create --name java --image malotian/jvm-env --builder fission/jvm-builder --keeparchive --version 2
fission pkg create --name ${name} --sourcearchive ${name}.zip --env java
fission fn create --name java-echo-post-raw-body --pkg ${name} --entrypoint com.lingk.fission.api.JavaAddPost 
fission route create --name java-echo-post-raw-body --url /java-echo-post-raw-body --function java-echo-post-raw-body --method POST --createingress
