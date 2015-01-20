sudo apt-get install docker.io -y
mkdir -p ~/mongodb/data
wget -O ~/mongodb/data http://media.mongodb.org/zips.json
docker build mongodb/
