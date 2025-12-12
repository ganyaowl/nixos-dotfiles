{
  pkgs,
  pkgs-unstable,
  config,
  lib,
  ...
}: {
  home.packages = [pkgs-unstable.mergiraf];
  programs.git = lib.mkIf (config.home.username == "ganyaowl") {
    enable = true;
    lfs.enable = true;
    settings = {
      user = {
        name = "Ganijon Tashmatov";
        email = "nephilim0363@gmail.com";
      };
      core.attributesfile = builtins.toString (pkgs.runCommand "gitattributes" {} ''
        ${lib.getExe pkgs-unstable.mergiraf} languages --gitattributes > $out
      '');
      "merge \"mergiraf\"" = {
        name = "mergiraf";
        driver = "mergiraf merge --git %O %A %B -s %S -x %X -y %Y -p %P -l %L";
      };
    };
  };
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };
}
