{
  config,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    autoEnable = false;
    polarity = "light";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = config.stylix.fonts.monospace;
      sizes = {
        desktop = 12;
        terminal = 14;
      };
    };
  };

  home-manager.users.ganyaowl.stylix.targets = {
    gtk.enable = true;
    i3.enable = true;
    kitty.enable = true;
    qt.enable = true;
  };
}
