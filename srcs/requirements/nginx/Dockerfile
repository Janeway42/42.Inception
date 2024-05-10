FROM debian:bullseye
# penultimate stable version of debian https://www.debian.org/releases/

ARG DOMAIN
ARG OWNER
# https://vsupalov.com/docker-arg-env-variable-guide/#arg-and-env

RUN apt-get update 
RUN apt-get -y install nginx
RUN apt-get -y install openssl
# update && nginx install
# OpenSSL provides a comprehensive set of cryptographic functions, 
# protocols, and tools, making it suitable for a wide variety of applications 
# and use cases. In addition to SSL/TLS it also supports various encryption algorithms, 
# key management, and certificate-related operations.

RUN apt-get -y install libfcgi0ldbl 
# FastCGI is a language independent, scalable, open extension to CGI that provides high performance 
# without the limitations of server specific APIs. 

COPY /conf/nginx.conf /etc/nginx/conf.d/default.conf
# copy custom config file over the default nginx file 

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/nginx/$DOMAIN_OWNER.key -out /etc/nginx/$DOMAIN_OWNER.crt -subj "/CN=$DOMAIN_NAME"
# https://stackoverflow.com/questions/10175812/how-to-generate-a-self-signed-ssl-certificate-using-openssl
# https://expeditedsecurity.com/blog/measuring-ssl-rsa-keys/

RUN mkdir -p /run/nginx
EXPOSE 443 
# nginx config && expose the port for the nginx container 

CMD ["nginx", "-g", "daemon off;"]
# run once the container is up and about 

#////////////////////////////

# interactive: 
# openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 365

# non-interactive and 10 years expiration
# openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 3650 -nodes -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CommonNameOrHostname"
