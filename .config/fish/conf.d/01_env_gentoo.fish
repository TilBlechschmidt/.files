if [ (uname) = Linux ]
    # Tell Firefox where to find widevine so we can using that shitty DRM content
    set -gx MOZ_GMP_PATH /opt/widevine/gmp-widevinecdm/system-installed

    # 1Password SSH agent — required for `jj`` and other libssh2 based commands
    set -gx SSH_AUTH_SOCK ~/.1password/agent.sock
end
