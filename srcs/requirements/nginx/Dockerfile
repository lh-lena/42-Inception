FROM debian:latest

# install nginx
RUN apt-get update && apt-get upgrade -y  && apt-get install -y nginx

#COPY: conf/nginx.conf /etc/nginx/conf.d

COPY /mnt/inception/src/index.html /usr/share/nginx/html/index.html

EXPOSE 80

#  keeps NGINX running in the foreground
CMD ["nginx", "-g", "daemon off;"] 
