#!/bin/bash

mkdir -p ~/mongodb/data
wget --quiet -O ~/mongodb/data/zips.json http://media.mongodb.org/zips.json
docker build --force-rm=true --no-cache=true mongodb/
