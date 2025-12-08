{
  description = "NixOS configuration with Noctalia";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable"; 

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";	
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, ... }: {
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
