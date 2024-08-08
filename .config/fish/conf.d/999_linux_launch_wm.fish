if status is-login
    set TTY1 (tty)
    [ "$TTY1" = /dev/tty1 ] && dbus-run-session Hyprland
end
