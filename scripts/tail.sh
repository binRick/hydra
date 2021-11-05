#!/bin/bash
set -e
source ~/hydra/scripts/common.sh

docker ps -aq | xargs -I % echo 'docker logs -f % &'
