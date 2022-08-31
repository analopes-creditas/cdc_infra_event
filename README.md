# Infra-event

## Debezium-Kafka Connect (executados fora do container)

- Validar funcionamento
```
$ curl -H "Accept:application/json" localhost:8083/
```
    ``` output
    {"version":"3.2.0","commit":"38103ffaa962ef50","kafka_cluster_id":"8SSoSCoDRsmIdgk2mLtYMw"}
    ```

Caso ocorra erro de funcionamento, execute os passos abaixo e valide novamente

    $ docker compose down
    $ docker system prune
    $ docker compose up -d

- Criar conector
```
$ curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d @postgres-connector.json
```
    ``` output
    HTTP/1.1 201 Created
    Date: Tue, 30 Aug 2022 22:01:56 GMT
    Location: http://localhost:8083/connectors/postgres-connector
    Content-Type: application/json
    Content-Length: 388
    Server: Jetty(9.4.44.v20210927)

    {"name":"postgres-connector","config":{"connector.class":"io.debezium.connector.postgresql.PostgresConnector","database.hostname":"postgres","database.port":"5432","database.user":"start_data_engineer","database.password":"pgpwd","database.dbname":"datahub","database.server.name":"dbserver","table.whitelist":"public.data_product","name":"postgres-connector"},"tasks":[],"type":"source"}%
    ```

- Listar conectores
```
$ curl -H "Accept:application/json" localhost:8083/connectors/
```
    ``` output
    ["postgres-connector"]%
    ```


## Kafka Cli (executados dentro do container)

- Acessar container
```
$ docker exec -it kafka bash
```

- Listar topicos
```
$ bin/kafka-topics.sh --bootstrap-server kafka:9092 --list
```
    ``` output
    __consumer_offsets
    dbserver.public.data_product
    my_connect_configs
    my_connect_offsets
    my_connect_statuses
    ```

- Consumer
```
$ bin/kafka-console-consumer.sh --bootstrap-server kafka:9092 --topic dbserver.public.data_product
```
    ``` output
    {"schema":{"type":"struct","fields":[{"type":"struct","fields":[{"type":"int32","optional":false,"field":"id"},{"type":"string","optional":true,"field":"name"},{"type":"string","optional":true,"field":"status"}],"optional":true,"name":"dbserver.public.data_product.Value","field":"before"},{"type":"struct","fields":[{"type":"int32","optional":false,"field":"id"},{"type":"string","optional":true,"field":"name"},{"type":"string","optional":true,"field":"status"}],"optional":true,"name":"dbserver.public.data_product.Value","field":"after"},{"type":"struct","fields":[{"type":"string","optional":false,"field":"version"},{"type":"string","optional":false,"field":"connector"},{"type":"string","optional":false,"field":"name"},{"type":"int64","optional":false,"field":"ts_ms"},{"type":"string","optional":true,"name":"io.debezium.data.Enum","version":1,"parameters":{"allowed":"true,last,false,incremental"},"default":"false","field":"snapshot"},{"type":"string","optional":false,"field":"db"},{"type":"string","optional":true,"field":"sequence"},{"type":"string","optional":false,"field":"schema"},{"type":"string","optional":false,"field":"table"},{"type":"int64","optional":true,"field":"txId"},{"type":"int64","optional":true,"field":"lsn"},{"type":"int64","optional":true,"field":"xmin"}],"optional":false,"name":"io.debezium.connector.postgresql.Source","field":"source"},{"type":"string","optional":false,"field":"op"},{"type":"int64","optional":true,"field":"ts_ms"},{"type":"struct","fields":[{"type":"string","optional":false,"field":"id"},{"type":"int64","optional":false,"field":"total_order"},{"type":"int64","optional":false,"field":"data_collection_order"}],"optional":true,"field":"transaction"}],"optional":false,"name":"dbserver.public.data_product.Envelope"},"payload":{"before":{"id":2,"name":"sql","status":"PROCESSANDO"},"after":{"id":2,"name":"sql","status":"PROVISIONADO"},"source":{"version":"1.9.5.Final","connector":"postgresql","name":"dbserver","ts_ms":1661893205816,"snapshot":"false","db":"datahub","sequence":"[null,\"24622824\"]","schema":"public","table":"data_product","txId":499,"lsn":24622824,"xmin":null},"op":"u","ts_ms":1661893206619,"transaction":null}}
    ```