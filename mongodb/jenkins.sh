#!/bin/bash

mkdir -p ~/mongodb/data
wget --quiet -O ~/mongodb/data/zips.json http://media.mongodb.org/zips.json
docker pull mongo
docker pull ubuntu
docker rm -f mongodb ubuntu
docker run --name mongodb -d mongo
docker run --name ubuntu -d ubuntu
docker attach mongodb 'mongoimport --verbose --db zips --collection zips --type json mongodb/zips.json'
