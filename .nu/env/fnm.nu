$env.PATH = ($env.PATH | split row (char esep) | prepend $'($env.HOME)/Library/Caches/fnm_multishells/19756_1695410992483/bin')

load-env (fnm env --shell bash | lines | str replace 'export ' '' | str replace -a '"' '' | split column = | rename name value | where name != "FNM_ARCH" and name != "PATH" | reduce -f {} {|it, acc| $acc | upsert $it.name $it.value })