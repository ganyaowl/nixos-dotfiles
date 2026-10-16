{...}: {
  programs.git = {
    enable = true;
    lfs.enable = true;

    settings.user = {
      name = "Ganijon Tashmatov";
      email = "nephilim0363@gmail.com";
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };

  programs.mergiraf = {
    enable = true;
    enableGitIntegration = true;
  };
}
