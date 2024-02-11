if status is-interactive
    set -gx JJ_CONFIG $HOME/.config/jj/config.toml

    alias cfg="git --git-dir=$HOME/.cfg --work-tree=$HOME"
    alias cat="bat --paging=never"
    alias catp="bat --paging=never --style=plain"
    alias ls="eza -labgh --smart-group --no-quotes"
    alias cd="z"

    # Abbreviations
    abbr -a tf terraform

    ## git
    abbr -a g git
    abbr -a gst git status
    abbr -a glog git log

    abbr -a gcb git checkout -b

    abbr -a ga git add
    abbr -a grh git reset
    abbr -a gd git diff
    abbr -a gds git diff --staged

    abbr -a gcmsg --set-cursor git commit -m \"%\"
    abbr -a gca git commit --amend

    abbr -a gri git rebase -i

    abbr -a gl git pull
    abbr -a gpf git push --force-with-lease --force-if-includes

    ## Kubernetes
    abbr -a k kubectl
    abbr -a kl kubectl logs
    abbr -a kdel kubectl delete
    abbr -a ka kubectl apply

    ### get
    abbr -a kg kubectl get
    abbr -a kgs kubectl get service
    abbr -a kgn kubectl get node
    abbr -a kgp kubectl get pod
    abbr -a kgpw kubectl get pod -w

    ### describe
    abbr -a kd kubectl describe
    abbr -a kdp kubectl describe pod
    abbr -a kdn kubectl describe node

    ### config
    abbr -a kc kubectl config
    abbr -a kcns kubectl config set-context --current --namespace
    abbr -a kcc kubectl config use-context
end
