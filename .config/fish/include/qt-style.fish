
if [ -d /usr/lib/kde4/plugins ]
    set -x QT_PLUGIN_PATH /home/iven/.kde4/plugins /usr/lib/kde4/plugins
    set -x GTK2_RC_FILES /home/iven/.gtkrc-2.0
end

# vim:ts=4:sw=4:et:ft=fish:
