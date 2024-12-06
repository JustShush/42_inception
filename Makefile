build:
	@mkdir -p /home/dimarque/data/wordpress
	@mkdir -p /home/dimarque/data/mariadb
	@docker compose -f srcs/docker-compose.yml up --build

clean:
	docker compose -f srcs/docker-compose.yml down

fclean: clean
	@rm -rf /home/dimarque/data/
	docker system prune -af

maria:
	docker exec -it mariadb bash

wp:
	docker exec -it wordpress bash

nginx:
	docker exec -it nginx bash

network:
	docker network ls

re: fclean build

