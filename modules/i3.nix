{ config, lib, pkgs, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "kitty";

      bars = [
        {
          position = "top";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
        }
      ];

      fonts = {
        names = [ "JetBrainsMono Nerd Font" ];
	size = 11.0;
      };
    };
  };

  programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        theme = "ctp-mocha";
	icons = "nerd-font-v2";
        blocks = [
	  { block = "disk"; path = "/"; }
	  { block = "memory"; }
	  { block = "cpu"; }
	  { block = "battery"; }
	  { block = "sound"; }
	  { block = "time"; }
        ];
      };
    };
  };
}
