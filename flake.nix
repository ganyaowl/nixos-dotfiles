{
  description = "My NixOS Configuration Flake";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-26.05/nixexprs.tar.xz";
    nixpkgs-unstable.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
  in {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/laptop
          home-manager.nixosModules.default
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {inherit inputs;};
              users.ganyaowl = ./hosts/laptop/home;
            };
          }
        ];
      };
    };

    devShells.${system} = {
      python = pkgs.mkShell {
        packages = with pkgs; [
          python3
          ruff
        ];

        shellHook = ''
          exec zsh
        '';
      };

      go = pkgs.mkShell {
        packages = with pkgs; [
          go
        ];

        shellHook = ''
          exec zsh
        '';
      };

      ai = pkgs-unstable.mkShell {
        packages = with pkgs-unstable; [
          gemini-cli
          codex
        ];

        shellHook = ''
          if [ -f .env ]; then
            set -a
            source .env
            set +a
            echo "Loaded .env variables"
          else
            echo -e "\033[0;31mWarning: .env file not found. Set your API keys to use CLI tools.\033[0m"
          fi

          exec zsh
        '';
      };
    };

    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
