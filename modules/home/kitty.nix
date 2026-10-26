{
  config,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    settings = {
      background = "#FFFFFF";
      foreground = "#050505";
      cursor = "#1875D3";
      cursor_text_color = "#FFFFFF";
      selection_background = "#6CB4F4";
      selection_foreground = "#050505";
      url_color = "#08468F";
      color0 = "#3A3A3A";
      color1 = "#B42318";
      color2 = "#28643C";
      color3 = "#805B00";
      color4 = "#1875D3";
      color5 = "#7040A0";
      color6 = "#087E8B";
      color7 = "#D9D9D9";
      color8 = "#666666";
      color9 = "#C53030";
      color10 = "#337A48";
      color11 = "#946B00";
      color12 = "#08468F";
      color13 = "#8950B0";
      color14 = "#086A80";
      color15 = "#FFFFFF";
      active_tab_background = "#1875D3";
      active_tab_foreground = "#FFFFFF";
      inactive_tab_background = "#D9D9D9";
      inactive_tab_foreground = "#3A3A3A";
      tab_bar_background = "#FFFFFF";
    };
    font = {
      name = "JetBrainsMono NF";
      package = pkgs.nerd-fonts.jetbrains-mono;
      size = 14;
    };
  };
}
