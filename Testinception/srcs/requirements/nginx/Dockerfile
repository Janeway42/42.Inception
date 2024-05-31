FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx \
    openssl
RUN apt-get -y install libfcgi0ldbl 

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/nginx/ssl/cpopa.key -out /etc/nginx/ssl/cpopa.crt -subj "/O=42 The Network/CN=cpopa.42.fr"

COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

EXPOSE 443 

CMD ["nginx", "-g", "daemon off;"]