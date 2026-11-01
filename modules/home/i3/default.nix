{
  config,
  pkgs,
  ...
}: let
  colors = config.lib.stylix.colors.withHashtag;
in {
  imports = [./keybindings.nix];

  xresources.properties = {
    "Xft.dpi" = 120;
    #   "Xcursor.size" = 30;
  };

  xsession.windowManager.i3 = {
    enable = true;
    config = {
      terminal = "kitty";
      menu = "${pkgs.dmenu}/bin/dmenu_run -fn 'JetBrainsMono Nerd Font:size=12' -nb '${colors.base00}' -nf '${colors.base05}' -sb '${colors.base0D}' -sf '${colors.base00}'";

      gaps.inner = 8;
      gaps.outer = 4;

      startup = [
        {
          command = "${pkgs.nitrogen}/bin/nitrogen --restore";
          always = true;
          notification = false;
        }
      ];

      window = {
        titlebar = false;
        border = 1;
      };

      floating = {
        titlebar = false;
        border = 1;
      };

      bars = [
        (
          {
            position = "top";
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
        settings.theme.theme = "plain";
        settings.theme.overrides =
          config.lib.stylix.i3status-rust.bar
          // {separator = " | ";};
        icons = "material-nf";
        blocks = [
          {
            block = "music";
            format = " $icon {$combo.str(w:20,rot_interval:0.7) $play |}";
            click = [
              {
                button = "left";
                action = "play_pause";
              }
            ];
          }
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
          {
            block = "custom";
            command = ":";
            interval = "once";
            format = " ^icon_bluetooth ";
            click = [
              {
                button = "left";
                cmd = "QT_QPA_PLATFORM=xcb ${pkgs.kdePackages.kcmutils}/bin/kcmshell6 kcm_bluetooth";
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
