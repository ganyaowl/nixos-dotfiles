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
    
    initContent = "source ~/.p10k.zsh";
    plugins = [
      {
        name = "powerlevel10k-config";
        src = ./p10k;
        file = "p10k.zsh";
      }
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
      extended = true;
    };
  };
  
  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [ "git" ];
  };
}
