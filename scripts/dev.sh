#!/bin/bash
cmd="$@"

ansi >&2 --yellow --italic --bg-black "$cmd"
cmd="$(command -v nodemon) -I  -w ~/hydra -e yaml,sh -V -x sh -- -c '$cmd'"
ansi >&2 --cyan --bold --bg-black "$cmd"
eval "$cmd"
