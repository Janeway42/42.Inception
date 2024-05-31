FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
RUN chmod 775 /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script.sh .

RUN mkdir /run/mysqld && chmod +x script.sh

CMD ["./script.sh"]