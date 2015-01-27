#!/bin/bash

docker --version
echo "Making MongoDB data directory..."
mkdir -p $(pwd)/data
sudo chown -R $(whoami): $(pwd)/data
echo "Downloading MongoDB data..."
wget --quiet -O $(pwd)/data/zips.json http://media.mongodb.org/zips.json
echo "Pulling Docker image: MongoDB..."
docker pull mongo > /dev/null 2>&1
echo "Removing any pre-existing Docker containers..."
docker rm -f mongodb-host mongodb-client > /dev/null 2>&1
echo "Starting up Docker container(s)..."
docker run --name mongodb-host -d mongo
mongohost_cid=$(docker -D inspect --format '{{ .Id }}' mongodb-host)
mongohost_ip=$(docker -D inspect --format '{{ .NetworkSettings.IPAddress }}' mongodb-host)
docker run -v $(pwd)/data:/data --name mongodb-client mongo mongoimport --quiet --host $mongohost_ip:27017 --db zips --collection zips --type json --file /data/zips.json
mongoclient_cid=$(docker -D inspect --format '{{ .Id }}' mongodb-client)
mongoclient_ip=$(docker -D inspect --format '{{ .NetworkSettings.IPAddress }}' mongodb-client)
