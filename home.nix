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

  programs.zk.enable = true;

  home.packages = with pkgs; [
    basalt
  ];
}
