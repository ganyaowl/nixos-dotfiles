{
  description = "Ganyaowl's dotfiles";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-25.11/nixexprs.tar.xz";
    nixpkgs-unstable.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz"; 

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";	
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { 
    self, 
    nixpkgs, 
    nixpkgs-unstable, 
    ... 
  } @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix

	home-manager.nixosModules.home-manager
	{
	  home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.ganyaowl = {
	      imports = [
	        ./home.nix
	      ];
	    }; 
            backupFileExtension = "backup";
	  };
	}
      ];
    };
  };
}
