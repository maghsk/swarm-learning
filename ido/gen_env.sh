#!/bin/bash
# SLNUM WEIGHTAGE SPLIT_DIR DATA_DIR SNNUM(optional)
# Example:
# eval `./ido/gen_env.sh 1 50 /home/ubuntu/SwarmSense/NIHCHEST/SplitResult-age /home/ubuntu/SwarmSense/NIHCHEST`
# eval `./ido/gen_env.sh 1 50 /home/ubuntu/SwarmSense/NIHCHEST/SplitResult-age /home/ubuntu/SwarmSense/NIHCHEST 2`

echo "export SLNUM=$1"
echo "export GPU=$1"
echo "export WEIGHTAGE=$2"
echo "export SPLIT_DIR=$3"
echo "export DATA_DIR=$4"
echo "export SNNUM=${5:-1}"
