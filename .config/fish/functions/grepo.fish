function grepo
    set git_branch (_git_branch)
    set git_url (_git_remote_url | string replace -r '\.git$' "")

    # Convert SSH URL into HTTP one
    if string match -q -r "(ssh:\/\/|git@)" "$git_url"
        set git_url (
            printf "%s" "$git_url" |
            # Remove SSH protocol
            string replace "ssh://" "" |
            # Remove SSH user
            string split -m 1 -f2 -n '@' |
            # Replace first colon with slash
            string replace ":" "/"
        )

        # Add HTTP protocol
        set git_url (printf "http://%s" "$git_url")
    end

    # Add branch query suffix if applicable
    if test -n "$git_branch"
        switch $git_url
        case "*gitlab*" 
            set git_url (printf "%s/-/tree/%s?ref_type=heads" "$git_url" "$git_branch")
        case "*github*"
            set git_url (printf "%s/tree/%s" "$git_url" "$git_branch")
        end
    end

    echo $git_url | xargs open
end

function _git_remote_url
    set jj_remotes (jj git remote list 2>/dev/null)

    if test $status = 0
        set git_url (echo $jj_remotes | head -n1 | awk '{ print $2 }')
    else
        set git_url (git ls-remote --get-url 2>/dev/null)
    end

    if test -z "$git_url"
        echo "Neither a git nor jj repository or no remotes set." 1>&2
        exit 1
    end

    echo $git_url
end

function _git_branch
    set jj_bookmarks (jj bookmark list -r ::@ -T 'name ++ "\n"' 2>/dev/null)

    if test $status = 0
        set git_branch (printf "%s\n" $jj_bookmarks | head -n1)
    else
        set git_branch (git branch --show-current)
    end

    echo $git_branch
end
