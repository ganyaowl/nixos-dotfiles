{ config, pkgs, ... }:

{
  home.username = "ganyaowl";
  home.homeDirectory = "/home/ganyaowl";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    histSize = 10000;
    histFile = "$HOME/zsh_history";

    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "z" ];
    };
  };
}
