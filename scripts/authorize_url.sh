#!/bin/bash
set -e
source ~/hydra/scripts/common.sh
authorize_app_url="$(curl -sk http://127.0.0.1:5555/ | grep 'click the' -A 1 | grep 'a href=' | cut -d'"' -f2)"
echo -e "$authorize_app_url"
