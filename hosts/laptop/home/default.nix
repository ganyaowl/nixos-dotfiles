{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../../modules/home
  ];

  home.username = "ganyaowl";
  home.homeDirectory = "/home/ganyaowl";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
