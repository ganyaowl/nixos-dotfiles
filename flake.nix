{
  description = "NixOS configuration with Noctalia";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";	
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
	home-manager.nixosModules.home-manager
	{
	  home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.ganyaowl = import ./home.nix;
            backupFileExtension = "backup";
	  };
	}
      ];
    };
  };
}
