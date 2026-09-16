{
  config,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono NF";
      package = pkgs.nerd-fonts.jetbrains-mono;
      size = 14;
    };
  };
}
