{
  config,
  lib,
  pkgs,
  ...
}: {
  xresources.properties = {
    "Xft.dpi" = 120;
    "Xcursor.size" = 30;
  };

  xsession.windowManager.i3 = {
    enable = true;
    config = {
      terminal = "kitty";

      bars = [
        {
          position = "top";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
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
      top = {
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
