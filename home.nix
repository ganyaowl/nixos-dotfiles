{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./modules/shell/sh.nix
  ];

  home.username = "ganyaowl";
  home.homeDirectory = "/home/ganyaowl";

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    neovim
    ripgrep
    nil
    nixpkgs-fmt

    nodejs
    gcc

    alacritty
    fuzzel
    waybar
    swaybg

    obsidian
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };
  
  programs.home-manager.enable = true;
}
