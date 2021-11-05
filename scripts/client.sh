#!/bin/bash
set -e
source ~/hydra/scripts/common.sh

my_client="my-client-$(date +%s)"
docker-compose -f quickstart.yml exec hydra \
  hydra clients create \
  --endpoint http://127.0.0.1:4445/ \
  --id $my_client \
  --secret secret \
  --grant-types client_credentials

token="$(docker-compose -f quickstart.yml exec hydra \
  hydra token client \
  --endpoint http://127.0.0.1:4444/ \
  --client-id $my_client \
  --client-secret secret)"
set -x
docker-compose -f quickstart.yml exec hydra \
  hydra token introspect \
  --endpoint http://127.0.0.1:4445/ \
  $token

docker-compose -f quickstart.yml exec hydra \
  hydra clients create \
  --endpoint http://127.0.0.1:4445 \
  --id auth-code-$my_client \
  --secret secret \
  --grant-types authorization_code,refresh_token \
  --response-types code,id_token \
  --scope openid,offline \
  --callbacks http://127.0.0.1:5555/callback

docker-compose -f quickstart.yml exec hydra \
  hydra token user \
  --client-id auth-code-$my_client \
  --client-secret secret-$my_client \
  --endpoint http://127.0.0.1:4444/ \
  --port 5555 \
  --scope openid,offline
