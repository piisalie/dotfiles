DEFAULT_SESSION=openbox-session

case $1 in
    xmonad)
        eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)
	
        trayer --edge top --align right --widthtype request --expand true --SetDockType true --SetPartialStrut true --transparent true --alpha 255 --expand true --heighttype pixel --height 18 --monitor 0 --padding 1 &
        nm-applet &
        start-pulseaudio-x11 &
        system-config-printer-applet &
        pnmixer &
        xfce4-volumed &
        xfce4-power-manager &
        xscreensaver -no-splash &

	xmodmap ~/dotfiles/xmodmap
        xset b off
        xset m 1 1/2
	syndaemon -d
        xsetroot -cursor_name left_ptr
        nitrogen --restore
	
        exec xmonad
        ;;
    openbox)
        exec openbox-session
        ;;
    *)
        exec $DEFAULT_SESSION
        ;;
esac
