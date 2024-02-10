if status is-interactive
    set -gx JJ_CONFIG $HOME/.config/jj/config.toml

    alias cfg="git --git-dir=$HOME/.cfg --work-tree=$HOME"

    alias cat="bat --paging=never"
    alias cd="z"

    # abbr -a cd z

    abbr -a k kubectl
    abbr -a kg kubectl get
    abbr -a kgp kubectl get pod
    abbr -a kgpw kubectl get pod -w
    abbr -a kd kubectl describe
    abbr -a kdp kubectl describe pod
    abbr -a kl kubectl logs
    abbr -a kc kubectl config
    abbr -a kdel kubectl delete
    abbr -a kcns kubectl config set-context --current --namespace 
    abbr -a tf terraform
end
