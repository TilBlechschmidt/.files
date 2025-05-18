if [ (uname) = Darwin ]
    # Add /usr/local/bin to PATH since for some reason, it is not set in Kitty
    set PATH /usr/local/bin $PATH

    # Homebrew (`brew shellenv fish`)
    set -gx HOMEBREW_PREFIX /opt/homebrew
    set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar
    set -gx HOMEBREW_REPOSITORY /opt/homebrew
    ! set -q PATH; and set PATH ''
    set -gx PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH
    ! set -q MANPATH; and set MANPATH ''
    set -gx MANPATH /opt/homebrew/share/man $MANPATH
    ! set -q INFOPATH; and set INFOPATH ''
    set -gx INFOPATH /opt/homebrew/share/info $INFOPATH

    # Perl
    set PERL5LIB /Users/tibl/perl5/lib/perl5
    set PERL_LOCAL_LIB_ROOT /Users/tibl/perl5
    set PERL_MB_OPT "--install_base \"/Users/tibl/perl5\""
    set PERL_MM_OPT "INSTALL_BASE=/Users/tibl/perl5"
    set PATH /Users/tibl/perl5/bin $PATH

    # iTerm2
    test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish; or true

    # 1Password SSH agent — required for `jj`` and other libssh2 based commands
    set -gx SSH_AUTH_SOCK "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

    # Set $SHELL to fish for some tools that use it
    set -gx SHELL fish

    # SDL2 search path weirdness
    # https://github.com/PistonDevelopers/rust-empty/issues/175
    set -gx LIBRARY_PATH "$LIBRARY_PATH:/opt/homebrew/lib"

    # Workaround for `jj` opening way too many files at once
    ulimit -n 1024

    # By default SOPS looks in some obscure /Library/App... folder on macOS
    export SOPS_AGE_KEY_FILE=$HOME/.config/sops/age/keys.txt
end
