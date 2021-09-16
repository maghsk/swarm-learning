#!/bin/bash
# Example:
# ./ido/rq5-sn.sh 0`


SENTINEL_NUM=$1
SNNUM=$2

docker container rm sn-$SNNUM

bash ./swarm-learning/bin/run-sn    \
    --name=sn-$SNNUM                \
    --network sl-net                \
    --host-ip=sn-$SNNUM             \
    --sentinel-ip=sn-$SENTINEL_NUM  \
    --apls-ip apls                  \
    -serverAddress spire-server     \
    -genJoinToken