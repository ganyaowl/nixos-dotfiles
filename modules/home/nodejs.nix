{
  config,
  pkgs,
  ...
}:{
  home.packages = with pkgs; [
    nodejs
  ];

  home.file.".npmrc".text = ''
    prefix = ''${HOME}/.npm-global
  '';

  home.sessionPath = [
    "${config.home.homeDirectory}/.npm-global/bin"
  ];
}
