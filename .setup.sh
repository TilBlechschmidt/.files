git clone --bare git@github.com:TilBlechschmidt/.files.git $HOME/.cfg

function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

mkdir -p .cfg-backup

config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .cfg-backup/{}
fi;

config checkout
config config status.showUntrackedFiles no

cargo install eza zoxide atuin \
  bat fd-find procs du-dust ripgrep rnr \
  tokei hyperfine bandwhich bacon just fnm \
  git-delta git-ignore-generator git-grab jj-cli 

atuin login -u tibl
