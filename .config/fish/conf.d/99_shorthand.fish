if status is-interactive

    ###### ----- Tooling overrides ----- ######
    alias ls 'eza -labgh --smart-group --no-quotes'

    alias cat 'bat --paging=never'
    alias cap 'cat --style=plain'


    ###### ------------ git ------------ ######
    abbr -a g git
    abbr -a gst git status
    abbr -a glog git log

    abbr -a gc git clone
    abbr -a gf git fetch
    abbr -a gcb git checkout -b

    abbr -a ga git add
    abbr -a grh git reset
    abbr -a gd git diff
    abbr -a gds git diff --staged

    abbr -a gcmsg --set-cursor git commit -m \"%\"
    abbr -a gca git commit --amend

    abbr -a gri git rebase -i

    abbr -a gl git pull
    abbr -a gp git push
    abbr -a gpf git push --force-with-lease --force-if-includes

    alias grepo 'git config --get remote.origin.url | sed "s/:/\//g" | sed "s/.git//g" | awk \'{print "http://"$1}\' | xargs open'
    alias cfg 'git --git-dir=$HOME/.cfg --work-tree=$HOME'


    ###### ------------ K8s ------------ ######
    abbr -a k kubectl
    abbr -a kl kubectl logs
    abbr -a kdel kubectl delete
    abbr -a ka kubectl apply
    abbr -a kaf kubectl apply -f
    abbr -a kpf kubectl port-forward
    abbr -a kx --set-cursor kubectl exec -it \% -- /bin/sh

    # get
    abbr -a kg kubectl get
    abbr -a kgs kubectl get service
    abbr -a kgn kubectl get node
    abbr -a kgp kubectl get pod
    abbr -a kgpa kubectl get pod -A
    abbr -a kgpw kubectl get pod -w

    # describe
    abbr -a kd kubectl describe
    abbr -a kdp kubectl describe pod
    abbr -a kdn kubectl describe node

    # config
    abbr -a kc kubectl config

    if type -q kubectx
        abbr -a kcns kubens
        abbr -a kcc kubectx
    else
        abbr -a kcns kubectl config set-context --current --namespace
        abbr -a kcc kubectl config use-context
    end


    ###### ----------- Rust ------------ ######
    abbr -a c cargo

    abbr -a cr cargo run
    abbr -a crr cargo run --release

    abbr -a cb cargo build
    abbr -a cbr cargo build --release

    ###### ----------- Other ----------- ######
    abbr -a tf terraform

end
