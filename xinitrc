#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

#if [ -d /etc/X11/xinit/xinitrc.d ]; then
#  for f in /etc/X11/xinit/xinitrc.d/*; do
#    [ -x "$f" ] && . "$f"
#  done
#  unset f
#fi

if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
    eval `dbus-launch --sh-syntax --exit-with-session`
fi

syndaemon -t -i 2 -d &
synclient TouchpadOff=2

xrdb -merge "${HOME}/.Xresources"
xsetroot -cursor_name left_ptr

#$HOME/scripts/set-background.sh &
#$HOME/scripts/battery-monitor.sh &
#emacs &
#setxkbmap -layout us,ru -variant intl-unicode-logician,ruu -option grp:rshift_toggle,ctrl:swapcaps,ctrl:ralt_rctrl,lv3:shift, lv3:lctl_switch
setxkbmap -layout us,ru,eml -variant intl-unicode-logician, , -option grp:rshift_toggle,ctrl:ralt_rctrl,lv3:shift
#gsettings set org.gnome.desktop.input-sources xkb-options "['grp:rshift_toggle', 'ctrl:swapcaps', 'ctrl:ralt_rctrl', 'lv3:switch']"
#gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us+intl-unicode-logician'), ('xkb', 'ru+ruu')]"

#exec xmonad
exec gnome-session
