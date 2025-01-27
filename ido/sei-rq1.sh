docker container rm sl-$SLNUM

bash ./swarm-learning/bin/run-sl        \
    --name=sl-$SLNUM                         \
    --network sl-net             \
    --sl-platform=TF                   \
    --host-ip=sl-$SLNUM                \
    --sn-ip=sn-$SNNUM                   \
    --data-dir="/home/yudonghan/storage/SwarmSense/CIFAR/RQ1-SplitResults-3/$SLNUM"  \
    --model-dir="/home/yudonghan/storage/SwarmSense/CIFAR/RQ1-SplitResults-3/$SLNUM"  \
    --model-program=densenet.py        \
    --apls-ip apls                 \
    --gpu=$GPU                        \
    -serverAddress spire-server            \
    -genJoinToken  \
    -e SLNUM=$SLNUM  \
    -e SNNUM=$SNNUM  \
    -e WEIGHTAGE=$WEIGHTAGE \
    -e TF_FORCE_GPU_ALLOW_GROWTH=true