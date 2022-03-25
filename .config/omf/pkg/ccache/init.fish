function init -a path --on-event init_ccache
  set -gx USE_CCACHE 1

  if test -n "$CCACHE_ROOT"
    set -gx PATH $PATH $CCACHE_ROOT
  else
    set -gx PATH $PATH /usr/lib/ccache/bin
  end
end

