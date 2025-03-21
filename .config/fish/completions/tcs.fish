function __fish_tcs_cluster_alias
    if [ "$argv[1]" = "gate.ppi-fs.org" ]
        echo "ROOT"
    else if [ "$argv[1]" = "portal.cc-ppic.ki.ppi.vc" ]
        echo "PPIC"
    else if [ "$argv[1]" = "portal.ppifs-sandbox.net" ]
        echo "SAND"
    else if [ "$argv[1]" = "portal.cc-int.ki.ppi.vc" ]
        echo "INT"
    else if [ "$argv[1]" = "portal.cc-sit.ppi-fs.org" ]
        echo "SIT"
    else if [ "$argv[1]" = "portal.gaia.ppifs.de" ]
        echo "LIVE"
    else
        echo "$argv[1]"
    end
end

function __fish_tcs_completions --on-variable TCS_CLUSTER_LIST
    complete -c tcs -e
    complete -c tcs -f
    complete -c tcs -f -s r -l refresh -d 'Reload list of clusters'

    for entry in $TCS_CLUSTER_LIST
        set -l kubernetesCluster (echo $entry | awk '{ print $1 }') 
        set -l teleportCluster (echo $entry | awk '{ print $2 }')

        complete -c tcs -f -a "$kubernetesCluster" -d (__fish_tcs_cluster_alias $teleportCluster) -n '__fish_is_first_token'
    end
end

__fish_tcs_completions
