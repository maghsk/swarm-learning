#!/bin/bash
# Example:
# SNNUM SLNUM SPLIT_NUM MIN_PEERS GROUP_STR
# ./ido/rq5-sl.sh 0 0 4 4 1x4
# ./ido/rq5-sl.sh 0 1 4 4 1x4
# ./ido/rq5-sl.sh 0 2 4 4 1x4
# ./ido/rq5-sl.sh 0 3 4 4 1x4

# ./ido/rq5-sl.sh 0 0 4 4 2x2
# ./ido/rq5-sl.sh 0 1 4 4 2x2
# ./ido/rq5-sl.sh 1 2 4 4 2x2
# ./ido/rq5-sl.sh 1 3 4 4 2x2

# ./ido/rq5-sl.sh 0 0 4 4 4x1
# ./ido/rq5-sl.sh 1 1 4 4 4x1
# ./ido/rq5-sl.sh 2 2 4 4 4x1
# ./ido/rq5-sl.sh 3 3 4 4 4x1

# ./ido/rq5-sl.sh 0 0 4 4 2x1
# ./ido/rq5-sl.sh 1 1 4 4 2x1

# ./ido/rq5-sl.sh 0 0 8 8 2x4
# ./ido/rq5-sl.sh 0 1 8 8 2x4
# ./ido/rq5-sl.sh 0 2 8 8 2x4
# ./ido/rq5-sl.sh 0 3 8 8 2x4
# ./ido/rq5-sl.sh 1 0 8 8 2x4
# ./ido/rq5-sl.sh 1 1 8 8 2x4
# ./ido/rq5-sl.sh 1 2 8 8 2x4
# ./ido/rq5-sl.sh 1 3 8 8 2x4



SNNUM=$1
SLNUM=$2
SPLIT_NUM=$3
MIN_PEERS=$4
GROUP_STR=$5

CONTAINER_NAME=sl-$GROUP_STR-$SNNUM-$SLNUM
DATA_DIR=/home/ubuntu/1t/SwarmSense/CIFAR
SPLIT_DIR=$DATA_DIR/RQ5-SplitResults-$SPLIT_NUM
GPU=$SLNUM

docker container rm $CONTAINER_NAME

bash ./swarm-learning/bin/run-sl        \
    --name=$CONTAINER_NAME              \
    --network sl-net                    \
    --sl-platform=TF                    \
    --sn-ip=sn-$SNNUM                   \
    --data-dir="$DATA_DIR"              \
    --model-dir="$SPLIT_DIR/$SLNUM"     \
    --model-program=rq5train.py         \
    --apls-ip apls                      \
    --host-ip=$CONTAINER_NAME           \
    --gpu=$GPU                          \
    -e SLNUM=$SLNUM                     \
    -e SNNUM=$SNNUM                     \
    -e WEIGHTAGE=$WEIGHTAGE             \
    -e MIN_PEERS=$MIN_PEERS             \
    -e GROUP_STR=$GROUP_STR             \
    -e TF_FORCE_GPU_ALLOW_GROWTH=true   \
    -serverAddress spire-server         \
    -genJoinToken
