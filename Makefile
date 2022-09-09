.PHONY: up
up:
	docker compose up -d

.PHONY: down
down:
	docker compose down

.PHONY: clean
clean:
	docker system prune

.PHONY: state-conn
state-conn:
	curl -H "Accept:application/json" localhost:8083/

.PHONY: list-conn
list-conn:
	curl -H "Accept:application/json" localhost:8083/connectors

.PHONY: create-conn
create-conn:
	curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d $(JSON)
