#!/bin/bash
# Example:
# ./ido/rq5-sn.sh 0`


export SLNUM=$1

docker container rm sn-$SNNUM

bash ./swarm-learning/bin/run-sn  \
    --name=sn-$SNNUM              \
    --network sl-net              \
    --host-ip=sn-$SNNUM           \
    --sentinel-ip=sn-$SNNUM       \
    --apls-ip apls                \
    -serverAddress spire-server   \
    -genJoinToken