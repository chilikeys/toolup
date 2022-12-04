#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install -y gcc
#go install

echo "Installing Golang"
wget "https://go.dev/dl/go1.19.3.linux-amd64.tar.gz"
sudo rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.3.linux-amd64.tar.gz
echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile	
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile
source ~/.bash_profile
go version && echo "Go installed!" || echo "something went wrong :/"

# Project Discovery

echo "Installing nuclei"
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
echo "nuclei installed!"

echo "Installing nuclei templates"
nuclei -ut && echo "templates installed!" || echo "something went wrong :/"

echo "Installing httpx"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest && echo "httpx installed!" || echo "something went wrong :/"


