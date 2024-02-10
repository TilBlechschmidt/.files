if status is-interactive
    set -gx JJ_CONFIG $HOME/.config/jj/config.toml

    alias cfg="git --git-dir=$HOME/.cfg --work-tree=$HOME"

    alias cat="bat --paging=never"
    alias cd="z"

    # abbr -a cd z
end
