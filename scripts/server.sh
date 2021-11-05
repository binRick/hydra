#!/bin/bash
set -e
cd ~/hydra

export SECRETS_SYSTEM=47DF5E39-00B0-4357-8C29-ACD07031C8BE
CONTAINER_PREFIX=hydra_
cleanup_cmd="docker ps --filter name='$CONTAINER_PREFIX*' -aq|xargs docker rm -f"

DB=${DB:-postgres}
DB=mysql
DB=sqlite
TRACING=${TRACING:-true}
PROMETHEUS=${PROMETHEUS:-false}

DC="docker-compose -f quickstart.yml"
if [[ $DB == "mysql" ]]; then
  DC+=" -f quickstart-mysql.yml"
fi
if [[ $DB == "postgres" ]]; then
  DC+=" -f quickstart-postgres.yml"
fi
if [[ $TRACING == true ]]; then
  DC+=" -f quickstart-tracing.yml"
fi
if [[ $PROMETHEUS == true ]]; then
  DC+=" -f quickstart-prometheus.yml"
fi
DC+=" up --build"

ansi >&2 --yellow --italic --bg-black "$DC"

kill_containers() {
  (
    set +e
    ansi >&2 --yellow --italic --bg-black "$cleanup_cmd"
    eval $cleanup_cmd

  ) 2>/dev/null &

  wait
}

trap kill_containers EXIT

eval "$cleanup_cmd" 2>/dev/null || true
eval "$DC"
