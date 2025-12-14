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
    docker-compose-language-service
    dockerfile-language-server
    emmet-language-server
    nixd
    nil
    nixpkgs-fmt
  ];
}
