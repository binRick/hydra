#!/bin/bash
set -e
source ~/hydra/scripts/common.sh
cleanup_cmd="❯ docker images |grep ^oryd/hydra|tr -s ' '|cut -d' ' -f3|xargs docker rmi -f"
eval $cleanup_cmd
