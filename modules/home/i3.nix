{
  config,
  lib,
  pkgs,
  ...
}: {
  xresources.properties = {
    "Xft.dpi" = 120;
    #   "Xcursor.size" = 30;
  };

  xsession.windowManager.i3 = {
    enable = true;
    config = {
      terminal = "kitty";

      keybindings = lib.mkOptionDefault {
        "Print" = "exec --no-startup-id maim | xclip -selection clipboard -t image/png";
        "Shift+Print" = "exec --no-startup-id maim -s | xclip -selection clipboard -t image/png";

        "XF86AudioRaiseVolume" = "exec --no-startup-id ${pkgs.wireplumber}/bin/wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume" = "exec --no-startup-id ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioMute" = "exec --no-startup-id ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

        "XF86MonBrightnessUp" = "exec --no-startup-id ${pkgs.brightnessctl}/bin/brightnessctl -d intel_backlight set +5%";
        # 1067 is 5% of this panel's maximum brightness (21333).
        "XF86MonBrightnessDown" = "exec --no-startup-id ${pkgs.brightnessctl}/bin/brightnessctl -d intel_backlight --min-value=1067 set 5%-";

        "XF86AudioPlay" = "exec --no-startup-id ${pkgs.playerctl}/bin/playerctl play-pause";
        "XF86AudioPrev" = "exec --no-startup-id ${pkgs.playerctl}/bin/playerctl previous";
        "XF86AudioNext" = "exec --no-startup-id ${pkgs.playerctl}/bin/playerctl next";

        "${config.xsession.windowManager.i3.config.modifier}+Shift+l" = "exec --no-startup-id ${pkgs.i3lock}/bin/i3lock -c 1e1e2e";
      };

      window = {
        titlebar = false;
        border = 1;
      };

      floating = {
        titlebar = false;
        border = 1;
      };

      bars = [
        {
          position = "bottom";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-bottom.toml";
          fonts = {
            names = ["JetBrainsMono Nerd Font"];
            size = 12.0;
          };
        }
      ];

      fonts = {
        names = ["JetBrainsMono Nerd Font"];
        size = 14.0;
      };
    };
  };

  programs.i3status-rust = {
    enable = true;
    bars = {
      bottom = {
        theme = "ctp-mocha";
        icons = "material-nf";
        blocks = [
          {
            block = "disk_space";
            path = "/";
          }
          {block = "memory";}
          {block = "cpu";}
          {block = "battery";}
          {block = "sound";}
          {block = "time";}
        ];
      };
    };
  };
}
