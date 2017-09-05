#! /bin/bash

# set runtime configuration
sed -i "s/^broker.id=.*$/broker.id=`date +%s`/" kafka/config/server.properties

# wait for zookeeper
while ! timeout 1 cat < /dev/null > /dev/tcp/zookeeper/2181
do
  echo "Waiting for Zookeeper..."
  sleep 1;
done;

# start kafka
./kafka/bin/kafka-server-start.sh kafka/config/server.properties
