# Rust
set PATH $HOME/.cargo/bin $PATH

# fnm (Generates OS specific paths ...)
fnm env --use-on-cd | source

# Random stuff
set -gx GPG_TTY tty
set -gx LAUNCH_ENDPOINT "http://10.0.0.56:1200"
set -gx BAT_THEME Nord