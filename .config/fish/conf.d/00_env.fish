# Custom binaries
fish_add_path -P $HOME/.local/bin

# Rust
fish_add_path -P $HOME/.cargo/bin

# fnm (Generates OS specific paths ...)
fnm env --use-on-cd | source

# jj: Set the config variable to the directory
# 	  Allows us to place and use multiple files
#     Used for device-specific configuration (e.g. at work)
set -gx JJ_CONFIG $HOME/.config/jj

# Random stuff
set -gx EDITOR hx
set -gx GPG_TTY tty
set -gx BAT_THEME Nord
set -gx LAUNCH_ENDPOINT "http://10.0.0.56:1200"
set -gx GRAB_HOME $HOME/Developer

# Fix for `delta` pager scrolling
# https://github.com/dandavison/delta/issues/630#issuecomment-2003149860
set -gx LESS '-R --mouse'
