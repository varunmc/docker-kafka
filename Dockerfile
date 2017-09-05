FROM openjdk:8

WORKDIR /opt

COPY init.sh .

RUN wget -q http://apache.claz.org/kafka/0.11.0.0/kafka_2.11-0.11.0.0.tgz -O - | tar zxf - &&\
		mv kafka_2.11-0.11.0.0 kafka &&\
		sed -i "s/^#advertised.listeners=.*$/advertised.listeners=PLAINTEXT:\/\/kafka:9092/" kafka/config/server.properties &&\
		sed -i "s/^#delete.topic.enable=.*$/delete.topic.enable=true/" kafka/config/server.properties &&\
		echo "\nreserved.broker.max.id=2147483647" >> kafka/config/server.properties &&\
		sed -i "s/^zookeeper.connect=.*$/zookeeper.connect=zookeeper:2181/" kafka/config/server.properties &&\
		chmod +x init.sh

EXPOSE 9092

ENTRYPOINT ["./init.sh"]
