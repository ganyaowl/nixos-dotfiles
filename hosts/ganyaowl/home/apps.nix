{
  pkgs,
  pkgs-unstable,
  ...
}: {
  # TO DO https://github.com/vanutp/the-config/blob/79644533a21be402b61efc5e1228729984067fdc/hosts/dull-vessel/home/apps.nix#L7

  home.packages = with pkgs; [
    p7zip
    obsidian
    vesktop
    libreoffice-fresh
    nautilus
    thunderbird
    meld
  ];


}
