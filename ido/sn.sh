#!/bin/bash
docker container rm sn-1
bash ./swarm-learning/bin/run-sn  \
    --name=sn-1              \
    --network sl-net \
    --host-ip=sn-1      \
    --sentinel-ip=sn-1  \
    --apls-ip apls      \
    -serverAddress spire-server \
    -genJoinToken