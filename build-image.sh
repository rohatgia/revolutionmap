#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd ${SCRIPT_DIR}

exe() { echo; echo; echo; "### $@" ; "$@" ; }

"First we will build the server"
cd backend
sudo docker build --rm -t webserver:latest .
echo "Server build completed!"
echo ""

echo "Second we will build the UI"
cd ../frontend/my-app
sudo docker build --rm -t webui:latest .
echo "UI build completed!"
echo ""

echo "Now we will push the server image"
sudo docker push webserver:latest

echo "Now we will push the UI image"
sudo docker push webui:latest

while getopts f: option
do
case "${option}"
in
f) FILENAME=${OPTARG};
esac
done