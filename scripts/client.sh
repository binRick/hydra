#!/bin/bash
set -e
cd ~/hydra
export SECRETS_SYSTEM=47DF5E39-00B0-4357-8C29-ACD07031C8BE
CONTAINER_PREFIX=hydra_

docker-compose -f quickstart.yml exec hydra \
  hydra clients create \
  --endpoint http://127.0.0.1:4445/ \
  --id my-client \
  --secret secret \
  --grant-types client_credentials

docker-compose -f quickstart.yml exec hydra \
  hydra token client \
  --endpoint http://127.0.0.1:4444/ \
  --client-id my-client \
  --client-secret secret

docker-compose -f quickstart.yml exec hydra \
  hydra token introspect \
  --endpoint http://127.0.0.1:4445/ \
  UDYMha9TwsMBejEvKfnDOXkhgkLsnmUNYVQDklT5bD8.ZNpuNRC85erbIYDjPqhMwTinlvQmNTk_UvttcLQxFJY

docker-compose -f quickstart.yml exec hydra \
  hydra clients create \
  --endpoint http://127.0.0.1:4445 \
  --id auth-code-client \
  --secret secret \
  --grant-types authorization_code,refresh_token \
  --response-types code,id_token \
  --scope openid,offline \
  --callbacks http://127.0.0.1:5555/callback

docker-compose -f quickstart.yml exec hydra \
  hydra token user \
  --client-id auth-code-client \
  --client-secret secret \
  --endpoint http://127.0.0.1:4444/ \
  --port 5555 \
  --scope openid,offline
