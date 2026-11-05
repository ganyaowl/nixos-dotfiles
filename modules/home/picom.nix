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
      "100:class_g = 'Rofi'"
      "95:window_type = 'normal' && class_g != 'Rofi' && class_g != 'i3lock' && !_NET_WM_STATE@ *= '_NET_WM_STATE_FULLSCREEN'"
    ];
  };
}
