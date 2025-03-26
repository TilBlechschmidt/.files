# Custom binaries
fish_add_path -P $HOME/.local/bin

# Rust
fish_add_path -P $HOME/.cargo/bin

# fnm (Generates OS specific paths ...)
if command --search --quiet fnm
    fnm env --use-on-cd | source
end

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

# Disable Earthly analytics because it is invoked after each CLI call
# and seemingly hosted behind Cloudflare which ... uhh ... is a problem
# when being behind a huge ass dickhead of an ISP which does not peer
# with them, instead asking a giant ransom which Cloudflare does not pay.
set -gx EARTHLY_DISABLE_ANALYTICS 1
