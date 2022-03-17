#!/bin/bash

git clone https://github.com/rpsene/goconfig.git
cd ./goconfig
source ./go.sh install 1.17.8

cd ..
git clone https://github.com/hashicorp/terraform.git
cd terraform
TF_LATEST=$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d '"' -f4)
if [ $# -eq 0 ]
  then
    export TAG=$TF_LATEST
else
    export TAG=$1
fi

git checkout tags/$TAG

env GOOS=linux GOARCH=ppc64le go install .
