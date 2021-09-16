#!/bin/bash
# Example:
# SLNUM GPU PROBABILITY
# ./ido/rq6-sl.sh 0 0 0.1
# ./ido/rq6-sl.sh 1 1 0.1
# ./ido/rq6-sl.sh 2 2 0.1
# ./ido/rq6-sl.sh 3 3 0.1
# ./ido/rq6-sl.sh 4 0 0.1
# ./ido/rq6-sl.sh 5 1 0.1
# ./ido/rq6-sl.sh 6 2 0.1
# ./ido/rq6-sl.sh 7 3 0.1



SLNUM=$1
GPU=$2
PROBABILITY=$3

SNNUM=0
SPLIT_NUM=8
MIN_PEERS=4
CONTAINER_NAME=sl-$PROBABILITY-$SNNUM-$SLNUM
DATA_DIR=/home/ubuntu/1t/SwarmSense/CIFAR
SPLIT_DIR=$DATA_DIR/RQ5-SplitResults-$SPLIT_NUM

docker container rm $CONTAINER_NAME

bash ./swarm-learning/bin/run-sl        \
    --name=$CONTAINER_NAME              \
    --network sl-net                    \
    --sl-platform=TF                    \
    --sn-ip=sn-$SNNUM                   \
    --data-dir="$DATA_DIR"              \
    --model-dir="$SPLIT_DIR/$SLNUM"     \
    --model-program=rq6train.py         \
    --apls-ip apls                      \
    --host-ip=$CONTAINER_NAME           \
    --gpu=$GPU                          \
    -e SLNUM=$SLNUM                     \
    -e SNNUM=$SNNUM                     \
    -e WEIGHTAGE=$WEIGHTAGE             \
    -e MIN_PEERS=$MIN_PEERS             \
    -e PROBABILITY=$PROBABILITY         \
    -e TF_FORCE_GPU_ALLOW_GROWTH=true   \
    -serverAddress spire-server         \
    -genJoinToken
