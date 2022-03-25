
for b in 'firefox-nightly' 'firefox' 'lynx' 'links' 'w3m'
    if [ -x /usr/bin/$b ]
        set -x BROWSER $b
        break
    end
end

if [ -x /usr/bin/vim ]
    set -x EDITOR vim
else
    set -x EDITOR vi
end

set -x VISUAL $EDITOR

if [ -x /usr/bin/most ]
    set -x PAGER most
else
    set -x PAGER less
end

# vim:ts=4:sw=4:et:ft=fish:
