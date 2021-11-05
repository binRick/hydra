#!/bin/bash
set -e
cd ~/hydra
cleanup_cmd="docker ps -aq|xargs docker rm -f"
eval $cleanup_cmd
