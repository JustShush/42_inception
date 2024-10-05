build:
	docker compose -f srcs/docker-compose.yml up --build


fclean: clean
	docker system prune -af

clean:
	docker compose -f srcs/docker-compose.yml down

re: clean build

ree: fclean build