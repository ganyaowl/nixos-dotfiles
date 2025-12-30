{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../system
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "nixos";
    # networking.wireless.enable = true;

    networkmanager.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;
  };

  time = {
    timeZone = "Asia/Tashkent";
    hardwareClockInLocalTime = true;
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocales = [
      "ru_RU.UTF-8/UTF-8"
    ];
  };

  # services.xserver.enable = true;
  # services.displayManager.gdm.enable = true;
  # services.desktopManager.gnome.enable = true;

  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
    windowManager.qtile.enable = true;
  };
  services.displayManager.ly.enable = true;

  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
    options = "grp:alt_shift_toggle";
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users.users.ganyaowl = {
    isNormalUser = true;
    description = "ganyaowl";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];
  };

  programs = {
    firefox.enable = true;
    niri.enable = true;
    zsh.enable = true;
    seahorse.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # $ nix search <package>
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    xwayland-satellite
    libsecret
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  # services.openssh.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.gnome.gnome-keyring.enable = true;


  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  hardware.bluetooth.enable = true;
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
    ];
  };  

  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "25.11";
}
