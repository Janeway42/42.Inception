all : up

up : 
	@docker-compose -f ./srcs/docker-compose.yml up -d #docker compose file file_name detached_mode

down : 
	@docker-compose -f ./srcs/docker-compose.yml down

stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@docker-compose -f ./srcs/docker-compose.yml start

status : 
	@docker ps


NAME = inception

all:
	sudo docker-compose -f ./srcs/docker-compose.yml up  -d 
	# docker-compose up --build -d --remove orphans
	# https://docs.docker.com/compose/reference/
	# https://docs.docker.com/engine/reference/commandline/compose_up/

stop:
	sudo docker-compose -f ./srcs/docker-compose.yml down 
	# stops containers and removes containers, networks, volumes, and images created by docker-compose up,

kill:
	sudo docker-compose -f ./srcs/docker-compose.yml kill 
	# forces running containers to stop by sending a SIGKILL signal

clean:
	sudo docker-compose -f ./srcs/docker-compose.yml down 
	# stops containers and removes containers, networks, volumes, and images created by docker-compose up

status:
	sudo docker ps


