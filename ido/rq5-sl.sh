#!/bin/bash
# Example:
# ./ido/rq5-sl.sh 0 0 4`


export SLNUM=$1
export GPU=$1
export SNNUM=$2
export SPLIT_NUM=$3
export SPLIT_DIR=RQ5-SplitResults-$SPLIT_NUM
export DATA_DIR=/home/ubuntu/SwarmSense/CIFAR
export MIN_PEERS=4

docker container rm sl-$SNNUM-$SLNUM

bash ./swarm-learning/bin/run-sl        \
    --name=sl-$SNNUM-$SLNUM             \
    --network sl-net                    \
    --sl-platform=TF                    \
    --sn-ip=sn-$SNNUM                   \
    --data-dir="$DATA_DIR"              \
    --model-dir="$SPLIT_DIR/$SLNUM"     \
    --model-program=rq5train.py         \
    --apls-ip apls                      \
    --host-ip=sl-$SLNUM                 \
    --gpu=$GPU                          \
    -e SLNUM=$SLNUM                     \
    -e SNNUM=$SNNUM                     \
    -e WEIGHTAGE=$WEIGHTAGE             \
    -e MIN_PEERS=$MIN_PEERS             \
    -e SPLIT_NUM=$SPLIT_NUM             \
    -e TF_FORCE_GPU_ALLOW_GROWTH=true   \
    -serverAddress spire-server         \
    -genJoinToken                       
