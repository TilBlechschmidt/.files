$env.HOMEBREW_PREFIX = "/opt/homebrew"
$env.HOMEBREW_CELLAR = "/opt/homebrew/Cellar"
$env.HOMEBREW_REPOSITORY = "/opt/homebrew"

$env.PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/bin:/opt/homebrew/sbin')
# $env.MANPATH = ($env.MANPATH | split row (char esep) | prepend '/opt/homebrew/share/man')
# $env.INFOPATH = ($env.INFOPATH | split row (char esep) | prepend '/opt/homebrew/share/info')
