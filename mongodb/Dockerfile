FROM mongo:latest

ADD mongodb/run.sh mongodb/run.sh
ADD mongodb/mongo.conf mongodb/mongo.conf
ADD ~/mongodb/data/zips.json mongodb/zips.json
RUN mkdir -p /var/log/mongodb
RUN touch /var/log/mongodb/mongodb.log
RUN chown mongodb:mongodb /var/log/mongodb/mongodb.log
