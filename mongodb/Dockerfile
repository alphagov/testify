FROM mongo:latest

ADD ./run.sh mongodb/run.sh
ADD ./mongo.conf mongodb/mongo.conf
RUN apt-get update
RUN mkdir -p ~/mongodb/data
ADD zips.json mongodb/zips.json
RUN mkdir -p /var/log/mongodb
RUN touch /var/log/mongodb/mongodb.log
RUN chown mongodb:mongodb /var/log/mongodb/mongodb.log
RUN mongod --fork --logpath /var/log/mongodb/mongodb.conf --dbpath ~/mongodb/data
RUN apt-get install -y netcat
RUN ufw status
RUN ufw allow 27017/tcp
RUN ufw status
RUN nc 127.0.0.1 27017
RUN mongoimport --verbose --db zips --collection zips --type json --file mongodb/zips.json
