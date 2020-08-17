FROM openjdk:8-jre-alpine

LABEL maintainer="ysenih@erpya.com" \
	description="ADempiere gRPC Dictionary Server"

ENV URL_REPO="https://github.com/erpcya/adempiere-gRPC-Server" \
	BASE_VERSION="rt-15.0" \
	BINARY_NAME="adempiere-gRPC-Server.zip"

WORKDIR /opt/Apps/

RUN echo "Install needed packages..." && \
	apk --no-cache add curl && \
	echo "Get gRPC Server Binary Release:${BASE_VERSION}..." && \
	curl --output "$BINARY_NAME" -L "$URL_REPO/releases/download/$BASE_VERSION/$BINARY_NAME" && \
	echo "Uncompress release file..." && \
	unzip -o $BINARY_NAME && \
	mv adempiere-gRPC-Server ADempiere-gRPC-Server && \
	rm $BINARY_NAME

# Add connection template
COPY dictionary_connection.yaml /opt/Apps/ADempiere-gRPC-Server/bin/dictionary_connection.yaml

WORKDIR /opt/Apps/ADempiere-gRPC-Server/bin/

CMD 'sh' 'adempiere-dictionary-server' 'dictionary_connection.yaml'
