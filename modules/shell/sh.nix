{
  config,
  pkgs,
  ...
}: let
  myAliases = {
    la = "ls -la";
    ".." = "cd ..";
    update = "sudo nixos-rebuild switch --flake .#nixos";
  };
in {
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";

    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = myAliases;

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
      extended = true;
    };
  };
}
