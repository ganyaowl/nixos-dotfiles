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
    nitrogen

    # Media & Documents viewer
    imv
    feh
    mpv
    zathura
    glow
    mdcat
    imagemagick
    kdePackages.gwenview
    kdePackages.okular

    # File management
    yazi
    p7zip
    unzip
    kdePackages.dolphin
    kdePackages.ark

    # Utils
    btop
    htop
    yt-dlp
    kdePackages.kate

    # for codex
    bubblewrap
  ];
}
