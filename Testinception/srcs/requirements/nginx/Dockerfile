FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y nginx \
    openssl
RUN apt-get -y install libfcgi0ldbl 

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/nginx/ssl/cpopa.key -out /etc/nginx/ssl/cpopa.crt -subj "/CN=$DOMAIN_NAME"

# COPY ./conf/default /etc/nginx/sites-available/.
COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 443 

CMD ["nginx", "-g", "daemon off;"]