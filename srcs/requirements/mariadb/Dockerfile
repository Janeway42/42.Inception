FROM debian:bullseye
# penultimate stable version of debian https://www.debian.org/releases/

RUN apt-get update
RUN apt-get install -y mariadb-server mariadb_client
# install mariadb && client

COPY tools/setup.sh /tmp/
# copy setup instructions to the temporary directory 
RUN chmod +x /tmp/setup.sh

RUN sed 's/bind_address = 127.0.0.1/bind-address = 0.0.0.0/' -i  /etc/mysql/mariadb.conf.d/50-server.cnf
# https://exampleconfig.com/view/mariadb-ubuntu18-04-etc-mysql-mariadb-conf-d-50-server-cnf
# https://www.gnu.org/software/sed/manual/sed.html#Introduction

RUN sed 's/skip-networking/#skip-networking/g' -i  /etc/mysql/mariadb.conf.d/50-server.cnf 
# uncomment the "skip-networking" option in the 50-server configuration file

ENTRYPOINT ["/tmp/setup_mariadb.sh"]