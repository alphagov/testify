FROM mongo:latest

ADD ./run.sh mongodb/run.sh
ADD ./mongod.conf mongodb/mongo.conf
RUN mongodb/run.sh
