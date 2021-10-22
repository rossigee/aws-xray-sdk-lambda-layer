#!/usr/bin/env bash

LAYER_NAME=aws-xray-sdk
ZIP_ARTIFACT=$(pwd)/${LAYER_NAME}.zip

tmpdir=$(mktemp -d)

docker run --rm -v ${tmpdir}/python:/target/python python:3.9 pip3 install aws-xray-sdk --prefix /target/python

cd $tmpdir
zip -r ${ZIP_ARTIFACT} .

echo "Publishing layer to AWS..."
aws lambda publish-layer-version --layer-name ${LAYER_NAME} --zip-file fileb://${ZIP_ARTIFACT} --compatible-runtimes python3.9

# clean up (writes as root)
#rm -rf ${tmpdir}
#rm -r ${ZIP_ARTIFACT}
