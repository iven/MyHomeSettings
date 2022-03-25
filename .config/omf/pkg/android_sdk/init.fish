function init -a path --on-event init_android_sdk
  if test -n "$ANDROID_SDK_ROOT"
    set -gx PATH $PATH $ANDROID_SDK_ROOT/platform-tools
  else
    set -gx PATH $PATH /opt/android-sdk/platform-tools
  end
end

