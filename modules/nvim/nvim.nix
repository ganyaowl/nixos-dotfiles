{
  config,
  pkgs,
  pkgs-unstable,
  ...
}: {
  imports = [
    ./nvchad.nix
  ];

  home.packages = with pkgs; [
    neovim
    ripgrep
    nil
    nixpkgs-fmt
  ];
}
