.PHONY: connector-state
connector-state:
	curl -H "Accept:application/json" localhost:8083/

.PHONY: connector-list
connector-list:
	curl -H "Accept:application/json" localhost:8083/connectors

.PHONY: connector-create
connector-create:
	curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d $(JSON)