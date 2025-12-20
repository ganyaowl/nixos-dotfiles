{
  description = "Ganyaowl's dotfiles";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-25.11/nixexprs.tar.xz";
    nixpkgs-unstable.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz"; 

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";	
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # rice stuff
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.quickshell.follows = "quickshell"; # Use same quickshell version
    };
    matugen = {
      url = "github:/InioX/Matugen";
    }; 
    vicinae = {
      url = "github:vicinaehq/vicinae";
    };
    affinity-nix.url = "github:mrshmllow/affinity-nix";
    # end of rice stuff

    nix4nvchad = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { 
    self, 
    nixpkgs, 
    nixpkgs-unstable, 
    home-manager,
    ... 
  } @ inputs: 
  let
    system = "x86_64-linux";
    
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit pkgs-unstable inputs;
      };

      modules = [
        ./hosts/ganyaowl/home/configuration.nix
	      
        home-manager.nixosModules.home-manager
	      {
	        home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {
	            inherit pkgs-unstable inputs;
	          };
            
            users.ganyaowl = {
	            imports = [
	              ./home.nix
	            ]; 
	          }; 
            backupFileExtension = "backup";
	        };
	      }

        inputs.noctalia.nixosModules.default
        inputs.niri.nixosModules.niri
        {
          nixpkgs.overlays = [niri.overlays.niri];
        }
        {
          environment.systemPackages = [affinity-nix.packages.x86_64-linux.v3];
        }
      ];
    };
  };
}
