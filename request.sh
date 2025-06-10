#!/bin/sh
set -e

HOST_ADDRESS=${HOST_ADDRESS:-"192.168.0.101"}
HOST_PORT=${HOST_PORT:-80}

if [ "$1" = "add" ]; then
	if [ "$2" != "" ] && [ "$2" -gt 1 ]; then
		for iter in $(seq 1 $2)
		do
			RAND_USER=user$(( $(tr -cd 0-9 </dev/urandom | head -c 3) % 999))
			RAND_PAYLOAD='{"username": "'"$RAND_USER"'", "email": "'"$RAND_USER@example.com"'", "password_hash": "example"}'
			curl -i -X POST -d "$RAND_PAYLOAD" -H "Content-Type: application/json" http://${HOST_ADDRESS}:${HOST_PORT}/api/user
		done
	else
		RAND_USER=user$(( $(tr -cd 0-9 </dev/urandom | head -c 3) % 999))
		RAND_PAYLOAD='{"username": "'"$RAND_USER"'", "email": "'"$RAND_USER@example.com"'", "password_hash": "example"}'
		curl -i -X POST -d "$RAND_PAYLOAD" -H "Content-Type: application/json" http://${HOST_ADDRESS}:${HOST_PORT}/api/user
	fi
else
	curl -i -X GET http://${HOST_ADDRESS}:${HOST_PORT}/api/user
fi
