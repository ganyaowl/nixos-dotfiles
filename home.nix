{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./modules
  ];

  home.username = "ganyaowl";
  home.homeDirectory = "/home/ganyaowl";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
      extended = true;
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = ["git" "z"];
    };
  };

  programs.kitty.enable = true;
}
