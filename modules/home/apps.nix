{
  config,
  pkgs,
  ...
}: {
  programs.zk.enable = true;

  programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    extraConfig = {
      modi = "drun,window,run";
      show-icons = true;
    };
  };

  home.packages = with pkgs; [
    # Desktop & Hardware control
    brightnessctl
    playerctl
    pavucontrol
    maim
    nitrogen

    # Media & Documents viewer
    imv
    feh
    mpv
    zathura
    glow
    mdcat
    imagemagick

    # File management
    yazi
    p7zip
    unzip

    # Utils
    btop
    htop
    yt-dlp

    # for codex
    bubblewrap
  ];
}
