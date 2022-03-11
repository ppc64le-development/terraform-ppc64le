#!/bin/bash

git clone https://github.com/rpsene/goconfig.git
cd ./goconfig
source ./go.sh install 1.17.8

cd ..
git clone https://github.com/hashicorp/terraform.git
cd terraform
export TAG=$(git describe --tags `git rev-list --tags --max-count=1`)
git checkout tags/$TAG

env GOOS=linux GOARCH=ppc64le go build .
