#!/bin/bash
set -e
source ~/hydra/scripts/common.sh
cleanup_cmd="docker ps -aq --filter name='$CONTAINER_PREFIX*'|xargs docker rm -f"
eval $cleanup_cmd
