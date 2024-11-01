build:
	docker compose -f srcs/docker-compose.yml up --build

clean:
	docker compose -f srcs/docker-compose.yml down

fclean: clean
	docker system prune -af

re: fclean build

