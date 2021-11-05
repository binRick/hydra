#!/bin/bash
set -e
cd ~/hydra

#export SECRETS_SYSTEM=47DF5E39-00B0-4357-8C29-ACD07031C8BE
export LOG_LEAK_SENSITIVE_VALUES=true
CONTAINER_PREFIX=hydra_
cleanup_cmd="docker ps --filter name='$CONTAINER_PREFIX*' -aq|xargs docker rm -f"
[[ -d /var/spool/hydra-sqlite/1 ]] || mkdir -p /var/spool/hydra-sqlite/1
DEBUG_MODE=${DEBUG_MODE:-1}
DB=${DB:-postgres}
DB=sqlite
DB=mysql
TRACING=${TRACING:-true}
PROMETHEUS=${PROMETHEUS:-false}

DC="docker-compose -f quickstart.yml"
if [[ $DEBUG_MODE == "1" ]]; then
  DC+=" -f quickstart-debug.yml"
fi
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
