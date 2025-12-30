{
  pkgs,
  inputs,
  ...
}: {
  services.syncthing.enable = true;

  home.packages = with pkgs; [
    # cli
    openssl
    lm_sensors
    yt-dlp
    xh
    ffmpeg-full
    manix
    imagemagick
    yubikey-manager
    backblaze-b2
    ltrace
    minio-client
    unzip
    cava
    btop

    # de
    xorg.xhost
    wev
    wl-clipboard
    brightnessctl
    playerctl
    copyq
    pavucontrol

    # wm - qtile
    picom
    xserver-xephyr
    nitrogen
  ];
}
