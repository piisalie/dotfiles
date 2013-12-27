DEFAULT_SESSION=openbox-session

case $1 in
    xmonad)

	# Start a D-Bus session
	source /etc/X11/xinit/xinitrc.d/30-dbus
	# Start GNOME Keyring
	eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
	# You probably need to do this too:
	export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK
	
        trayer --edge top --align right --widthtype request --expand true --SetDockType true --SetPartialStrut true --transparent true --alpha 255 --expand true --heighttype pixel --height 18 --monitor 0 --padding 1 &
        nm-applet --sm-disable &
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
