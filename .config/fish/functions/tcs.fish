function __fish_tcs_login
    tsh login gate.ppi-fs.org >/dev/null
end

function __fish_tcs_clusters
    __fish_tcs_login
    tsh clusters -f json | jq -r  '.[].cluster_name'
end

function __fish_tcs_refresh
    set -f clusters

    for teleportCluster in (__fish_tcs_clusters)
        for kubernetesCluster in (tsh kube ls -f json -c $teleportCluster | jq -r '.[].kube_cluster_name')
            if [ "$kubernetesCluster" = "$teleportCluster" ]
                # For some reason we have kube clusters that have an identical name
                continue
            end

            set -a clusters "$kubernetesCluster $teleportCluster"
        end
    end

    set -U TCS_CLUSTER_LIST $clusters
end

function tcs -d 'Temporarily connect to a Teleport K8s cluster'
    if not type -q tsh
        echo "Missing `tsh` executable, are you below the tooling root?"
        return 1
    end

    if not count $argv >/dev/null
        echo "tcs: at least one argument or option required"
        return 1
    end

    argparse 'r/refresh' 'h/help' -- $argv
    or return 1

    if set -q _flag_help
        echo "Usage: tcs [-r] [<cluster>]"
        return
    end

    if set -q _flag_refresh
        echo "Refreshing list of clusters ..."
        __fish_tcs_refresh
    end

    if count $argv >/dev/null
        echo "Logging in to $argv"

        # Check if cluster list has at least one element
        set -q $TCS_CLUSTER_LIST[1]
        if not test $status -eq 1
            echo "Cluster list is not set or empty"
            return 1
        end

        set -f kubernetesCluster "$argv[1]"
        set -f teleportCluster (string match -r -g "^$kubernetesCluster (.+)\$" $TCS_CLUSTER_LIST)

        if test $status -eq 1
            echo "No matching cluster found."
            return 1
        end

        set -gx KUBECONFIG (mktemp --suffix=kubeconfig)
        tsh kube login --cluster $teleportCluster "$kubernetesCluster" >/dev/null

        echo "Set kubeconfig to $kubernetesCluster @ $teleportCluster"
    end
end
