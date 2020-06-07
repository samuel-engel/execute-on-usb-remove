notify-send "Alert" "Logged out at ${date +%T}"
shutdown +5
dbus-send --type=method_call --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock
