all:
	mkdir -p /home/cpopa/data/mariadb
	mkdir -p /home/cpopa/data/wordpress
	sudo docker-compose -f srcs/docker-compose.yml up --build --remove-orphans
	@echo "All systems running!"

clean:
	sudo docker-compose -f srcs/docker-compose.yml down
	# sudo rm -rf ./srcs/web
	@echo "Containers cleanned up!"

superclean:
	# sudo docker-compose -f srcs/docker-compose.yml down
	# sudo rm -rf ./srcs/web
	sudo rm -rf /home/cpopa/data
	sudo docker image prune -a
	# sudo docker remove $(sudo docker images -a | grep "nginx")
	# sudo docker rmi $(sudo docker images -a | grep "mariadb")
	# sudo docker rmi $(sudo docker images -a | grep "wordpress")
	@echo "Super all cleanned up!"

status:
	sudo docker ps -a