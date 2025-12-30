{
  config,
  pkgs,
  pkgs-unstable,
  ...
}: {
  imports = [
    ./modules
    ./config
    ./hosts/ganyaowl
  ];

  home.username = "ganyaowl";
  home.homeDirectory = "/home/ganyaowl";

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    nodejs
    gcc
    cargo
    rustc

    alacritty
    # fuzzel
    rofi
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
