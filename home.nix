{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  imports = [
    ./modules
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
    obsidian
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };
  
  programs.home-manager.enable = true;
}
