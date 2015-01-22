FROM mongo:latest

ADD ./run.sh mongodb/run.sh
ADD ./mongo.conf mongodb/mongo.conf
RUN mkdir -p ~/mongodb/data
ADD zips.json mongodb/zips.json
RUN mkdir -p /var/log/mongodb
RUN touch /var/log/mongodb/mongodb.log
RUN chown mongodb:mongodb /var/log/mongodb/mongodb.log
