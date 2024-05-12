# all: 
# create directories for data storage 
# -p creates the intermediary directories if they don't exist
# start the services in detached mode
# https://docs.docker.com/compose/reference/
# https://docs.docker.com/engine/reference/commandline/compose_up/
# https://linuxhint.com/docker-remove-orphans/
all:
	mkdir -p /home/cpopa/data/mariadb
	mkdir -p /home/cpopa/data/wordpress
	sudo docker-compose -f srcs/docker-compose.yml up --build -d --remove-orphans
	@echo "All sistems go!"

# kill:
# stop and kill
kill:
	sudo docker-compose -f srcs/docker-compose.yml stop
	sudo docker-compose -f srcs/docker-compose.yml kill

# clean:
# down: stops containers and removes containers, networks, volumes, and images created by up
clean:
	sudo docker-compose -f srcs/docker-compose.yml down
	sudo rm -rf /home/cpopa/data/
	@echo "All cleaned up!"

status: 
	@docker ps

# mariadb
# show databases
maria-show:
	@docker exec -it mariadb bash -c "mysql -u root -p -e 'SHOW DATABASES;'"

# show mariadb logs 
maria-logs:
	@docker logs mariadb

# wordpress
# show containers
wp-docker:
	@docker ps -a | grep wordpress

# show logs
wp-logs:
	@docker logs wordpress
