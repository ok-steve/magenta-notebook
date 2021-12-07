include .env

default: up

up:
	docker-compose up -d --remove-orphans

down: stop

start:
	docker-compose start

stop:
	docker-compose stop

shell:
	docker exec -it '$(PROJECT_NAME)_notebook' sh

build:
	docker build --rm -t magenta-notebook:latest .
