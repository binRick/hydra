#!/bin/bash
set -e

docker ps -aq | xargs docker inspect | jq -Mr | grep -i /tcp | cut -d: -f1 | cut -d'"' -f2 | cut -d'/' -f1 | sort -u
