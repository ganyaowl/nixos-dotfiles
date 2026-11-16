{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    extraConfig = {
      modi = "drun,window,run";
      show-icons = true;
    };
  };
}
