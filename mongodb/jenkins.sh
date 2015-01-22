#!/bin/bash

mkdir -p ~/mongodb/data
wget --quiet -O ~/mongodb/data/zips.json http://media.mongodb.org/zips.json
docker build mongodb/
docker run -v /Users/ajlanghorn/Desktop:/mnt/mongodb 096454c06e32
