{
  config,
  pkgs,
  ...
}: {
  programs.zk.enable = true;

  home.packages = with pkgs; [
    # Desktop & Hardware control
    brightnessctl
    playerctl
    pavucontrol
    maim

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
