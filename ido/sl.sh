docker container rm sl-$SLNUM
bash ./swarm-learning/bin/run-sl        \
    --name=sl-$SLNUM                         \
    --network sl-net             \
    --sl-platform=TF                   \
    --sn-ip=sn-$SNNUM                   \
    --data-dir="$DATA_DIR"  \
    --model-dir="$SPLIT_DIR/$SLNUM"  \
    --model-program=train.py        \
    --apls-ip apls                 \
    --gpu=$GPU                        \
    -serverAddress spire-server            \
    -genJoinToken  \
    -e SLNUM=$SLNUM  \
    -e SNNUM=$SNNUM  \
    -e WEIGHTAGE=$WEIGHTAGE \
    -e TF_FORCE_GPU_ALLOW_GROWTH=true   \
    --host-ip=sl-$SLNUM