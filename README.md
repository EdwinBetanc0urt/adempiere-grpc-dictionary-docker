ADempiere Dictionary gRPC Docker Server
=====================

#### @DEPRECATED Replace with https://github.com/adempiere/adempiere-grpc-all-in-one-docker

This server can be used for get information from ADempiere dictionary and is related to project: https://github.com/erpcya/adempiere-gRPC-Server

[Docker](https://www.docker.io/) file for trusted builds of [ADempiere gRPC Deploy](http://erpya.com/) on https://hub.docker.com/r/erpya/adempiere-grpc-dictionary.

You will need use a file with a structure like it: [dictionary_connection.yaml](dictionary_connection.yaml)
```yaml

server:
    port: 50051
database:
    host: localhost
    port: 5432
    name: "database"
    user: adempiere
    password: adempiere
    type: PostgreSQL
```

Run the latest container with:
```shell
    docker pull erpya/adempiere-grpc-dictionary
```

```shell
docker run --name adempiere-grpc-dictionary -it \
	-p 50051:50051 \
	-v $(pwd)/dictionary_connection.yaml:/opt/Apps/ADempiere-gRPC-Server/bin/dictionary_connection.yaml \
	erpya/adempiere-grpc-dictionary
```
