case $1 in
    xmonad)

        source /etc/X11/xinit/xinitrc.d/30-dbus
        eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
        export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

        trayer --edge top --align right --widthtype pixel --width 135 --transparent true --alpha 0 --tint 0 --expand true --SetDockType true --SetPartialStrut true --heighttype pixel --height 19 --monitor 0 &
        nm-applet --sm-disable &
        start-pulseaudio-x11 &
        system-config-printer-applet &
        pnmixer &
        xfce4-volumed &
        xfce4-power-manager &
        xscreensaver -no-splash &
        xcompmgr -c &
        syndaemon -k -t -d
        xmodmap ~/dotfiles/xmodmap
        xset b off
        xset m 2 3
        xsetroot -cursor_name left_ptr
        synclient AreaTopEdge=2500
        xinput set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Soft Button Areas" 3500 0 0 2500 2500 3500 0 2500
        nitrogen --restore

        ;;
    openbox)
        ;;
    *)
        ;;
esac

exec $1
