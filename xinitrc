DEFAULT_SESSION=openbox-session

case $1 in
    xmonad)
        eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)
        modprobe coretemp &
        trayer --edge top --align right --widthtype request --expand true --SetDockType true --SetPartialStrut true --transparent true --alpha 0 --tint 0x1A1918 --expand true --heighttype pixel --height 18 --monitor 0 --padding 1 &
        nm-applet &
        start-pulseaudio-x11 &
        system-config-printer-applet &
        nitrogen --restore &
        pnmixer &
        xfce4-volumed &
        xfce4-power-manager &
        xscreensaver -no-splash &
        xset b off &
        syndaemon -d &
        xset m 1 1/2 &
        xsetroot -cursor_name left_ptr &
        exec xmonad
        ;;
    openbox)
        exec openbox-session
        ;;
    *)
        exec $DEFAULT_SESSION
        ;;
esac
