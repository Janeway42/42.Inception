all:
	mkdir -p /home/cpopa/data/mariadb
	mkdir -p /home/cpopa/data/wordpress
	sudo docker-compose -f srcs/docker-compose.yml up --build --remove-orphans
	@echo "All systems running!"

clean:
	sudo docker-compose -f srcs/docker-compose.yml down
	# sudo rm -rf ./srcs/web
	@echo "Containers down and out!"

squicky:
	sudo docker stop $$(sudo docker ps -qa) 2>/dev/null
	sudo docker rm $$(sudo docker ps -qa) 2>/dev/null || true
	sudo docker image prune -a --force 2>/dev/null
	sudo docker volume rm $$(sudo docker volume ls -q) 2>/dev/null
	sudo docker network prune --force 2>/dev/null || true
	sudo rm -rf /home/cpopa/data
	@echo "All super squicky clean!"

status:
	sudo docker ps -a