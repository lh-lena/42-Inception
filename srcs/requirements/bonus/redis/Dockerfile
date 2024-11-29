FROM	debian:buster

RUN		apt-get update && \
		apt-get install redis -y && \
		rm -rf /var/lib/apt/lists/*

RUN		mkdir /var/run/redis/

EXPOSE	6379

COPY	./conf/redis.conf /etc/redis/redis.conf


CMD [ "redis-server", "/etc/redis/redis.conf" ]
