#!/bin/bash
set -e
source ~/hydra/scripts/common.sh

docker-compose -f quickstart.yml exec hydra \
  hydra token user \
  --client-id auth-code-client \
  --client-secret secret \
  --endpoint http://127.0.0.1:4444/ \
  --port 5555 \
  --scope openid,offline
