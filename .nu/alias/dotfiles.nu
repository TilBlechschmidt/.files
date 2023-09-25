let dotfiles = ( $env.HOME | path join .cfg )
alias cfg = git $'--git-dir=($dotfiles)' $'--work-tree=($env.HOME)'
