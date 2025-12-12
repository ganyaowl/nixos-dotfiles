{
  config,
  pkgs,
  ...
}:

{
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
  
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";

    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      la = "ls -la";
      update = "sudo nixos-rebuild switch --flake .#nixos";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
      extended = true;
    };
  };
  programs.home-manager.enable = true;
}
