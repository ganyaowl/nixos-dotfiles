{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  imports = [
    ./modules
    ./hosts/ganyaowl
  ];

  home.username = "ganyaowl";
  home.homeDirectory = "/home/ganyaowl";

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    nodejs
    gcc

    alacritty
    fuzzel
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  
  programs.home-manager.enable = true;
}
