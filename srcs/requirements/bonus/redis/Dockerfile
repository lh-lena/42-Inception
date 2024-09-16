FROM	debian:buster

RUN		apt-get update && \
		apt-get install redis -y && \
		rm -rf /var/lib/apt/lists/*

RUN		mkdir /var/run/redis/

EXPOSE	6379

COPY	./conf/redis.conf /etc/redis/redis.conf


CMD [ "redis-server", "/etc/redis/redis.conf" ]

# Unix socket.
#
# Specify the path for the Unix socket that will be used to listen for
# incoming connections. There is no default, so Redis will not listen
# on a unix socket when not specified.
#

# Set a memory usage limit to the specified amount of bytes.
# MAXMEMORY POLICY: how Redis will select what to remove when maxmemory is reached
# allkeys-lru -> Evict any key using approximated LRU.
# LRU means Least Recently Used

# RUN		sed -i 'unixsocket /var/run/redis/redis.sock' /etc/redis/redis.conf
# 'unixsocketperm 777'
# 'maxmemory 128mb'
# 'maxmemory-policy allkeys-lru'
# 'save ""'

# You can restart it to let everything get configured using

# define('WP_CACHE_KEY_SALT', '${DOMAIN_NAME}');
# sudo systemctl restart redis.service
# # service redis-server restar
# Check the Redis status with this command:
# service redis-server status
# sudo systemctl status redis
# redis-cli -h [host IP or domain name] -p 7001

# see the real-time output of Redis serving cached queries
# redis-cli monitor
# redis-cli ping (output: PONG)

# RUN		apt-get update && \
# 		apt-get install php5-redis


# https://wetopi.com/redis-object-cache-for-wordpress/§
# https://github.com/sameersbn/docker-redis/tree/master