{
  config,
  pkgs,
  ...
}: {
  imports = [./keybindings.nix];

  xresources.properties = {
    "Xft.dpi" = 120;
    #   "Xcursor.size" = 30;
  };

  xsession.windowManager.i3 = {
    enable = true;
    config = {
      terminal = "kitty";
      menu = "${config.programs.rofi.package}/bin/rofi -show drun";

      startup = [
        {
          command = "${pkgs.nitrogen}/bin/nitrogen --restore";
          always = true;
          notification = false;
        }
      ];

      window = {
        titlebar = false;
        border = 0;
      };

      floating = {
        titlebar = false;
        border = 0;
      };

      bars = [
        (
          {
            position = "bottom";
            statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-bottom.toml";
          }
          // config.stylix.targets.i3.exportedBarConfig
        )
      ];
    };
  };

  programs.i3status-rust = {
    enable = true;
    bars = {
      bottom = {
        theme = "ctp-latte";
        icons = "material-nf";
        blocks = [
          {
            block = "disk_space";
            path = "/";
          }
          {block = "memory";}
          {block = "cpu";}
          {block = "battery";}
          {
            block = "net";
            device = "^wl.*";
            format = " $icon ";
            inactive_format = " $icon × ";
            click = [
              {
                button = "left";
                cmd = "${pkgs.kitty}/bin/kitty ${pkgs.networkmanager}/bin/nmtui";
              }
            ];
          }
          {block = "sound";}
          {block = "time";}
        ];
      };
    };
  };
}
