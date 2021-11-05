#!/bin/bash
cmd="$@"

ansi >&2 --yellow --italic --bg-black "$cmd"
cmd="$(command -v nodemon) -I  -w ~/hydra -e yaml,sh -i ~/hydra/scripts/tmuxp.yaml  -V -x sh -- -c '$cmd'"
ansi >&2 --cyan --bold --bg-black "$cmd"
eval "$cmd"
