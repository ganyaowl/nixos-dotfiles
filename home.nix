{ config, pkgs, ... }:

{
	home.username = "ganyaowl";
	home.homeDirectory = "/home/ganyaowl";
	programs.git.enable = true;
	home.stateVersion = "25.11";
	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo I use nixos, btw";
		};
	};
	
	home.file.".config/qtile".source = ./config/qtile;
	home.file.".config/nvim".source = ./config/nvim;

	home.packages = with pkgs; [
		neovim
		ripgrep
		nil
		nixpkgs-fmt
		nodejs
		gcc
	];
}
