{
  config,
  pkgs,
  ...
}: let
  catppuccin = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "rofi";
    rev = "71fb15577ccb091df2f4fc1f65710edbc61b5a53";
    hash = "sha256-81eeFjwM/haPjIEWkZPp1JSDwhWbWDAuKtWiCg7P9Q0=";
  };
in {
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    font = "${config.stylix.fonts.monospace.name} ${toString config.stylix.fonts.sizes.popups}";
    theme = toString (pkgs.runCommand "catppuccin-latte.rasi" {} ''
      cat ${catppuccin}/themes/catppuccin-latte.rasi \
        ${catppuccin}/catppuccin-default.rasi > "$out"
    '');
    extraConfig = {
      modi = "drun,window,run";
      show-icons = true;
    };
  };
}
