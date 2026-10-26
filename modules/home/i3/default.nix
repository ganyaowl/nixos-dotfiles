{pkgs, ...}: {
  imports = [./keybindings.nix];

  xresources.properties = {
    "Xft.dpi" = 120;
    #   "Xcursor.size" = 30;
  };

  xsession.windowManager.i3 = {
    enable = true;
    config = {
      terminal = "kitty";
      menu = "${pkgs.dmenu}/bin/dmenu_run -fn 'JetBrainsMono Nerd Font:size=12' -nb '#FFFFFF' -nf '#050505' -sb '#1875D3' -sf '#FFFFFF'";

      gaps.inner = 8;
      gaps.outer = 4;

      startup = [
        {
          command = "${pkgs.feh}/bin/feh --no-fehbg --bg-fill \"$HOME/.background-image\"";
          always = true;
          notification = false;
        }
      ];

      colors = {
        background = "#FFFFFF";
        focused = {
          border = "#1875D3";
          background = "#1875D3";
          text = "#FFFFFF";
          indicator = "#6CB4F4";
          childBorder = "#1875D3";
        };
        focusedInactive = {
          border = "#D9D9D9";
          background = "#D9D9D9";
          text = "#3A3A3A";
          indicator = "#6CB4F4";
          childBorder = "#D9D9D9";
        };
        unfocused = {
          border = "#D9D9D9";
          background = "#FFFFFF";
          text = "#3A3A3A";
          indicator = "#D9D9D9";
          childBorder = "#D9D9D9";
        };
        urgent = {
          border = "#08468F";
          background = "#08468F";
          text = "#FFFFFF";
          indicator = "#1875D3";
          childBorder = "#08468F";
        };
        placeholder = {
          border = "#D9D9D9";
          background = "#FFFFFF";
          text = "#050505";
          indicator = "#D9D9D9";
          childBorder = "#D9D9D9";
        };
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
          position = "top";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-bottom.toml";
          colors = {
            background = "#FFFFFF";
            statusline = "#050505";
            separator = "#D9D9D9";
            focusedWorkspace = {
              border = "#1875D3";
              background = "#1875D3";
              text = "#FFFFFF";
            };
            activeWorkspace = {
              border = "#6CB4F4";
              background = "#D9D9D9";
              text = "#050505";
            };
            inactiveWorkspace = {
              border = "#FFFFFF";
              background = "#FFFFFF";
              text = "#3A3A3A";
            };
            urgentWorkspace = {
              border = "#08468F";
              background = "#08468F";
              text = "#FFFFFF";
            };
            bindingMode = {
              border = "#1875D3";
              background = "#6CB4F4";
              text = "#050505";
            };
          };
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
        settings.theme.theme = "plain";
        settings.theme.overrides = {
          idle_bg = "#FFFFFF";
          idle_fg = "#050505";
          info_bg = "#FFFFFF";
          info_fg = "#1875D3";
          good_bg = "#FFFFFF";
          good_fg = "#08468F";
          warning_bg = "#6CB4F4";
          warning_fg = "#050505";
          critical_bg = "#08468F";
          critical_fg = "#FFFFFF";
          separator = " | ";
          separator_bg = "#FFFFFF";
          separator_fg = "#D9D9D9";
        };
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
