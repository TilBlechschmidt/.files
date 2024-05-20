# Rust
set PATH $HOME/.cargo/bin $PATH

# fnm (Generates OS specific paths ...)
fnm env --use-on-cd | source

# Random stuff
set -gx EDITOR hx
set -gx GPG_TTY tty
set -gx BAT_THEME Nord
set -gx LAUNCH_ENDPOINT "http://10.0.0.56:1200"
set -gx JJ_CONFIG $HOME/.config/jj/config.toml
