#!/usr/bin/env bash

TF_VER=${TF_VERSION:-1.6.0}
TF_PLUGINS_DIR=${TF_PLUGINS_DIR:-~/.terraform.d/plugins}

OS=`uname | tr 'A-Z' 'a-z'`

if [ ! -f ./bin/terraform ]; then
    echo "Downloading terraform $TF_VER..."
    mkdir -p ./bin
    curl -o ./bin/terraform_$TF_VER\_$OS\_amd64.zip https://releases.hashicorp.com/terraform/$TF_VER/terraform_$TF_VER\_$OS\_amd64.zip
    unzip ./bin/terraform_$TF_VER\_$OS\_amd64.zip -d ./bin
    rm ./bin/terraform_$TF_VER\_$OS\_amd64.zip
else
    echo "terraform binary exists, done"
fi
