
set -x MOZ_DISABLE_PANGO 1

if [ -d /usr/lib/mozilla/plugins ]
    set -x MOZ_PLUGIN_PATH /usr/lib/mozilla/plugins
end

# vim:ts=4:sw=4:et:ft=fish:
