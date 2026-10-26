{
  config,
  pkgs,
  ...
}: {
  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;
    fade = false;
    shadow = false;
    opacityRules = [
      "85:window_type = 'normal' && class_g != 'i3lock' && !_NET_WM_STATE@:32a *= '_NET_WM_STATE_FULLSCREEN'"
    ];
  };
}
