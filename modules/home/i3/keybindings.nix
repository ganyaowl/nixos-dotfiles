{
  config,
  lib,
  pkgs,
  ...
}: let
  exec = command: "exec --no-startup-id ${command}";
  wpctl = lib.getExe' pkgs.wireplumber "wpctl";
  brightnessctl = "${lib.getExe pkgs.brightnessctl} -d intel_backlight";
  playerctl = lib.getExe pkgs.playerctl;
  modifier = config.xsession.windowManager.i3.config.modifier;
in {
  xsession.windowManager.i3.config.keybindings = lib.mkOptionDefault {
    "${modifier}+Return" = exec config.xsession.windowManager.i3.config.terminal;
    "${modifier}+d" = exec config.xsession.windowManager.i3.config.menu;

    "Print" = exec "maim | xclip -selection clipboard -t image/png";
    "Shift+Print" = exec "maim -s | xclip -selection clipboard -t image/png";

    "XF86AudioRaiseVolume" = exec "${wpctl} set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+";
    "XF86AudioLowerVolume" = exec "${wpctl} set-volume @DEFAULT_AUDIO_SINK@ 5%-";
    "XF86AudioMute" = exec "${wpctl} set-mute @DEFAULT_AUDIO_SINK@ toggle";

    "XF86MonBrightnessUp" = exec "${brightnessctl} set +5%";
    # 1067 is 5% of this panel's maximum brightness (21333).
    "XF86MonBrightnessDown" = exec "${brightnessctl} --min-value=1067 set 5%-";

    "XF86AudioPlay" = exec "${playerctl} play-pause";
    "XF86AudioPrev" = exec "${playerctl} previous";
    "XF86AudioNext" = exec "${playerctl} next";

    "${modifier}+Shift+l" = exec "${pkgs.i3lock}/bin/i3lock -c 1e1e2e";
  };
}
