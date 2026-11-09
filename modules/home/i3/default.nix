{
  config,
  pkgs,
  ...
}: let
  colors = config.lib.stylix.colors.withHashtag;
  barStyle = config.stylix.targets.i3.exportedBarConfig;
  background = "${colors.base00}e6";
  workspace = text: {
    inherit text background;
    border = background;
  };
in {
  imports = [./keybindings.nix];

  xresources.properties = {
    "Xft.dpi" = 120;
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
          barStyle
          // {
            position = "bottom";
            command = "${pkgs.i3}/bin/i3bar --transparency";
            statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-bottom.toml";
            colors = barStyle.colors // {
              inherit background;
              focusedWorkspace = workspace colors.base0D;
              activeWorkspace = workspace colors.base05;
              inactiveWorkspace = workspace colors.base03;
              urgentWorkspace = workspace colors.base08;
            };
          }
        )
      ];
    };
  };

  programs.i3status-rust = {
    enable = true;
    bars = {
      bottom = {
        settings.theme.theme = "native";
        icons = "material-nf";
        settings.theme.overrides = {
          warning_fg = colors.base09;
          critical_fg = colors.base08;
        };
        blocks = [
          {block = "cpu";}
          {block = "memory";}
          {
            block = "disk_space";
            path = "/";
          }
          {block = "time";}
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
          {block = "battery";}
        ];
      };
    };
  };
}
