#!/bin/bash

INTERVAL=$1
GROUP_STR=$2

OUTNAME=$(date +'%Y%m%d-%H%M%S')-stats-intv_$INTERVAL-$GROUP_STR.txt

update_file() {
  time docker stats --no-stream --format "table {{.Name}},{{.CPUPerc}},{{.MemUsage}},{{.NetIO}},{{.BlockIO}},{{.PIDs}}" | tee --append $OUTNAME;
  echo $(date +'%s.%N') | tee --append $OUTNAME;
}

while true;
do
  update_file &
  sleep $INTERVAL;
done
