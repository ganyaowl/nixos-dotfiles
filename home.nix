{ config, pkgs, ... }:

{
	home.username = "ganyaowl";
	home.homeDirectory = "/home/ganyaowl";
	programs.git.enable = true;
	home.stateVersion = "25.11";
	
	programs.zsh = {
		enable = true;
		dotDir = "${config.xdg.configHome}/zsh";
		
		enableCompletion = true;	
		syntaxHighlighting.enable = true;	

		shellAliases = {
			ll = "ls -l";
			update = "sudo nixos-rebuild switch --flake .#nixos";
		};
		
		history = {
			size = 10000;
			path = "${config.xdg.dataHome}/zsh/history";
			extended = true; 
		};
	};

	
	# home.file.".config/nvim".source = ./config/nvim;

	home.packages = with pkgs; [
		neovim
		ripgrep
		nil
		nixpkgs-fmt
		nodejs
		gcc
		
		# niri stuff
		fuzzel
		alacritty
		waybar
	];

}
