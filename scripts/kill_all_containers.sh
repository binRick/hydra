#!/bin/bash
set -e
source ~/hydra/scripts/common.sh
cleanup_cmd="docker ps -aq |xargs docker rm -f"
eval $cleanup_cmd
