FROM debian:buster

# install nginx
RUN	apt-get update && \
	apt-get upgrade -y  && \
	apt-get install nginx -y && \
	apt-get install openssl -y 

# accessing the container terminal
RUN	apt-get update && \
	apt-get install vim -y && \
	apt-get install curl -y

# a new folder will the certificate and the key  for a secure connection
RUN	mkdir -p /etc/nginx/ssl

EXPOSE 443
# generate a SSL certificate.
# req - primarily creates and processes certificate requests in PKCS#10 format.
# -x509 - the keyword to dpecify the type of certificate.
# -nodes - the option will leave our private key empty
# -out - the option to store created certificate.
# -keyout - the option to store created key.
# -subj - the option allows us to pre-fill information to the certificate
# "/C=xx/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=HostName"
RUN	openssl req -x509 -newkey rsa:4096 -nodes \
	-keyout /etc/nginx/ssl/inception.key \
	-out /etc/nginx/ssl/inception.crt \
	-subj "/C=DE/ST=IDF/L=Berlin/O=42/OU=42Berlin/CN=ohladkov.42.fr/UID=ohladkov"

# create a folder to store the NGINX config files
RUN	mkdir -p /var/run/nginx

#??? do we have to remove config files first
RUN	rm -f /etc/nginx/nginx.conf 

COPY	./conf/nginx.conf /etc/nginx/nginx.conf

# gives rights
RUN	chmod 755 /var/www/html
RUN	chown -R www-data:www-data /var/www/html

#  keeps NGINX running in the foreground
CMD ["nginx", "-g", "daemon off;"] 
