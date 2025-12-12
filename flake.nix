{
  description = "Ganyaowl's dotfiles";

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
    home-manager,
    ... 
  } @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
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
