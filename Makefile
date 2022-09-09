.PHONY: dc-up
dc-up:
	docker compose up -d

.PHONY: dc-down
dc-down:
	docker compose down

.PHONY: state-conn
state-conn:
	curl -H "Accept:application/json" localhost:8083/

.PHONY: list-conn
list-conn:
	curl -H "Accept:application/json" localhost:8083/connectors

.PHONY: create-conn
create-conn:
	curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d $(JSON)
