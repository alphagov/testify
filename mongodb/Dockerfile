FROM mongo:latest

ADD ./run.sh mongodb/run.sh
ADD ./mongo.conf mongodb/mongo.conf
RUN cat /etc/apt/sources.list
RUN apt-get update && apt-get install -y net-tools
RUN apt-get update && apt-get install -y netstat-nat lsof
RUN mkdir -p ~/mongodb/data
ADD zips.json mongodb/zips.json
RUN mkdir -p /var/log/mongodb
RUN touch /var/log/mongodb/mongodb.log
RUN chown mongodb:mongodb /var/log/mongodb/mongodb.log
RUN mongod --config mongodb/mongo.conf
RUN sleep 10
RUN cat /var/log/mongodb/mongodb.log
RUN ifconfig
RUN df -h
RUN mongoimport --verbose --db zips --collection zips --type json --file mongodb/zips.json
