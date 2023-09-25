$env.PATH = ($env.PATH | split row (char esep) | prepend $'($env.HOME)/.cargo/bin')
