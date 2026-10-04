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
