{
  description = "My NixOS Configuration Flake";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-26.05/nixexprs.tar.xz";
    nixpkgs-unstable.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; 
        modules = [
          ./configuration.nix
	  home-manager.nixosModules.default
	  {
	    home-manager = {
	      useGlobalPkgs = true;
	      useUserPackages = true;
	      extraSpecialArgs = { inherit inputs; };
	      users.ganyaowl = ./home.nix;
	    };
	  }
        ];
      };
    };
  };
}

